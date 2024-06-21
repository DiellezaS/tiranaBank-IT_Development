package com.itdevelopment.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "Name is required!")
    @Size(min = 2, max = 30, message = "Name must have at least 2 letters")
    private String name;
    @NotEmpty(message = "Lastname is required!")
    @Size(min = 2, max = 30, message = "Lastname must have at least 2 letters")
    private String lastname;
    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;
    @NotEmpty(message = "Age is required!")
    @Min(value = 18, message = "Allowed age is 18+")
    private String age;
    @NotEmpty(message = "Personal Number is required!")
    @Pattern(regexp = "^[a-zA-Z]\\d{8}[a-zA-Z]$", message = "Personal Number-Id Invalid format Expected pattern: Letter-Numbers-Letter")
    private String personalNumberId;
    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    private String password;

    private String passConfirm;
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


    @Column(updatable=false)
    @OneToMany(mappedBy="customer", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private List<Account>accounts;

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ",lastname"+lastname+'\''+
                ", email='" + email + '\'' +
                ", personalNumberId='" + personalNumberId + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}