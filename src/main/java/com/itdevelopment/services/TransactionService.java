package com.itdevelopment.services;

import com.itdevelopment.models.Account;
import com.itdevelopment.models.AccountType;
import com.itdevelopment.models.Customer;
import com.itdevelopment.models.Transaction;
import com.itdevelopment.repositories.AccountRepository;
import com.itdevelopment.repositories.TransactionRepository;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private AccountRepository accountRepository;


    public Transaction createTransaction(Transaction transaction) {
        Optional<Account> account = accountRepository.findById(transaction.getDebitAccount().getId());
        Optional<Account> creditAccountOpt = accountRepository.findByAccountNumber(transaction.getCreditAccount());
        if (creditAccountOpt.isEmpty()) {
            throw new IllegalArgumentException("Credit Account Number does not exist!");
        }
        Account creditAccount = creditAccountOpt.get();
        Account debitAccount = account.get();

        if (!debitAccount.getCurrency().equals(creditAccount.getCurrency())) {
            throw new IllegalArgumentException("Debit and Credit Account must have the same currency!");
        }

        if (debitAccount.getAccount_type().equals(AccountType.Loan)) {
            throw new IllegalArgumentException("You cannot debit a loan account!");
        }
        double amount = transaction.getAmount();
        if (debitAccount.getBalance() < amount) {
            throw new IllegalArgumentException("This account does not have sufficient balance!");
        }

        debitAccount.setBalance(debitAccount.getBalance() - amount);
        creditAccount.setBalance(creditAccount.getBalance() + amount);

        accountRepository.save(debitAccount);
        accountRepository.save(creditAccount);

        transaction.setDebitAccount(debitAccount);
        transaction.setCreditAccount(creditAccount.getAccountNumber());

        return transactionRepository.save(transaction);
    }

    public List<Transaction> getAllTransactionsByDebitAccountId(Long id) {
        return transactionRepository.findAllByDebitAccountId(id);
    }

    public List<Transaction> getAllTransactionsByCreditAccountNumber(String creditAccountNumber) {
        return transactionRepository.findAllByCreditAccountContains(creditAccountNumber);
    }

    public List<Transaction> getAllTransactionsByDebitIdBetweenDate(Long id, Date startDate, Date endDate) {
        return transactionRepository.findTransactionsByDebitAccountIdAndTransactionDateBetween(id, startDate, endDate);
    }

    public List<Transaction> getAllTransactionsByCreditIdBetweenDate(String accountNumber, Date startDate, Date endDate) {
        return transactionRepository.findTransactionsByCreditAccountAndTransactionDateBetween(accountNumber, startDate, endDate);
    }


    public byte[] generatePDF() throws IOException {
        List<Transaction> transactions = transactionRepository.findAll();

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PDDocument pdfDocument = new PDDocument();

        try {
            PDPage page = new PDPage();
            pdfDocument.addPage(page);

            PDPageContentStream contentStream = new PDPageContentStream(pdfDocument, page);
            contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);
            contentStream.beginText();
            contentStream.newLineAtOffset(0, 20);
            float margin = 50;
            float yStart = page.getMediaBox().getHeight() - margin;
            float tableWidth = page.getMediaBox().getWidth() - 2 * margin;
            float yPosition = yStart;
            int rows = 5; // Number of rows in the table
            int cols = 3; // Number of columns in the table


            for (Transaction transaction : transactions) {
                contentStream.showText("Transaction Date: " + transaction.getTransactionDate());
                contentStream.newLine();
                contentStream.newLine();
                contentStream.showText("Description: " + transaction.getDescription());
                contentStream.newLine();
                contentStream.showText("Debit Account: " + transaction.getDebitAccount());
                contentStream.newLine();
                contentStream.showText("Credit Account: " + transaction.getCreditAccount());
                contentStream.newLine();
                contentStream.showText("Amount: " + transaction.getAmount());
                contentStream.newLine();


                contentStream.newLineAtOffset(0, 10);
            }

            contentStream.endText();
            contentStream.close();

            pdfDocument.save(baos);
            pdfDocument.close();

            return baos.toByteArray();
        } finally {
            if (pdfDocument != null) {
                pdfDocument.close();
            }
            if (baos != null) {
                baos.close();
            }
        }
    }
    public byte[] generateCSV() throws IOException {
        List<Transaction> transactions = (List<Transaction>) transactionRepository.findAll();

        try (ByteArrayOutputStream baos = new ByteArrayOutputStream();
             OutputStreamWriter writer = new OutputStreamWriter(baos)) {


            writer.append("Transaction Date,Description,Debit Account,Credit Account,Amount\n");


            for (Transaction transaction : transactions) {
                writer.append(String.valueOf(transaction.getTransactionDate())).append(",");
                writer.append(String.valueOf(transaction.getDescription())).append(",");
                writer.append(String.valueOf(transaction.getDebitAccount())).append(",");
                writer.append(String.valueOf(transaction.getCreditAccount())).append(",");
                writer.append(String.valueOf(transaction.getAmount())).append(",");


                writer.append("\n");
            }

            writer.flush();
            return baos.toByteArray();
        }
    }

    private static void drawTableHeader(PDPageContentStream contentStream, float xStart, float yStart, float[] columnWidths) throws IOException {
        contentStream.setFont(PDType1Font.TIMES_BOLD, 12);
        float xPosition = xStart;
        float yPosition = yStart;
        for (float width : columnWidths) {
            contentStream.beginText();
            contentStream.newLineAtOffset(xPosition, yPosition);
            contentStream.showText("Header");
            contentStream.endText();
            xPosition += width;
        }
    }

    // Method to draw a row in the table
    private static void drawRow(PDPageContentStream contentStream, float xStart, float yStart, float[] columnWidths, String... cellText) throws IOException {
        contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);
        float xPosition = xStart;
        float yPosition = yStart;
        for (int i = 0; i < columnWidths.length; i++) {
            contentStream.beginText();
            contentStream.newLineAtOffset(xPosition, yPosition);
            contentStream.showText(cellText[i]);
            contentStream.endText();
            xPosition += columnWidths[i];
        }
    }
}
