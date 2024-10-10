package com.example.Library.repository;

import com.example.Library.model.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {
    boolean existsByBookName(String bookName);
    Page<Book> findByBookNameContainingIgnoreCase(String name, Pageable pageable);
    long countByBookNameContainingIgnoreCase(String name);
    Page<Book> findByBookNameContainingAndCategoryId(String bookName, Integer categoryId, Pageable pageable);
    Page<Book> findByCategoryId(Integer categoryId, Pageable pageable);
    Page<Book> findByBookNameContaining(String search, Pageable pageable);
}
