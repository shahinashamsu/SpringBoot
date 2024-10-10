package com.example.Library.service;

import com.example.Library.exception.BookAlreadyExistsException;
import com.example.Library.model.Book;
import com.example.Library.model.Category;
import com.example.Library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    // Add a new book with duplicate check
    public void addBook(Book book) {
        // Check if a book with the same name already exists
        if (bookRepository.existsByBookName(book.getBookName())) {
            throw new BookAlreadyExistsException("Book with the name '" + book.getBookName() + "' already exists.");
        }

        // Save the book if it doesn't already exist
        bookRepository.save(book);
    }

    // Get paginated list of all books
    public Page<Book> getPaginatedBooks(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        return bookRepository.findAll(pageable);
    }

    // Search for books by name with pagination
    public Page<Book> searchBooksByName(String name, int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        return bookRepository.findByBookNameContainingIgnoreCase(name, pageable);
    }

    // Other methods as defined previously...

    public boolean borrowBook(Integer bookId, String borrowerName) {
        Optional<Book> optionalBook = bookRepository.findById(bookId);
        if (optionalBook.isPresent()) {
            Book book = optionalBook.get();
            if (!book.isBorrowed()) {
                book.setBorrowed(true);
                book.setBorrowedBy(borrowerName);
                bookRepository.save(book);
                return true;
            }
        }
        return false;
    }

    // Delete a book
    public void deleteBook(Integer bookId) {
        bookRepository.deleteById(bookId);
    }

    // Count total number of books
    public long countAllBooks() {
        return bookRepository.count();
    }

    // Count total search results
    public long countSearchResults(String name) {
        return bookRepository.countByBookNameContainingIgnoreCase(name);
    }

    // Search books by name and category with pagination
    public Page<Book> searchBooksByNameAndCategory(String search, Integer categoryId, int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        if (categoryId != null) {
            return bookRepository.findByBookNameContainingAndCategoryId(search, categoryId, pageable);
        } else {
            return bookRepository.findByBookNameContaining(search, pageable);
        }
    }

    // Get books by category with pagination
    public Page<Book> getBooksByCategory(Integer categoryId, int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        return bookRepository.findByCategoryId(categoryId, pageable);
    }
}
