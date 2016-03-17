package com.xedrux.cclouds.web.controllers;

import com.xedrux.cclouds.web.dao.CityDAO;
import com.xedrux.cclouds.web.entities.CcloudsCity;
import com.xedrux.cclouds.web.entities.CcloudsProvince;
import com.xedrux.cclouds.web.exceptions.EntityNotFoundException;
import com.xedrux.cclouds.web.exceptions.UnableToCreateEntityException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
@RestController
@RequestMapping("/admin/city")
public class CityController {

    @Autowired
    CityDAO cityDAO;

    public void setCityDAO(CityDAO cityDAO) {
        this.cityDAO = cityDAO;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getAllCities() {
        Collection<CcloudsCity> cities = cityDAO.getAllCities();
        HashMap<String, Object> response = new HashMap<>();
        response.put("cities", cities);
        return response;
    }

    @RequestMapping(value = "/id={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getCity(@ModelAttribute("id") Long id)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        CcloudsCity city = cityDAO.getCity(id);
        if (city != null) {
            response.put("city", city);
        } else {
            throw new EntityNotFoundException("There is not any city with id: "
                    + id);
        }
        return response;
    }

    @RequestMapping(value = "/from_province={id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> getCitiesFrom(@ModelAttribute("id") 
                                                 Long province)
            throws EntityNotFoundException {
        HashMap<String, Object> response = new HashMap<>();
        List<CcloudsCity> cities = cityDAO.getAllCitiesFrom(province);
        response.put("cities", cities);
        return response;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> insertCity(
            @RequestBody @Valid CcloudsCity city, BindingResult result)
            throws UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to create city. "
                    + "There are wrong fields.",
                    result.getFieldErrors());
        } else {
            long id = cityDAO.insertCity(city);
            response.put("id", id);
        }
        return response;
    }

    @RequestMapping(value = "/{Id}", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public HashMap<String, Object> updateCity(
            @ModelAttribute("Id") long id,
            @RequestBody @Valid CcloudsCity city,
            BindingResult result)
            throws EntityNotFoundException, UnableToCreateEntityException {
        HashMap<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            throw new UnableToCreateEntityException("Unable to create city."
                    + " There are wrong fields.",
                    result.getFieldErrors());
        } else {
            city.setIdCity(id);
            if (cityDAO.updateCity(city)) {
                response.put("success", true);
            } else {
                throw new EntityNotFoundException("City not found.");
            }
        }
        return response;
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public void deleteCity(@ModelAttribute("id") long id) throws
            EntityNotFoundException {
        if (!cityDAO.deleteCity(id)) {
            throw new EntityNotFoundException(
                    "Couldn't delete. There is no city with id:" + id);
        }
    }
}
