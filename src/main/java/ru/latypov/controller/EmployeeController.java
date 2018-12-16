package ru.latypov.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.latypov.model.Employee;
import ru.latypov.service.EmployeeService;

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
    public ResponseEntity updatEemployee(@RequestBody Employee employee) {
        storedEmployee.setId(employee.getEmployeeById());
        storedEmployee = setName(employee.getName());
        storedEmployee = setFullName(employee.getFullName());
        storedEmployee = setInn(employee.getInn());
        storedEmployee = setKpp(employee.getKpp());
        storedEmployee = setAddress(employee.getAddress());
        storedEmployee = setPhone(employee.getPhone());
        storedEmployee = setIsActiv(employee.getIsActive());
        EmployeeService.saveEmployee(storedEmployee);
        return new ResponseEntity("success", HttpStatus.OK);
    }

    /**
     * Слушаем /save.
     */

    @PostMapping(value = "api/user/save")
       public saveEmployee (Employee employee){
        employeeService.savesEmployee(employee);
        return  ;
    }
}



