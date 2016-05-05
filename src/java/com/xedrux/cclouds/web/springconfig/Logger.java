/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.springconfig;

import com.xedrux.cclouds.web.dao.CcloudsDAO;
import com.xedrux.cclouds.web.dao.LogDAO;
import com.xedrux.cclouds.web.dao.UserDAO;
import com.xedrux.cclouds.web.entities.CcloudsLogs;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Isidro
 */
public class Logger {

    @Autowired
    LogDAO logDAO;

    public void setLogDAO(LogDAO logDAO) {
        this.logDAO = logDAO;
    }

    @Autowired
    UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
    
    
    public void logAction(JoinPoint joinpoint, Object controllers){
        try {
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username="None";
            if (principal instanceof UserDetails) {
                username = ((UserDetails) principal).getUsername();
            } else {
                username = principal.toString();
            }
            CcloudsDAO controller;
            try {
                controller = (CcloudsDAO) controllers.getClass().
                        getMethod("getDAO", null).invoke(controllers, null);
                String table = controller.getTableName();
            long userId = userDAO.findUsuarioByUsername(username).getIdUser();
            System.out.println("method name: "+joinpoint.getSignature().getName());
            String method_name=joinpoint.getSignature().getName();
            String action="None";
            if(method_name.contains("insert"))
                action = "insert";
            else if(method_name.contains("update"))
                action = "update";
            else if(method_name.contains("delete"))
                action = "delete";
            
            logDAO.insertLog(new CcloudsLogs(-1L, userId, null, action,table));

            } catch (IllegalAccessException ex) {
                java.util.logging.Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalArgumentException ex) {
                java.util.logging.Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                java.util.logging.Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } catch (NoSuchMethodException ex) {
            java.util.logging.Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SecurityException ex) {
            java.util.logging.Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
