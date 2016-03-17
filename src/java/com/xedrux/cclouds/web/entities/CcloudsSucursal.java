/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "cclouds_sucursal")
@NamedQueries({
    @NamedQuery(name = "CcloudsSucursal.findAll", query = "SELECT c FROM CcloudsSucursal c")})
public class CcloudsSucursal implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_sucursal")
    private Integer idSucursal;
    @Size(max = 255)
    @Column(name = "nombre_sucursal")
    private String nombreSucursal;
    @Size(max = 500)
    @Column(name = "observacion_sucursal")
    private String observacionSucursal;
    @Column(name = "id_representante_sucursal")
    private Integer idRepresentanteSucursal;
    @OneToMany(mappedBy = "idSucursal")
    private Collection<CcloudsAgencia> ccloudsAgenciaCollection;
    @JoinColumn(name = "id_sub_empresa", referencedColumnName = "id_sub_empresa")
    @ManyToOne
    private CcloudsSubEmpresa idSubEmpresa;

    public CcloudsSucursal() {
    }

    public CcloudsSucursal(Integer idSucursal) {
        this.idSucursal = idSucursal;
    }

    public Integer getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(Integer idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getNombreSucursal() {
        return nombreSucursal;
    }

    public void setNombreSucursal(String nombreSucursal) {
        this.nombreSucursal = nombreSucursal;
    }

    public String getObservacionSucursal() {
        return observacionSucursal;
    }

    public void setObservacionSucursal(String observacionSucursal) {
        this.observacionSucursal = observacionSucursal;
    }

    public Integer getIdRepresentanteSucursal() {
        return idRepresentanteSucursal;
    }

    public void setIdRepresentanteSucursal(Integer idRepresentanteSucursal) {
        this.idRepresentanteSucursal = idRepresentanteSucursal;
    }

    public Collection<CcloudsAgencia> getCcloudsAgenciaCollection() {
        return ccloudsAgenciaCollection;
    }

    public void setCcloudsAgenciaCollection(Collection<CcloudsAgencia> ccloudsAgenciaCollection) {
        this.ccloudsAgenciaCollection = ccloudsAgenciaCollection;
    }

    public CcloudsSubEmpresa getIdSubEmpresa() {
        return idSubEmpresa;
    }

    public void setIdSubEmpresa(CcloudsSubEmpresa idSubEmpresa) {
        this.idSubEmpresa = idSubEmpresa;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSucursal != null ? idSucursal.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CcloudsSucursal)) {
            return false;
        }
        CcloudsSucursal other = (CcloudsSucursal) object;
        if ((this.idSucursal == null && other.idSucursal != null) || (this.idSucursal != null && !this.idSucursal.equals(other.idSucursal))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsSucursal[ idSucursal=" + idSucursal + " ]";
    }
    
}
