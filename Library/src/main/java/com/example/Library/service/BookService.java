package com.example.Library.service;

import com.example.Library.model.Book;
import com.example.Library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    public void addBook(Book book) {
        bookRepository.save(book);
    }

    public List<Book> showAllBooks() {
        return bookRepository.findAll();
    }

    public String borrowBook(Book bookModel) {
        Book bookToBorrow = bookRepository.findById(bookModel.getId()).orElse(null);

        if (bookToBorrow == null) {
            return "Book with ID " + bookModel.getId() + " not found.";
        }

        if (bookToBorrow.isBorrowed()) {
            return "Book is already borrowed.";
        }

        bookToBorrow.setBorrowed(true);
        bookToBorrow.setBorrowedBy(bookModel.getBorrowedBy());
        bookRepository.save(bookToBorrow);

        return "Book borrowed successfully.";
    }

    public List<Book> getAvailableBooks() {

       // System.out.println(bookRepository.findByBorrowed(false));
        return bookRepository.findByBorrowed(false);
    }
}
