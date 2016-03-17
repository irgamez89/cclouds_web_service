/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.entities;

import java.io.Serializable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Admin
 */
public class CcloudsParroquia implements Serializable {
    private static final long serialVersionUID = 1L;
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Basic(optional = false)
//    @Column(name = "id_parroquia")
    private Long idParroquia;
//    @Basic(optional = false)
    @NotNull
//    @Column(name = "code_parroquia")
    private int codeParroquia;
//    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
//    @Column(name = "name_parroquia")
    private String nameParroquia;
    @Size(max = 50)
//    @Column(name = "description_parroquia")
    private String descriptionParroquia;
//    @JoinColumn(name = "id_city", referencedColumnName = "id_city")
//    @ManyToOne(optional = false)
    private long idCity;

    public CcloudsParroquia() {
    }

    public CcloudsParroquia(Long idParroquia) {
        this.idParroquia = idParroquia;
    }

    public CcloudsParroquia(Long idParroquia, long idCity, int codeParroquia, 
            String nameParroquia, String description) {
        this.idParroquia = idParroquia;
        this.idCity = idCity;
        this.codeParroquia = codeParroquia;
        this.nameParroquia = nameParroquia;
        this.descriptionParroquia = description;
    }

        public int getCodeParroquia() {
        return codeParroquia;
    }

    public void setCodeParroquia(int codeParroquia) {
        this.codeParroquia = codeParroquia;
    }

    public String getNameParroquia() {
        return nameParroquia;
    }

    public void setNameParroquia(String nameParroquia) {
        this.nameParroquia = nameParroquia;
    }

    public String getDescriptionParroquia() {
        return descriptionParroquia;
    }

    public void setDescriptionParroquia(String descriptionParroquia) {
        this.descriptionParroquia = descriptionParroquia;
    }

    public Long getIdParroquia() {
        return idParroquia;
    }

    public long getIdCity() {
        return idCity;
    }

    public void setIdParroquia(Long idParroquia) {
        this.idParroquia = idParroquia;
    }

    public void setIdCity(long idCity) {
        this.idCity = idCity;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idParroquia != null ? idParroquia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CcloudsParroquia)) {
            return false;
        }
        CcloudsParroquia other = (CcloudsParroquia) object;
        if ((this.idParroquia == null && other.idParroquia != null) || (this.idParroquia != null && !this.idParroquia.equals(other.idParroquia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsParroquia[ idParroquia=" + idParroquia + " ]";
    }
    
}
