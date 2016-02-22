package com.xedrux.cclouds.web.entities;

import javax.validation.constraints.NotNull;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
public class CcloudsRolModule {
    
    @NotNull
    private Integer id;
    private CcloudsModule idModule;
    private CcloudsRol idRol;

    public CcloudsRolModule() {
    }

    public CcloudsRolModule(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public CcloudsModule getIdModule() {
        return idModule;
    }

    public void setIdModule(CcloudsModule idModule) {
        this.idModule = idModule;
    }

    public CcloudsRol getIdRol() {
        return idRol;
    }

    public void setIdRol(CcloudsRol idRol) {
        this.idRol = idRol;
    }


    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsRolModule[ id=" + id + " ]";
    }
    
}
