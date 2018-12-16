package ru.latypov.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.latypov.model.Employee;
import ru.latypov.service.EmployeeService;

import java.net.URISyntaxException;
import java.util.List;

/**
 * Контролер для  api/organization.
 */

@RestController
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    /**
     * Слушаем /list.
     */
    @PostMapping(value = "api/user/list")
    public List<Employee> getEmployees() {
        List<Employee> employees = employeeService.retrieveEmployees();
        return employees;
    }

    /**
     * Слушаем /{id}.
     */
    @GetMapping(value = "api/user/{id}")
    public Employee getEmployee(@PathVariable(name = "id") Integer id) {
        return employeeService.getEmployee(id);
    }

    /**
     * Слушаем /update.
     */
    @PostMapping(value = "api/user/update")
    public updateEemployee(@RequestBody Employee employee)   throws URISyntaxException {
        Employee emp = employeeService.getEmployee(employee);
        if (emp != null) {
            employeeService.updateEmployee(employee);
            return "success";
        }

    }



    /**
     * Слушаем /save.
     */

    @PostMapping(value = "api/user/save")
    public saveEmployee(Employee employee) {
        employeeService.savesEmployee(employee);
        return;
    }
}



