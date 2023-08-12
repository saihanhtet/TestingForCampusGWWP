package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.csm.DBManager;
import com.csm.entity.User;

public class UserManage {

    public int insert(User u) throws ClassNotFoundException, SQLException {
        int result = -1;
        // get the connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();
        // prepare statement
        String query = "call GWWP.create_user(?,?)";
        PreparedStatement prepare_statement = conn.prepareStatement(query);
        prepare_statement.setString(1, u.getUsername());
        prepare_statement.setString(2, u.getPassword());
        // execute statement
        result = prepare_statement.executeUpdate();
        return result;
    }

    public boolean validateUser(String username, String password) throws ClassNotFoundException, SQLException {
        boolean isValid = false;
        // get the connection
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();
        // prepare statement
        String query = "SELECT * FROM User WHERE username = ? AND password = ?";
        PreparedStatement prepare_statement = conn.prepareStatement(query);
        prepare_statement.setString(1, username);
        prepare_statement.setString(2, password);
        // execute query
        ResultSet resultSet = prepare_statement.executeQuery();
        if (resultSet.next()) {
            isValid = true; // User credentials are valid
        }
        return isValid;
    }
}
