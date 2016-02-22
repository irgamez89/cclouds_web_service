package com.xedrux.cclouds.web.entities;

import java.util.Collection;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
//@Table(name = "cclouds_rol")
public class CcloudsRol {
    private Integer idRol;
    private String name;
    private String description;
    private Collection<CcloudsRolModule> ccloudsRolModuleCollection;

    public CcloudsRol() {
    }

    public CcloudsRol(Integer idRol, String name, String description) {
        this.idRol = idRol;
        this.name = name;
        this.description = description;
    }
    
    public CcloudsRol(Integer idRol) {
        this.idRol = idRol;
    }

    public Integer getIdRol() {
        return idRol;
    }

    public void setIdRol(Integer idRol) {
        this.idRol = idRol;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<CcloudsRolModule> getCcloudsRolModuleCollection() {
        return ccloudsRolModuleCollection;
    }

    public void setCcloudsRolModuleCollection(Collection<CcloudsRolModule> ccloudsRolModuleCollection) {
        this.ccloudsRolModuleCollection = ccloudsRolModuleCollection;
    }

    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsRol[ idRol=" + idRol + " ]";
    }
    
}
