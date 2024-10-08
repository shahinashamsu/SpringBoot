package com.example.Library.controller;

import com.example.Library.model.Book;
import com.example.Library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PageController {

    @Autowired
    private BookService bookService;

    @GetMapping("/")
    public String login() {
        return "login";
    }

    @GetMapping("/index")
    public String index(Model model) {
        List<Book> books = bookService.showAllBooks();
        model.addAttribute("books", books);
        return "index";
    }

    @PostMapping("/borrow")
    public String borrowBook(@RequestParam("bookId") Integer bookId, @RequestParam("borrowerName") String borrowerName, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        boolean success = bookService.borrowBook(bookId, borrowerName);
        if (!success) {
            model.addAttribute("error", "Book is already borrowed.");
        }

        List<Book> books = bookService.showAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("username", username);
        return "index";
    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam("bookId") Integer bookId, Model model) {
        bookService.deleteBook(bookId);
        model.addAttribute("message", "Book deleted successfully!");

        List<Book> books = bookService.showAllBooks();
        model.addAttribute("books", books);
        return "index";
    }

    @GetMapping("/addbooks")
    public String addBook() {
        return "addBook";
    }

    @GetMapping("/logout")
    public String logout() {
        return "login";
    }
}
