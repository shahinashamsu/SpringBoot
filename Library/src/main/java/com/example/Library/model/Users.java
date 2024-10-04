package com.example.Library.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Data
public class Users {

    @Id
    private Integer id;
    private String username;
    private String password;
}
