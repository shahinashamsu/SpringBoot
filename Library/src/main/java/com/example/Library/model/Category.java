package com.example.Library.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Data
@NoArgsConstructor
@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Unique category ID

    private String type; // Category name

    @OneToMany(mappedBy = "category") // This implies a one-to-many relationship
    private List<Book> books; // List of books in this category
}
