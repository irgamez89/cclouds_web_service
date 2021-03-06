package com.xedrux.cclouds.web.dao;

import com.xedrux.cclouds.web.entities.CcloudsLogs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

/**
 *
 * @author Isidro Rodríguez Gamez
 */
public class LogDAO implements CcloudsDAO{

    LogDAO instance;
    private JdbcTemplate dataSource;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = new JdbcTemplate(dataSource);
    }
    @Override
    public String getTableName() {
        return TABLE_NAME;
    }
    

    public LogDAO LogDAO() {
        if (instance == null) {
            instance = new LogDAO();
        }
        return instance;
    }

    public long insertLog(CcloudsLogs log) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        String template = "INSERT INTO %s (%s,"
                + "  %s, %s, %s, %s )"
                + "VALUES (?, ?, ?, ?, ?);";
        String INSERT_SQL = String.format(template, TABLE_NAME, 
                ID_USER, ACCION, TABLE, ID_REGISTRO, DESCRIPCION_OBJETO);
        
            dataSource.update((Connection connection) -> {
                PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[]{ID});
                ps.setObject(1, log.getIdUser());
                ps.setObject(2, log.getAccion());
                ps.setObject(3, log.getTableName());
                ps.setObject(4, log.getIdRegistro());
                ps.setObject(5, log.getDescripcionObjeto());
                return ps;
            }, keyHolder);
        
        return keyHolder.getKey().longValue();
    }
    
    public Collection<CcloudsLogs> getAllogs(){
        String sql = "select * from " + TABLE_NAME;
        try {
            List<CcloudsLogs> logs = dataSource.query(sql,
                    new LogsMapper());
            return logs;
        } catch (EmptyResultDataAccessException e) {
            return new LinkedList<>();
        }

    }
    private final class LogsMapper implements RowMapper<CcloudsLogs> {

        public CcloudsLogs mapRow(ResultSet rs, int rowNum) throws SQLException {
            CcloudsLogs log;
            log = new CcloudsLogs(
                    rs.getLong(ID),
                    rs.getLong(ID_USER),
                    rs.getTimestamp(DATE),
                    rs.getString(ACCION),
                    rs.getString(TABLE),
                    rs.getLong(ID_REGISTRO),
                    rs.getString(DESCRIPCION_OBJETO)
            );
            return log;
        }
    }
    String TABLE_NAME = "cclouds_logs";
    String ID = "id_log";
    String DATE = "last_date";
    String ID_USER = "id_user";
    String ACCION = "accion";
    String TABLE = "table_name";
    String ID_REGISTRO = "id_registro";
    String DESCRIPCION_OBJETO = "descripcion_objeto";
}
