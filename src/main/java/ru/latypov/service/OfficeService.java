package ru.latypov.service;


import org.springframework.http.ResponseEntity;
import ru.latypov.model.Office;

import java.util.List;

/*Набор методов для контролера Офис */
public interface OfficeService {
    public List<Office> retrieveOffice();

    public Office getOffice(Integer id);

    public void savesOffice(Office office);

    public ResponseEntity updateOffice(Office office);

    public Office getOffice(Office office);
}
