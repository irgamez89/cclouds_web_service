package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.UserDAO;
import com.xedrux.cclouds.web.entities.CcloudsUsuario;
import com.xedrux.cclouds.web.exceptions.UnableToCreateUserException;
import com.xedrux.cclouds.web.exceptions.UserNotFoundException;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
@RestController
@RequestMapping("/usuario")
public class UserController {

    @Autowired
    UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @RequestMapping("/test")
    public ResponseEntity<String> testMethod() {
        return new ResponseEntity<>("Hello world",HttpStatus.CREATED);
    }

    @RequestMapping(value = "/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getUser(@ModelAttribute("id") Long id)
            throws UserNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsUsuario user = userDAO.getUsuario(id);
        if (user != null) {
            response.put("user", user);

        } else {
            throw new UserNotFoundException("There is not any user with id: "
                    + id);
        }
        return response;
    }
    
    @RequestMapping(value = "/username={username}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getUserByUsername(@ModelAttribute("username") String username)
            throws UserNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsUsuario user = userDAO.findUsuarioByUsername(username);
        if (user != null) {
            response.put("user", user);

        } else {
            throw new UserNotFoundException("There is not any user with username "
                    + username);
        }
        return response;
    }

    @RequestMapping(value = "/{IdUsuario}", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> updateUser(
            @ModelAttribute("IdUsuario") Long id,
            @Valid CcloudsUsuario user,
            BindingResult result)
            throws UserNotFoundException, UnableToCreateUserException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateUserException("Unable to update user.",
                    result.getFieldErrors());
        } else {
            user.setIdUser(id);
            if (userDAO.updateUser(user)) {
                response.put("success", true);
            } else {
                throw new UserNotFoundException("Can't update. User not found.");
            }

        }
        return response;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAllUsers() {
        Collection<CcloudsUsuario> users = userDAO.getAllUsers();
        HashMap<String, Object> response = new HashMap<>();
        response.put("users", users);
        return response;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<HashMap<String, Object>> insertUser(@Valid CcloudsUsuario user,
            BindingResult result) throws UnableToCreateUserException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateUserException("Unable to insert user.",
                    result.getFieldErrors());
        } else {
            long id = userDAO.insertUser(user);
            if(id<0){
                response.put("error", "username already exists");
                return new ResponseEntity<>(response,HttpStatus.CONFLICT);
            }else
                response.put("userId", id);
        }
        return new ResponseEntity<>(response,HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public void deleteUser(@ModelAttribute("id") long id) throws
            UserNotFoundException {
        if (!userDAO.deleteUser(id)) {
            throw new UserNotFoundException(
                    "Couldn't delete. There is no user with id:" + id);
        }
    }

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(UserNotFoundException.class)
    public HashMap<String, Object> handleUserNotFoundException(
            UserNotFoundException e) {
        HashMap<String, Object> response = new HashMap<>();
        response.put("message", e.getMessage());
        return response;
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(UnableToCreateUserException.class)
    public HashMap<String, Object> handleUnableToCreateUserException(
            UnableToCreateUserException e) {
        HashMap<String, Object> response = new HashMap<>();
        response.put("message", e.getMessage());
        LinkedList<String> errors = new LinkedList<>();
        for (FieldError error : e.getList()) {
            errors.add(error.getField());
        }
        response.put("errors", errors);
        return response;
    }
}
