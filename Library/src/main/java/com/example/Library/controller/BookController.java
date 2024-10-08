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
        ModelAndView mv = new ModelAndView("success");
        mv.addObject("message", "Book added successfully");
        return mv;
    }
}



