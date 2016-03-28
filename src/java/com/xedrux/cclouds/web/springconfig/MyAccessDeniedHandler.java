/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.springconfig;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 *
 * @author Admin
 */
public class MyAccessDeniedHandler implements AccessDeniedHandler{

    @Override
    public void handle(HttpServletRequest hsr, HttpServletResponse hsr1, AccessDeniedException ade) throws IOException, ServletException {
        hsr1.setStatus(HttpStatus.FORBIDDEN.value());
        hsr1.getWriter().write("{\"message\": \"Usted no tiene permiso para realizar "
                + "la accion solicitada.\"}");
    }
    
}
