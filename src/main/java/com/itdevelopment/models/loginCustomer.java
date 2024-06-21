package com.itdevelopment.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
    public class loginCustomer {

        @NotEmpty(message = "Personal Number is required!")
        @Pattern(regexp = "^[a-zA-Z]\\d{8}[a-zA-Z]$", message = "Personal Number-Id Invalid format Expected pattern: Letter-Numbers-Letter")
        private String personalNumberId;

        @NotEmpty(message="Password is required!")
        @Size(min=8, max=128, message="Password must be at least 8 characters")
        private String password;
    }


