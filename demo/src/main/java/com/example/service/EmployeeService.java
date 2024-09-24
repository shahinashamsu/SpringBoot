package com.example.service;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    // Create Employee
    public Employee createEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    // Get all Employees
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    // Get Employee by ID
    public Optional<Employee> getEmployeeById(Integer id) {
        return employeeRepository.findById(id);
    }

    // Update Employee
    public Employee updateEmployee(Integer id, Employee employeeDetails) {
        Optional<Employee> optionalEmployee = employeeRepository.findById(id);

        if (optionalEmployee.isPresent()) {
            Employee employee = optionalEmployee.get(); // If found, get the employee
            // Update employee details
            employee.setName(employeeDetails.getName());
            employee.setPassword(employeeDetails.getPassword());
            employee.setDepartment(employeeDetails.getDepartment());

            return employeeRepository.save(employee); // Save the updated employee
        } else {
            throw new RuntimeException("Employee not found with id: " + id); // Handle employee not found case
        }
    }

    // Delete Employee
    public void deleteEmployee(Integer id) {
        if (employeeRepository.existsById(id)) { // Check if the employee exists
            employeeRepository.deleteById(id); // Delete employee
        } else {
            throw new RuntimeException("Employee not found with id: " + id); // Handle employee not found case
        }
    }
}
