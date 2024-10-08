package com.example.Library.repository;

import com.example.Library.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Integer> {
    List<Book> findAll();
    List<Book> findByBorrowed(boolean b);
}
