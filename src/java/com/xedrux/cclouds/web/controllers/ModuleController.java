package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.ModuleDAO;
import com.xedrux.cclouds.web.entities.CcloudsModule;
import com.xedrux.cclouds.web.exceptions.EntityNotFoundException;
import com.xedrux.cclouds.web.exceptions.UnableToCreateEntityException;
import java.util.Collection;
import java.util.HashMap;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
@RestController
@RequestMapping("/admin/module")
public class ModuleController {
    @Autowired
    ModuleDAO moduleDAO;

    public void setModuleDAO(ModuleDAO DAO) {
        this.moduleDAO = DAO;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<HashMap<String, Object>> insertModule(
            @RequestBody @Valid CcloudsModule module,
            BindingResult result) throws UnableToCreateEntityException  {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to insert.",
                    result.getFieldErrors());
        } else {
            long id = moduleDAO.insertModule(module);
            if(id<0){
                response.put("error", "module name already exists");
                return new ResponseEntity<>(response,HttpStatus.CONFLICT);
            }else
                response.put("Id", id);
        }
        return new ResponseEntity<>(response,HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAllModules() {
        Collection<CcloudsModule> modules = moduleDAO.getAllModules();
        HashMap<String, Object> response = new HashMap<>();
        response.put("modules", modules);
        return response;
    }
    
    @RequestMapping(value = "/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<HashMap<String, Object>> getModule(@ModelAttribute("id") Long id) {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsModule module = moduleDAO.getModule(id);
        if (module != null) {
            response.put("module", module);

        } else {
            response.put("message", "No hay módulo con id " + id);
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/name={name}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<HashMap<String, Object>> getModuleByName(@ModelAttribute("name") String name) {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsModule module = moduleDAO.findModuleByName(name);
        if (module != null) {
            response.put("module", module);
        } else {
            response.put("message", "No hay módulo con nombre " + name);
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);

        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    @RequestMapping(value = "/{Id}", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> updateModule(
            @ModelAttribute("Id") int id,
            @RequestBody @Valid CcloudsModule module,
            BindingResult result)
            throws EntityNotFoundException, UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to update module.",
                    result.getFieldErrors());
        } else {
            module.setIdModule(id);
            if (moduleDAO.updateModule(module)) {
                response.put("success", true);
            } else {
                throw new EntityNotFoundException("Can't update. Module not found.");
            }

        }
        return response;
    }
@RequestMapping(value = "/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public void deleteModule(@ModelAttribute("id") long id) throws
            EntityNotFoundException {
        if (!moduleDAO.deleteModule(id)) {
            throw new EntityNotFoundException(
                    "Couldn't delete. There is no module with id:" + id);
        }
    }
}
