/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.exceptions;

import java.util.List;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

/**
 *
 * @author Admin
 */
public class UnableToCreateUserException extends Exception{

    List<FieldError> list;

    public UnableToCreateUserException(String message, List<FieldError> list) {
        super(message);
        this.list=list;
    }
    
    public List<FieldError> getList() {
        return list;
    }

    public UnableToCreateUserException(String message) {
        super(message);
    }
}
