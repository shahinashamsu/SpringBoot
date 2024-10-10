package com.example.Library.controller;

import com.example.Library.exception.BookAlreadyExistsException;
import com.example.Library.model.Book;
import com.example.Library.model.Category;
import com.example.Library.service.BookService;
import com.example.Library.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/api/library")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private CategoryService categoryService;


    @GetMapping("/addbooks")
    public ModelAndView showAddBookForm() {
        ModelAndView mv = new ModelAndView("addBook");
        List<Category> categories = categoryService.getAllCategories();
        mv.addObject("categories", categories);
        return mv; // Return the ModelAndView object with categories
    }

    @PostMapping("/books") // Handles POST requests to add a book
    public ModelAndView addBook(@ModelAttribute Book bookData, @RequestParam("categoryId") int categoryId) {
        ModelAndView mv = new ModelAndView("addBook");
        List<Category> categories = categoryService.getAllCategories();
        mv.addObject("categories", categories);

        try {
            Category selectedCategory = categoryService.getCategoryById(categoryId);
            if (selectedCategory != null) {
                bookData.setCategory(selectedCategory);
                bookService.addBook(bookData);
                mv.addObject("message", "Book added successfully");
            } else {
                mv.addObject("message", "Error: Selected category not found.");
            }
        } catch (BookAlreadyExistsException e) {
            mv.addObject("message", "Error: " + e.getMessage());
        }

        return mv; // Return the view with the message and categories
    }

}


