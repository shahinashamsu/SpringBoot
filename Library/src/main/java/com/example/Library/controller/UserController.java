package com.example.Library.controller;

import com.example.Library.model.Users;
import com.example.Library.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    private UserService userService;


    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }


    @PostMapping("/login")
    public String login(Users user, RedirectAttributes redirectAttributes, HttpSession session) {
        boolean isValidUser = userService.verify(user);
        if (isValidUser) {
            session.setAttribute("username", user.getUsername()); // Store username in session
            redirectAttributes.addFlashAttribute("username", user.getUsername()); // Optional flash attribute for immediate feedback
            return "redirect:/index";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password!"); // Set error message
            return "redirect:/login";
        }
    }


}
