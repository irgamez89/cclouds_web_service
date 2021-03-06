package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.CcloudsDAO;
import com.xedrux.cclouds.web.dao.EmpresaDAO;
import com.xedrux.cclouds.web.entities.CcloudsEmpresa;
import com.xedrux.cclouds.web.exceptions.EntityNotFoundException;
import com.xedrux.cclouds.web.exceptions.UnableToCreateEntityException;
import java.util.Collection;
import java.util.HashMap;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Reinier
 */
@RestController
@RequestMapping("/admin/empresa")
public class EmpresaController {

    @Autowired
    EmpresaDAO empresaDAO;

    public void setEmpresaDAO(EmpresaDAO empresaDAO) {
        this.empresaDAO = empresaDAO;
    }
    public CcloudsDAO getDAO() {
        return empresaDAO;
    }
    @PreAuthorize("hasPermission('', 'Listar Empresas')")
    @RequestMapping(value = "/", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAllEmpresas() {
        Collection<CcloudsEmpresa> empresas = empresaDAO.getAllEmpresas();
        HashMap<String, Object> response = new HashMap<>();
        response.put("empresas", empresas);
        return response;
    }

    @PreAuthorize("hasPermission('', 'Listar Empresas')")
    @RequestMapping(value = "/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getEmpresa(@ModelAttribute("id") Long id)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsEmpresa empresa = empresaDAO.getEmpresa(id);
        if (empresa != null) {
            response.put("empresa", empresa);
        } else {
            throw new EntityNotFoundException(MESSAGE + id);
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Insertar Empresa')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> insertEmpresa(
            @RequestBody @Valid CcloudsEmpresa empresa,
            BindingResult result) throws UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to create empresa.",
                    result.getFieldErrors());
        } else {
            long id = empresaDAO.insertEmpresa(empresa);
            response.put("id", id);
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Modificar Empresa')")
    @RequestMapping(value = "/{Id}", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> updateEmpresa(
            @ModelAttribute("Id") long id,
            @RequestBody @Valid CcloudsEmpresa empresa,
            BindingResult result)
            throws EntityNotFoundException, UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to instantiate empresa.",
                    result.getFieldErrors());
        } else {
            empresa.setIdEmpresa(id);
            if (empresaDAO.updateEmpresa(empresa)) {
                response.put("success", true);
            } else {
                throw new EntityNotFoundException(MESSAGE + id);
            }
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Eliminar Empresa')")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public void deleteEmpresa(@ModelAttribute("id") long id) throws
            EntityNotFoundException {
        if (!empresaDAO.deleteEmpresa(id)) {
            throw new EntityNotFoundException(
                    "Couldn't delete. " + MESSAGE + id);
        }
    }

    private String MESSAGE = "There is not any empresa with id: ";

}
