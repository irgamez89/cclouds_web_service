package com.xedrux.cclouds.web.springconfig;

import com.xedrux.cclouds.web.dao.OptionDAO;
import com.xedrux.cclouds.web.dao.RolOptionDAO;
import com.xedrux.cclouds.web.dao.UserDAO;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
public class CcloudsPermissionEvaluator implements PermissionEvaluator {

    @Autowired
    UserDAO userDAO;
    
    @Autowired
    OptionDAO optionDAO;
    
    @Autowired
    RolOptionDAO roloptionDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void setOptionDAO(OptionDAO optionDAO) {
        this.optionDAO = optionDAO;
    }

    public void setRoloptionDAO(RolOptionDAO roloptionDAO) {
        this.roloptionDAO = roloptionDAO;
    }
    
    @Override
    public boolean hasPermission(Authentication a, Object o, Object o1) {
        long rol,option;
        rol=userDAO.findUsuarioByUsername(a.getName()).getIdRol();
        option=optionDAO.findOptionByName(o1.toString()).getIdOption();
        return roloptionDAO.getRols4Option(option).contains(rol);
    }

    @Override
    public boolean hasPermission(Authentication a, Serializable srlzbl, String string, Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
