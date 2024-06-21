package com.itdevelopment.repositories;

import com.itdevelopment.models.Account;

import com.itdevelopment.models.AccountType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends CrudRepository<Account,Long> {

//List<Account>findAll();

    List<Account> findAllByCustomerId(Long customerId);
    Optional<Account> findByAccountNumber(String accountNumber);


    Optional<Account> findById(Long id);


}
