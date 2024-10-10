package com.example.Library.service;

import com.example.Library.model.Category;
import com.example.Library.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<Category> getAllCategories() {
        return categoryRepository.findAll(); // Ensure this is fetching data correctly
    }

    // Fetch a category by its ID
    public Category getCategoryById(int categoryId) {
        return categoryRepository.findById(categoryId)
                .orElse(null); // Return null if no category found
    }
}

