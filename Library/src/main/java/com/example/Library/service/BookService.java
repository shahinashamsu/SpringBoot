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

    public boolean borrowBook(Integer bookId, String borrowerName) {
        Book book = bookRepository.findById(bookId).orElse(null);
        if (book != null && !book.isBorrowed()) {
            book.setBorrowed(true);
            book.setBorrowedBy(borrowerName);
            bookRepository.save(book);
            return true;
        }
        return false;
    }

    public void deleteBook(Integer bookId) {
        bookRepository.deleteById(bookId);
    }

}
