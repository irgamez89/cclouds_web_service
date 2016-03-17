package com.xedrux.cclouds.web.controllers;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
@Controller
public class LoginController {
    
    @RequestMapping({"/mylogin"})
    public String showLogin(Map<String, Object> model){
        return "login";
    }
    
}
