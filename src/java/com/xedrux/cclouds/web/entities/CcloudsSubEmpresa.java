/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "cclouds_sub_empresa")
@NamedQueries({
    @NamedQuery(name = "CcloudsSubEmpresa.findAll", query = "SELECT c FROM CcloudsSubEmpresa c")})
public class CcloudsSubEmpresa implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_sub_empresa")
    private Integer idSubEmpresa;
    @Size(max = 255)
    @Column(name = "nombre_sub_empresa")
    private String nombreSubEmpresa;
    @Size(max = 500)
    @Column(name = "observacion_sub_empresa")
    private String observacionSubEmpresa;
    @Column(name = "id_tipo_negocio_sub_empresa")
    private Integer idTipoNegocioSubEmpresa;
    @Column(name = "id_representante_1_sub_empresa")
    private Integer idRepresentante1SubEmpresa;
    @Column(name = "id_representante_2_sub_empresa")
    private Integer idRepresentante2SubEmpresa;
    @Column(name = "fecha_constitucion_sub_empresa")
    @Temporal(TemporalType.DATE)
    private Date fechaConstitucionSubEmpresa;
    @Size(max = 500)
    @Column(name = "eslogan_sub_empresa")
    private String esloganSubEmpresa;
    @Size(max = 500)
    @Column(name = "imagen_logo_sub_empresa")
    private String imagenLogoSubEmpresa;
    @JoinColumn(name = "id_empresa", referencedColumnName = "id_empresa")
    @ManyToOne
    private CcloudsEmpresa idEmpresa;
    @OneToMany(mappedBy = "idSubEmpresa")
    private Collection<CcloudsSucursal> ccloudsSucursalCollection;

    public CcloudsSubEmpresa() {
    }

    public CcloudsSubEmpresa(Integer idSubEmpresa) {
        this.idSubEmpresa = idSubEmpresa;
    }

    public Integer getIdSubEmpresa() {
        return idSubEmpresa;
    }

    public void setIdSubEmpresa(Integer idSubEmpresa) {
        this.idSubEmpresa = idSubEmpresa;
    }

    public String getNombreSubEmpresa() {
        return nombreSubEmpresa;
    }

    public void setNombreSubEmpresa(String nombreSubEmpresa) {
        this.nombreSubEmpresa = nombreSubEmpresa;
    }

    public String getObservacionSubEmpresa() {
        return observacionSubEmpresa;
    }

    public void setObservacionSubEmpresa(String observacionSubEmpresa) {
        this.observacionSubEmpresa = observacionSubEmpresa;
    }

    public Integer getIdTipoNegocioSubEmpresa() {
        return idTipoNegocioSubEmpresa;
    }

    public void setIdTipoNegocioSubEmpresa(Integer idTipoNegocioSubEmpresa) {
        this.idTipoNegocioSubEmpresa = idTipoNegocioSubEmpresa;
    }

    public Integer getIdRepresentante1SubEmpresa() {
        return idRepresentante1SubEmpresa;
    }

    public void setIdRepresentante1SubEmpresa(Integer idRepresentante1SubEmpresa) {
        this.idRepresentante1SubEmpresa = idRepresentante1SubEmpresa;
    }

    public Integer getIdRepresentante2SubEmpresa() {
        return idRepresentante2SubEmpresa;
    }

    public void setIdRepresentante2SubEmpresa(Integer idRepresentante2SubEmpresa) {
        this.idRepresentante2SubEmpresa = idRepresentante2SubEmpresa;
    }

    public Date getFechaConstitucionSubEmpresa() {
        return fechaConstitucionSubEmpresa;
    }

    public void setFechaConstitucionSubEmpresa(Date fechaConstitucionSubEmpresa) {
        this.fechaConstitucionSubEmpresa = fechaConstitucionSubEmpresa;
    }

    public String getEsloganSubEmpresa() {
        return esloganSubEmpresa;
    }

    public void setEsloganSubEmpresa(String esloganSubEmpresa) {
        this.esloganSubEmpresa = esloganSubEmpresa;
    }

    public String getImagenLogoSubEmpresa() {
        return imagenLogoSubEmpresa;
    }

    public void setImagenLogoSubEmpresa(String imagenLogoSubEmpresa) {
        this.imagenLogoSubEmpresa = imagenLogoSubEmpresa;
    }

    public CcloudsEmpresa getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(CcloudsEmpresa idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public Collection<CcloudsSucursal> getCcloudsSucursalCollection() {
        return ccloudsSucursalCollection;
    }

    public void setCcloudsSucursalCollection(Collection<CcloudsSucursal> ccloudsSucursalCollection) {
        this.ccloudsSucursalCollection = ccloudsSucursalCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSubEmpresa != null ? idSubEmpresa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CcloudsSubEmpresa)) {
            return false;
        }
        CcloudsSubEmpresa other = (CcloudsSubEmpresa) object;
        if ((this.idSubEmpresa == null && other.idSubEmpresa != null) || (this.idSubEmpresa != null && !this.idSubEmpresa.equals(other.idSubEmpresa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsSubEmpresa[ idSubEmpresa=" + idSubEmpresa + " ]";
    }
    
}
