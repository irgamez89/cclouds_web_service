package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.RolDAO;
import com.xedrux.cclouds.web.entities.CcloudsRol;
import com.xedrux.cclouds.web.entities.CcloudsUsuario;
import java.util.Collection;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
@RestController
@RequestMapping("/rol")
public class RolController {
    
    @Autowired
    RolDAO rolDAO;

    public void setUserDAO(RolDAO DAO) {
        this.rolDAO = DAO;
    }

    
    @RequestMapping(value = "/", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAllRols() {
        Collection<CcloudsRol> rols = rolDAO.getAllRols();
        HashMap<String, Object> response = new HashMap<>();
        response.put("rols", rols);
        return response;
    }
    
}
