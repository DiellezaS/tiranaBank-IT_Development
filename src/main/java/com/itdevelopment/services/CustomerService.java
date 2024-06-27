package com.itdevelopment.services;

import com.itdevelopment.models.Customer;
import com.itdevelopment.models.loginCustomer;
import com.itdevelopment.repositories.AccountRepository;
import com.itdevelopment.repositories.CustomerRepository;
import lombok.*;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.Optional;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

@Service
public class CustomerService {


    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AccountRepository accountRepository;


    public Customer register(Customer newCustomer, BindingResult result) {

        Optional<Customer> potentialCustomer = this.customerRepository.findByPersonalNumberId(newCustomer.getPersonalNumberId());

        if (potentialCustomer.isPresent()) {
            result.rejectValue("PersonalId", "PersonalIdTaken", "Personal id is already in use.");
        }

        if (!newCustomer.getPassword().equals(newCustomer.getPassConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        if (result.hasErrors()) {
            return null;
        }
        else {
            String hashed = BCrypt.hashpw(newCustomer.getPassword(), BCrypt.gensalt());
            newCustomer.setPassword(hashed);
            return customerRepository.save(newCustomer);
        }

    }

    public Customer login(loginCustomer newLogin, BindingResult result) {


        Optional<Customer> potentialCustomer = this.customerRepository.findByPersonalNumberId(newLogin.getPersonalNumberId());


        if (!potentialCustomer.isPresent()) {
            result.rejectValue("personalNumberId", "PersonalIdNotFound", "No user found with that Personal Id address.");
        } else {

            if (!BCrypt.checkpw(newLogin.getPassword(), potentialCustomer.get().getPassword())) {

                result.rejectValue("password", "Matches", "Invalid Password!");
            }
        }

        if (result.hasErrors()) {

            return null;
        } else {

            return potentialCustomer.get();
        }
    }
    public Customer findCustomerById(Long id){
        return this.customerRepository.findById(id).orElse(null);
    }
}