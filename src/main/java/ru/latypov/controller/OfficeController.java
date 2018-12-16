package ru.latypov.controller;


import com.example.demo.model.OfficeService;
import io.swagger.models.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

/**
 * Контролер для  api/office.
 */


@RestController
@RequestMapping("api/office")


public class OfficeController {
    @Autowired
    private OfficeService officeService;
    /**
     * Слушаем /list/{orgid}.
     */

    @RequestMapping(value = "/list/{orgid}", method = RequestMethod.POST)
    public Iterable list(@PathVariable Integer orgid, Model model) {
        Iterable officeList = officeService.getlistOrgOffise(orgid);
        return officeList;
    }

    /**
     * Слушаем /{id}.
     */

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Office showOrganization(@PathVariable Integer id, Model model) {
        Office office = OfficeService.getOfficeById(id);
        return office;
    }

    /**
     * Слушаем /update.
     */

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity updateOrganization(@RequestBody Office office) {
        storedOffice.setId(office.getofficeById());
        storedOffice = setName(office.getName());
        storedOffice = setAddress(office.getAddress());
        storedOffice = setPhone(office.getPhone());
        storedOffice = setIsActiv(office.getIsActive());
        OfficeService.saveOffice(storedOffice);
        return new ResponseEntity("success", HttpStatus.OK);

    }

    /**
     * Слушаем /save.
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity saveOffice(@RequestBody Office office) {
        OfficeService.saveOffice(office);
        return new ResponseEntity("success", HttpStatus.OK);
    }
}



