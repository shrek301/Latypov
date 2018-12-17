package ru.latypov.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import ru.latypov.model.Employee;
import ru.latypov.service.EmployeeService;

import java.util.List;


/**
 * Контролер для  api/employee.
 */

@RestController
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    /**
     * Слушаем /list.
     */
    @PostMapping(value = "api/employee/list")
    public List<Employee> getEmployee() {

        return employeeService.retrieveEmployees();
    }

    /**
     * Слушаем /{id}.
     */
    @GetMapping(value = "api/employee/{id}")
    public Employee getEmpoloyee (@PathVariable(name = "id") Integer id) {
        return employeeService.getEmployee(id);
    }

    /**
     * Слушаем /update.
     */
    @PostMapping(value = "api/employee/update")
    public ResponseEntity updateEmployee (@RequestBody Employee employee) {
        Employee emp = employeeService.getEmployee(employee);
        if (emp != null) {
            employeeService.updateEmployee(employee);

        }

        return new ResponseEntity("success", HttpStatus.OK);
    }


    /**
     * Слушаем /save.
     */
    @PostMapping(value = "api/employee/save")
    public void saveEmployee(Employee employee) {
        employeeService.saveEmployee(employee);

    }

}



