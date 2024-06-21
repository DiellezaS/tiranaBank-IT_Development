package com.itdevelopment.controllers;


import com.itdevelopment.models.Account;
import com.itdevelopment.models.Transaction;
import com.itdevelopment.services.AccountService;
import com.itdevelopment.services.TransactionService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.List;

@Controller
public class TransactionController {
    @Autowired
    private TransactionService transactionService;
    @Autowired
    private AccountService accountService;

    @GetMapping("/createTransactionView")
    public String createTransactionView(@ModelAttribute("newTransaction")Transaction newTransaction, HttpSession session, Model model){
        if(session.getAttribute("loggedInCustomerId") == null) {
            return "redirect:/logout";
        }

        Long customerId=(Long) session.getAttribute("loggedInCustomerId");
        List<Account> accounts=accountService.getAllAccountsByCustomerId(customerId);
        model.addAttribute("accounts", accounts);
        return "createTransaction";
    }

    @PostMapping("/createTransaction")
    public String createTransaction(@Valid@ModelAttribute("newTransaction")Transaction newTransaction,
                                    BindingResult result,
                                    Model model){
        if(result.hasErrors()){
            return "createTransaction";
        }

        try {
            transactionService.createTransaction(newTransaction);
            return "redirect:/dashboard";
        } catch (IllegalArgumentException e) {
            model.addAttribute("transactionError", e.getMessage());
            return "createTransaction";
        }
    }

    @GetMapping("/download/pdf")
    public void downloadTransactionsPDF(HttpServletResponse response) throws IOException {
        byte[] pdfBytes = transactionService.generatePDF(); // Assuming generatePDF() method exists in TransactionService
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=transactions.pdf");
        response.getOutputStream().write(pdfBytes);
    }

    @GetMapping("/download/csv")
    public void downloadTransactionsCSV(HttpServletResponse response) throws IOException {
        byte[] csvBytes = transactionService.generateCSV(); // Assuming generateCSV() method exists in TransactionService
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=transactions.csv");
        response.getOutputStream().write(csvBytes);
    }
}