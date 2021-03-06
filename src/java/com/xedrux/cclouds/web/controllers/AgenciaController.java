package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.AgenciaDAO;
import com.xedrux.cclouds.web.dao.CcloudsDAO;
import com.xedrux.cclouds.web.dao.EmpresaDAO;
import com.xedrux.cclouds.web.dao.SubEmpresaDAO;
import com.xedrux.cclouds.web.dao.SucursalDAO;
import com.xedrux.cclouds.web.entities.CcloudsAgencia;
import com.xedrux.cclouds.web.entities.CcloudsEmpresa;
import com.xedrux.cclouds.web.entities.CcloudsSubEmpresa;
import com.xedrux.cclouds.web.entities.CcloudsSucursal;
import com.xedrux.cclouds.web.exceptions.EntityNotFoundException;
import com.xedrux.cclouds.web.exceptions.UnableToCreateEntityException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
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
@RequestMapping("/admin/agencia")
public class AgenciaController {

    @Autowired
    AgenciaDAO agenciaDAO;
    @Autowired
    SucursalDAO sucursalDAO;
    @Autowired
    SubEmpresaDAO subEmpresaDAO;
    @Autowired
    EmpresaDAO empresaDAO;

    public void setAgenciaDAO(AgenciaDAO agenciaDAO) {
        this.agenciaDAO = agenciaDAO;
    }

    public CcloudsDAO getDAO() {
        return agenciaDAO;
    }

    
    @PreAuthorize("hasPermission('', 'Listar Agencias')")
    @RequestMapping(value = "/", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAllAgencias() {
        Collection<CcloudsAgencia> agencias = agenciaDAO.getAllAgencias();
        HashMap<String, Object> response = new HashMap<>();
        response.put("agencias", agencias);
        return response;
    }

    @PreAuthorize("hasPermission('', 'Listar Agencias')")
    @RequestMapping(value = "/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAgencia(@ModelAttribute("id") Long id)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsAgencia agencia = agenciaDAO.getAgencia(id);
        if (agencia != null) {
            response.put("agencia", agencia);
        } else {
            throw new EntityNotFoundException(MESSAGE + id);
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Listar Agencias')")
    @RequestMapping(value = "/detailed/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAgenciaSucursalSubEmpresaAndEmpresa(
            @ModelAttribute("id") Long id)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsAgencia agencia = agenciaDAO.getAgencia(id);
        if (agencia != null) {
            CcloudsSucursal sucursal = sucursalDAO.getSucursal(agencia.getIdSucursal());
            List<CcloudsAgencia> agencias
                    = agenciaDAO.getAllAgenciasFrom(sucursal.getIdSucursal());
            CcloudsSubEmpresa subEmpresa
                    = subEmpresaDAO.getSubEmpresa(sucursal.getIdSubEmpresa());
            List<CcloudsSucursal> sucursales
                    = sucursalDAO.getAllSucursalFrom(subEmpresa.getIdSubEmpresa());
            CcloudsEmpresa empresa
                    = empresaDAO.getEmpresa(subEmpresa.getIdEmpresa());
            List<CcloudsSubEmpresa> subEmpresas
                    = subEmpresaDAO.getAllSubEmpresasFrom(empresa.getIdEmpresa());
            response.put("empresa", empresa);
            response.put("subempresa", subEmpresa);
            response.put("sucursal", sucursal);
            response.put("agencia", agencia);
            response.put("agencias", agencias);
            response.put("sucursales", sucursales);
            response.put("subempresas", subEmpresas);
            response.put("empresas", empresaDAO.getAllEmpresas());
        } else {
            throw new EntityNotFoundException(MESSAGE + id);
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Listar Agencias')")
    @RequestMapping(value = "/from_sucursal={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAgenciaFrom(@ModelAttribute("id") Long sucursal)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        List<CcloudsAgencia> agencias
                = agenciaDAO.getAllAgenciasFrom(sucursal);
        response.put("agencias", agencias);
        return response;
    }

    @PreAuthorize("hasPermission('', 'Insertar Agencia')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> insertAgencia(
            @RequestBody @Valid CcloudsAgencia agencia, BindingResult result)
            throws UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to create agencia. "
                    + "There are wrong fields.",
                    result.getFieldErrors());
        } else {
            long id = agenciaDAO.insertAgencia(agencia);
            response.put("id", id);
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Modificar Agencia')")
    @RequestMapping(value = "/{Id}", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> updateAgencia(
            @ModelAttribute("Id") long id,
            @RequestBody @Valid CcloudsAgencia agencia,
            BindingResult result)
            throws EntityNotFoundException, UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to create agencia."
                    + " There are wrong fields.",
                    result.getFieldErrors());
        } else {
            agencia.setIdAgencia(id);
            if (agenciaDAO.updateAgencia(agencia)) {
                response.put("success", true);
            } else {
                throw new EntityNotFoundException("Agencia not found.");
            }
        }
        return response;
    }

    @PreAuthorize("hasPermission('', 'Eliminar Agencia')")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public void deleteAgencia(@ModelAttribute("id") long id) throws
            EntityNotFoundException {
        if (!agenciaDAO.deleteAgencia(id)) {
            throw new EntityNotFoundException(
                    "Couldn't delete. " + MESSAGE + id);
        }
    }

    final String MESSAGE = "No hay agencia con id: ";
}
