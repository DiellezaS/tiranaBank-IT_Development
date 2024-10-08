package com.itdevelopment.models;


import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;


import java.util.Date;
import java.util.List;
import java.util.UUID;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "accounts")
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Size(min = 10, max = 10)
    private String accountNumber;

    @Enumerated(EnumType.STRING)
    private AccountType account_type;

    @Enumerated(EnumType.STRING)
    private Currency currency;

    @NotNull
    @Min(0)
    private double balance;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="customer_id")
    private Customer customer;

    @Column(updatable=false)
    @OneToMany(mappedBy="debitAccount", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private List<Transaction> account_transactions;

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", accountNumber='" + accountNumber + '\'' +
                ", account_type=" + account_type +
                ", currency=" + currency +
                ", balance=" + balance +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Getter
//@Setter
//@Entity
//@Table(name = "accounts")
//public class Account {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @Size(min = 10, max = 10)
//    private String accountNumber;
//
//    @Enumerated(EnumType.STRING)
//    private AccountType account_type;
//
//    @Enumerated(EnumType.STRING)
//    private Currency currency;
//
//    @NotNull
//    @Min(0)
//    private double balance;
//
//
//    @Column(updatable = false)
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private Date createdAt;
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private Date updatedAt;
//
//    @PrePersist
//    protected void onCreate() {
//        this.createdAt = new Date();
//    }
//
//    @PreUpdate
//    protected void onUpdate() {
//        this.updatedAt = new Date();
//    }
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name="customer_id")
//    private Customer customer;
//
//    @Column(updatable=false)
//    @OneToMany(mappedBy = "debitAccount", cascade = CascadeType.ALL)
//    private List<Transaction> transactions;
//
//    @Override
//    public String toString() {
//        return "Account{" +
//                "id=" + id +
//                ", accountNumber='" + accountNumber + '\'' +
//                ", account_type=" + account_type +
//                ", currency=" + currency +
//                ", balance=" + balance +
//                ", createdAt=" + createdAt +
//                ", updatedAt=" + updatedAt +
//                '}';
//    }
//}
