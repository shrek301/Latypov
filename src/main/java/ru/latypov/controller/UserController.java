package ru.latypov.controller;

        import com.example.demo.model.EmployeeService;
        import io.swagger.models.Model;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.http.*;
        import org.springframework.web.bind.annotation.*;

/**
 * Контролер для  api/organization.
 */


@RestController
@RequestMapping("api/organization")


public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Iterable list(Model model) {
        Iterable employeeList = employeeService.listAllEmployee();
        return employeeList;
    }

    /**
     * Слушаем /{id}.
     */

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Employee showOrganization(@PathVariable Integer id) {
        Employee employee = EmployeeService.getEmployeeById(id);
        return Employee;
    }

    /**
     * Слушаем /update.
     */

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
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
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity saveEmployee(@RequestBody Employee employee) {
        employeeService.saveEmployee(employee);
        return new ResponseEntity("success", HttpStatus.OK);
    }
}


