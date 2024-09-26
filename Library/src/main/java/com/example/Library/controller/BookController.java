package com.example.Library.controller;

import com.example.Library.model.Book;
import com.example.Library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api/library")
public class BookController {

    @Autowired
    private BookService service;

    // Add a new book to the library
    @PostMapping("/books")
    public ModelAndView addBook(@ModelAttribute Book bookData) {
        service.addBook(bookData);
        ModelAndView mv= new ModelAndView("success");
        mv.addObject("message", "Book added successfully");
        return mv;
    }

    // Show all books in the library
    @GetMapping("/all/books")
    public ModelAndView showAllBooks() {
        List<Book> books= service.showAllBooks();
        ModelAndView mv= new ModelAndView("allBooks");
        mv.addObject("books", books);
        return mv;
    }

    // Borrow a book by its ID
    @PostMapping("/books/borrow")
    public ModelAndView borrowBook(@ModelAttribute Book bookModel) {
        String message = service.borrowBook(bookModel);
        ModelAndView mv = new ModelAndView("success");
        mv.addObject("message", message);
        return mv;
    }

    // Show all available books for borrowings
    @GetMapping("/books/available")
    public ModelAndView getAvailableBooks() {
        List<Book> bookShow = service.getAvailableBooks();

        // Create ModelAndView and pass the list of books with a key
        ModelAndView mv = new ModelAndView("availableBooks");
        mv.addObject("books", bookShow);


        return mv;
    }

}

