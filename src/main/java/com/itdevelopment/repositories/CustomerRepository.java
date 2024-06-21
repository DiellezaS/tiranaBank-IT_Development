package com.itdevelopment.repositories;

import com.itdevelopment.models.Customer;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


    @Repository
    public interface CustomerRepository extends CrudRepository<Customer, Long> {
        Optional<Customer> findByPersonalNumberId(String personalNumberId);
//        List<Customer>findAll();
//        Customer findByIdIs(Long id);
    }
