package com.xedrux.cclouds.web.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
//@Table(name = "cclouds_module")
public class CcloudsModule implements Serializable {
    private Integer idModule;
    private String name;
    private String description;
    private Collection<CcloudsRolModule> ccloudsRolModuleCollection;

    public CcloudsModule() {
    }

    public CcloudsModule(Integer idModule) {
        this.idModule = idModule;
    }

    public Integer getIdModule() {
        return idModule;
    }

    public void setIdModule(Integer idModule) {
        this.idModule = idModule;
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
    public int hashCode() {
        int hash = 0;
        hash += (idModule != null ? idModule.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CcloudsModule)) {
            return false;
        }
        CcloudsModule other = (CcloudsModule) object;
        if ((this.idModule == null && other.idModule != null) || (this.idModule != null && !this.idModule.equals(other.idModule))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsModule[ idModule=" + idModule + " ]";
    }
    
}
