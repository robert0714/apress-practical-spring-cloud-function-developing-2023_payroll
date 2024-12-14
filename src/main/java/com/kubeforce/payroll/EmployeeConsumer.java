package com.kubeforce.payroll;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;
import java.util.function.Consumer;


public class EmployeeConsumer implements Consumer<Map<String,String>> {
    public static final Logger LOGGER = LoggerFactory.getLogger(EmployeeConsumer.class);

    @Autowired
    private EmployeeRepository EmployeeRepository;

    @Override
    public void accept (Map<String, String> map)
    {
        LOGGER.info("Creating the employee: {}", map);
        Employee employee = new Employee (map.get("name"), Integer.parseInt(map.get(
                "employeeIdentifier")), map.get("email"), map.get("salary"));
        EmployeeRepository.save(employee);
    }

}
