package com.xedrux.cclouds.web.entities;

import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
//@Table(name = "cclouds_logs")
public class CcloudsLogs {
    private Integer idLog;
    @NotNull
    private Date createDate;
    @NotNull
    private Date updateDate;
    @Size(max = 255)
    private String accion;
    private Integer idTable;

    public CcloudsLogs() {
    }

    public CcloudsLogs(Integer idLog) {
        this.idLog = idLog;
    }

    public CcloudsLogs(Integer idLog, Date createDate, Date updateDate) {
        this.idLog = idLog;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public Integer getIdLog() {
        return idLog;
    }

    public void setIdLog(Integer idLog) {
        this.idLog = idLog;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public Integer getIdTable() {
        return idTable;
    }

    public void setIdTable(Integer idTable) {
        this.idTable = idTable;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idLog != null ? idLog.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CcloudsLogs)) {
            return false;
        }
        CcloudsLogs other = (CcloudsLogs) object;
        if ((this.idLog == null && other.idLog != null) || (this.idLog != null && !this.idLog.equals(other.idLog))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.xedrux.cclouds.web.entities.CcloudsLogs[ idLog=" + idLog + " ]";
    }
    
}
