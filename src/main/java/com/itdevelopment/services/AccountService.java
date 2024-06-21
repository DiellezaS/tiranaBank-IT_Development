package com.itdevelopment.services;

import com.itdevelopment.models.Account;
import com.itdevelopment.models.Customer;
import com.itdevelopment.repositories.AccountRepository;
import com.itdevelopment.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
public class AccountService {

//    @Autowired
//    public AccountRepository accountRepository;
//
//    public Optional<Account> getAccountByCustomerId(Long customerId) {
//        return accountRepository.findById(customerId);
//    }
//    public List<Account>findAll(){
//        return accountRepository.findAll();
//    }
//
//    public Optional<Account> findAccountById(Long id) {
//        return accountRepository.findById(id);
//    }
//    public Account create(Account account) {
//        return accountRepository.save(account);
//    }
//
//    public void deleteAccountById(Long id) {
//        accountRepository.deleteById(id);
//    }





    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private CustomerRepository customerRepository;

    public List<Account> getAllAccountsByCustomerId(Long customerId){
        return accountRepository.findAllByCustomerId(customerId);
    }
    public Account createAccount(Account account, Long customerId){
        Optional<Customer> customer = customerRepository.findById(customerId);
        account.setCustomer(customer.get());
        account.setAccountNumber(generateAccountNumber());
        return accountRepository.save(account);
    }

    private String generateAccountNumber(){
        Random random=new Random();
        StringBuilder accountNumber=new StringBuilder();
        for (int i=0; i<10;i++){
            int digit=random.nextInt(10);
            accountNumber.append(digit);
        }
        return accountNumber.toString();
}

    public Account getById(Long id){
        Optional<Account> account=accountRepository.findById(id);
        return account.orElse(null);
    }
}