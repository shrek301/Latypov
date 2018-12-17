package ru.latypov.service.Imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.latypov.Repository.EmployeeRepository;
import ru.latypov.model.Employee;
import ru.latypov.service.EmployeeService;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;
    public List<Employee> retrieveEmployees(){
        List <Employee> employees=employeeRepository.findALL();
        return employees;
    }
    public Employee getEmployee (Integer id) {
        Optional<Employee> optEmp = employeeRepository.findById(id);
        return optEmp.get();
    }
    public
}
