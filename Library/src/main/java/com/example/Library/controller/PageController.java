package com.example.Library.controller;

import com.example.Library.model.Book;
import com.example.Library.model.Category;
import com.example.Library.service.BookService;
import com.example.Library.service.CategoryService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class PageController {

    @Autowired
    private BookService bookService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public String login() {
        return "login";
    }

    @GetMapping("/index")
    public String index(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "categoryId", required = false) Integer categoryId, // Use categoryId for clarity
            @RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo,
            @RequestParam(value = "pageSize", defaultValue = "8") Integer pageSize,
            Model model, HttpSession session) {

        // Retrieve username from session
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // Retrieve all categories for the dropdown
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);

        // Paginated book results
        Page<Book> booksPage;

        // Search and filter based on category
        if (search != null && !search.trim().isEmpty()) {
            booksPage = bookService.searchBooksByNameAndCategory(search, categoryId, pageNo, pageSize);
        } else if (categoryId != null) {
            booksPage = bookService.getBooksByCategory(categoryId, pageNo, pageSize);
        } else {
            booksPage = bookService.getPaginatedBooks(pageNo, pageSize);
        }

        // Set attributes for pagination and filtering
        model.addAttribute("books", booksPage.getContent());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", booksPage.getTotalPages());
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("categoryId", categoryId); // To keep the selected category on the page

        return "index"; // Return to the index view
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


//    @GetMapping("/addbooks")
//    public String addBook() {
//        return "addBook";
//    }

    @GetMapping("/logout")
    public String logout() {
        return "login";
    }
}
