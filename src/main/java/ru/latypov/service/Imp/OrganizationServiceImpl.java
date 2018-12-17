package ru.latypov.service.Imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import ru.latypov.model.Organization;
import ru.latypov.repository.OrganizationRepository;
import ru.latypov.service.OrganizationService;

import java.util.List;
import java.util.Optional;

public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    private OrganizationRepository organizationRepository;
    public List<Organization> retrieveOrganization(){
        List<Organization> organization=organizationRepository.findALL();
        return organization;
    }
    public Organization getOrganization (Integer id) {
        Optional<Organization> optEmp = organizationRepository.findById(id);
        return optEmp.get();
    }
    public Organization  getOrganization (Organization organization){
        Optional<Organization> optEmp1=organizationRepository.findByemployee(office);
        return optEmp1.get();
    }
    public ResponseEntity updateOrganization(Organization organization){
        return organizationRepository.save(organization);
    }
    public void savesOrganization (Organization organization){
        organizationRepository.save(organization);
    }
}
