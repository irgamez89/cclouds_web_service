package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.UserDAO;
import com.xedrux.cclouds.web.entities.CcloudsUsuario;
import com.xedrux.cclouds.web.exceptions.UnableToCreateEntityException;
import com.xedrux.cclouds.web.exceptions.EntityNotFoundException;
import java.security.Principal;
import java.util.Collection;
import java.util.HashMap;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
@RestController
@RequestMapping("/admin/usuario")
public class UserController {

    @Autowired
    UserDAO userDAO;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @PreAuthorize("hasPermission('', 'test_option')")
    @RequestMapping("/test")
    public ResponseEntity<String> testMethod() {
        return new ResponseEntity<>("Hello world", HttpStatus.CREATED);
    }

    @RequestMapping(value = "/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getUser(@ModelAttribute("id") Long id)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsUsuario user = userDAO.getUsuario(id);
        if (user != null) {
            response.put("user", user);
        } else {
            throw new EntityNotFoundException(MESSAGE + id);
        }
        return response;
    }

    @RequestMapping(value = "/username={username}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getUserByUsername(@ModelAttribute("username") String username)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsUsuario user = userDAO.findUsuarioByUsername(username);
        if (user != null) {
            response.put("user", user);

        } else {
            throw new EntityNotFoundException("There is not any user with "
                    + "username " + username);
        }
        return response;
    }

    @RequestMapping(value = "/{IdUsuario}", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> updateUser(
            @ModelAttribute("IdUsuario") Long id,
            @RequestBody @Valid CcloudsUsuario user,
            BindingResult result)
            throws EntityNotFoundException, UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Some fields are wrong.",
                    result.getFieldErrors());
        } else {
            user.setIdUser(id);
            if (user.getPassword() != null) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
            if (userDAO.updateUser(user)) {
                response.put("success", true);
            } else {
                throw new EntityNotFoundException("Update failed. ");
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

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> insertUser(
            @RequestBody @Valid CcloudsUsuario user,
            BindingResult result) throws UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to create user.",
                    result.getFieldErrors());
        } else {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            long id = userDAO.insertUser(user);
            response.put("userId", id);
        }
        return response;
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteUser(@ModelAttribute("id") long id) throws
            EntityNotFoundException {
        if (!userDAO.deleteUser(id)) {
            throw new EntityNotFoundException(MESSAGE + id);
        }
    }

    @RequestMapping(value = "/myself", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public CcloudsUsuario getCurrentUser(Principal user) {
        String username = user.getName();
        return userDAO.findUsuarioByUsername(username);
    }

    private final String MESSAGE = "There is not any user with id: ";

}
