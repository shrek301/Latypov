package ru.latypov.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import ru.latypov.model.Organization;
import ru.latypov.service.OrganizationService;

import java.util.List;


/**
 * Контролер для  api/organization.
 */


@RestController
public class OrganizationController {
    @Autowired
    private OrganizationService organizationService;

    /**
     * Слушаем /list.
     */
    @PostMapping(value = "api/organization/list")
    public List<Organization> getOrganization() {
        List<Organization> organization = organizationService.retrieveOrganization();
        return organization;
    }

    /**
     * Слушаем /{id}.
     */
    @GetMapping(value = "api/organization/{id}")
    public Organization getOrganization(@PathVariable(name = "id") Integer id) {
        return organizationService.getOrganization(id);
    }

    /**
     * Слушаем /update.
     */
    @PostMapping(value = "api/organization/update")
    public ResponseEntity updateOrganization(@RequestBody Organization organization) {
        Organization emp = organizationService.getOrganization(organization);
        if (emp != null) {
            organizationService.updateOrganization(organization);

        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    /**
     * Слушаем /save.
     */
    @PostMapping(value = "api/organization/save")
    public void saveOrganization(Organization organization) {
        organizationService.savesOrganization(organization);

    }

}
