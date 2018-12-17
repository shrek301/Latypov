package ru.latypov.service.Imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import ru.latypov.repository.EmployeeRepository;
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
    public ResponseEntity updateEmployee(Employee employee){
        return employeeRepository.save(employee);
    }
    public void saveEmployee (Employee employee){
        employeeRepository.save(employee);
    }
}
