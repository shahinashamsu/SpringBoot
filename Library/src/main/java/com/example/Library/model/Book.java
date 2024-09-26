package com.example.Library.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@NoArgsConstructor
@Entity
@Table(name = "library")
public class Book {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer id;
private String bookName;
private String authorName;
private boolean borrowed;
private String borrowedBy;
}
