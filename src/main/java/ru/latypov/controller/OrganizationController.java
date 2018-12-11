package ru.latypov.controller;


import com.example.demo.model.OrganizationService;
import io.swagger.models.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/organization")

public class OrganizationController {

    private OrganizationService organizationService;

    @Autowired
    public void setOrganizationService(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Iterable list(Model model) {
        Iterable organizationList = organizationService.listAllOrganization();
        return organizationList;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Organization showOrganization(@PathVariable Integer id, Model model) {
        Organization organization = OrganizationService.getOrganizationById(id);
        return organization;
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity updateOrganization(@RequestBody Organization organization) {
        storedOrganization.setId(organization.getOrganizationById());
        storedOrganization = setName(organization.getName());
        storedOrganization = setFullName(organization.getFullName());
        storedOrganization = setInn(organization.getInn());
        storedOrganization = setKpp(organization.getKpp());
        storedOrganization = setAddress(organization.getAddress());
        storedOrganization = setPhone(organization.getPhone());
        storedOrganization = setIsActiv(organization.getIsActive());
        OrganizationService.saveOrganization(storedOrganization);
        return new ResponseEntity("success", HttpStatus.OK);

    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity saveOrganization(@RequestBody Organization organization) {
        organizationService.saveOrganization(organization);
        return new ResponseEntity("success", HttpStatus.OK);
    }
}
