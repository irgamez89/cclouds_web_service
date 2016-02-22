/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xedrux.cclouds.web.dao;

import com.xedrux.cclouds.web.entities.CcloudsRol;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.Resource;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
public class RolDAO {

    RolDAO instance;
    private JdbcTemplate dataSource;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = new JdbcTemplate(dataSource);
    }

    public RolDAO RolDAO() {
        if (instance == null) {
            instance = new RolDAO();
        }
        return instance;
    }
    public Collection<CcloudsRol> getAllRols(){
        String sql = "select * from " + TABLE_NAME;
        try {
            List<CcloudsRol> rols = dataSource.query(sql,
                    new RolMapper());
            return rols;
        } catch (EmptyResultDataAccessException e) {
            return new LinkedList<>();
        }

    }
    private  final class RolMapper  implements RowMapper<CcloudsRol>{

        @Override
        public CcloudsRol mapRow(ResultSet rs, int rowNum) throws SQLException {
            CcloudsRol u;
                            u = new CcloudsRol(
                                    rs.getInt(ID_ROL),
                                    rs.getString(NAME),
                                    rs.getString(DESCRIPTION)
                            );
                        return u;
        }
    }
String TABLE_NAME="cclouds_rol";
String ID_ROL="id_rol";
String NAME="name";
String DESCRIPTION="description";
}
