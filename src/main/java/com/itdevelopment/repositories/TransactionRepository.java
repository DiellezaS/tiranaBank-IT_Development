package com.itdevelopment.repositories;

import com.itdevelopment.models.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface TransactionRepository extends CrudRepository<Transaction,Long> {

    List<Transaction> findAllByDebitAccountId(long accountId);

    List<Transaction>findAll();
    List<Transaction> findAllByCreditAccountContains(String creditAccountNumber);

    List<Transaction> findTransactionsByDebitAccountIdAndTransactionDateBetween(Long id, Date startDate, Date endDate);
    List<Transaction> findTransactionsByCreditAccountAndTransactionDateBetween(String accountNumber, Date startDate, Date endDate);
}

