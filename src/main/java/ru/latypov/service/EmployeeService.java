package ru.latypov.service;


import org.springframework.http.ResponseEntity;
import ru.latypov.model.Employee;

import java.util.List;
/*Набор методов для контролера Работник */
public interface EmployeeService {
    public List<Employee> retrieveEmployees();

    public Employee getEmployee(Integer id);

    public void saveEmployee(Employee employee);

    public ResponseEntity updateEmployee(Employee employee);

    public Employee getEmployee(Employee employee);
}
