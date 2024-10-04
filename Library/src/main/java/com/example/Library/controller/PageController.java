package com.example.Library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/addbooks")
    public String addBook() {
        return "addBook";
    }

    @GetMapping("/borrowbooks")
    public String borrowBook() {
        return "borrowBook";
    }

    @GetMapping("/showallbooks")
    public String showAllBooks() {
        return "allBooks";
    }

    @GetMapping("/availablebooks")
    public String availableBooks() {
        return "availableBooks";
    }
}
