package ru.latypov.service;

import org.springframework.http.ResponseEntity;
import ru.latypov.model.Organization;

import java.util.List;

/*Набор методов для контролера Организации */

public interface OrganizationService {

    public List<Organization> retrieveOrganization();

    public Organization getOrganization(Integer id);

    public void savesOrganization(Organization organization);

    public ResponseEntity updateOrganization(Organization organization);

    public Organization getOrganization(Organization organization);
}

