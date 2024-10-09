package com.example.Library.controller;

import com.example.Library.model.Book;
import com.example.Library.service.BookService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController {

    @Autowired
    private BookService bookService;

    @GetMapping("/")
    public String login() {
        return "login";
    }

    @GetMapping("/index")
    public String index(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo,
            @RequestParam(value = "pageSize", defaultValue = "8") Integer pageSize,
            Model model, HttpSession session) {

        // Retrieve username from session
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        boolean hasBorrowedBooks = false;

        // Retrieve paginated books based on search criteria
        Page<Book> booksPage;
        if (search != null && !search.trim().isEmpty()) {
            booksPage = bookService.searchBooksByName(search, pageNo, pageSize);

            // Check if any of the searched books are borrowed
            for (Book book : booksPage) {
                if (book.isBorrowed()) {
                    hasBorrowedBooks = true;
                    break; // No need to continue if we found a borrowed book
                }
            }
        } else {
            booksPage = bookService.getPaginatedBooks(pageNo, pageSize);

            // Check if any of the all books are borrowed
            for (Book book : booksPage) {
                if (book.isBorrowed()) {
                    hasBorrowedBooks = true;
                    break; // No need to continue if we found a borrowed book
                }
            }
        }

        // Set attributes for pagination
        model.addAttribute("books", booksPage.getContent());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", booksPage.getTotalPages());
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("hasBorrowedBooks", hasBorrowedBooks); // Add this line to pass the variable to JSP

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

        // Retrieve the updated list of books
        Page<Book> booksPage = bookService.getPaginatedBooks(0, 8); // Reset to page 0 after borrowing
        model.addAttribute("books", booksPage.getContent());
        model.addAttribute("username", username);
        model.addAttribute("currentPage", 0);
        model.addAttribute("totalPages", booksPage.getTotalPages());
        model.addAttribute("pageSize", 8); // Default page size
        return "index";
    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam("bookId") Integer bookId, Model model, HttpSession session) {
        // Delete the book using the service
        bookService.deleteBook(bookId);
        model.addAttribute("message", "Book deleted successfully!");

        // Retrieve the username from the session
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username); // Add the username to the model

        // Retrieve the updated list of books
        Page<Book> booksPage = bookService.getPaginatedBooks(0, 8); // Reset to page 0 after deletion
        model.addAttribute("books", booksPage.getContent());
        model.addAttribute("currentPage", 0);
        model.addAttribute("totalPages", booksPage.getTotalPages());
        model.addAttribute("pageSize", 8); // Default page size

        return "index"; // Return to the index view
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
