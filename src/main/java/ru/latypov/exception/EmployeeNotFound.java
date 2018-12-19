package ru.latypov.exception;

/**
 * Исключение из ресурсов, когда работник не найден.
 */
public class EmployeeNotFound extends RuntimeException {
    public EmployeeNotFound(String exception) {
        super(exception);
    }
}
