package com.csm.dao;

import com.csm.*;
import java.sql.*;

import com.csm.entity.*;
import java.util.*;

public class DietManage {

	// diet insert
	public int insert(Diet d) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "insert into `GWWP`.`Diet` (`Diet_Type`,`No_Of_Feed`) values(?,?)";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// first and second parameters inserted diet type and no of feed
		prepare_statement.setString(1, d.getDiet_Type());
		prepare_statement.setInt(2, d.getNo_Of_Feed());
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};

	// diet type update
	public int update(Diet c) throws ClassNotFoundException, SQLException {

		int result = -1;

		// get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// prepare statement
		String sql = "UPDATE `GWWP`.`Diet` SET " + "`Diet_Type` = ?, " + "`No_of_Feed` = ?"
				+ " WHERE (`Diet_ID` = ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, c.getDiet_Type());
		pstmt.setInt(2, c.getNo_Of_Feed());
		pstmt.setInt(3, c.getDiet_Id());

		// execute statement
		result = pstmt.executeUpdate();
		return result;
	}

	// diet delete
	public int delete(Diet d) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "delete from `GWWP`.`Diet` where Diet_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// first and second parameters inserted diet type and no of feed
		prepare_statement.setInt(1, d.getDiet_Id());
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};

	// select diet
	public List<Diet> selectAll() throws ClassNotFoundException, SQLException {
		List<Diet> diets = new ArrayList<>();
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		String query = "select * from GWWP.Diet";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		ResultSet resultSet = prepare_statement.executeQuery();

		while (resultSet.next()) {
			Diet diet = new Diet(resultSet.getString("Diet_Type"), resultSet.getInt("No_Of_Feed"));
			diet.setDiet_Id(resultSet.getInt("Diet_ID"));
			diet.setDiet_Type(resultSet.getString("Diet_Type"));
			diet.setNo_Of_Feed(resultSet.getInt("No_Of_Feed"));
			diets.add(diet);
		}

		resultSet.close();
		prepare_statement.close();
		conn.close();
		return diets;
	}

	public Diet getById(int DietId) throws ClassNotFoundException, SQLException {
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// prepare statement
		sql = "SELECT * FROM `GWWP`.`Diet` " + "WHERE (`Diet_ID` = ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, DietId);
		ResultSet rs = pstmt.executeQuery();

		Diet diet = null;

		while (rs.next()) {
			diet = new Diet(rs.getString("Diet_Type"), rs.getInt("No_of_Feed"));
			diet.setDiet_Id(rs.getInt("Diet_ID"));
		}
		return diet;
	}

}
