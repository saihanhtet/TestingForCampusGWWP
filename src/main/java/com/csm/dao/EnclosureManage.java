package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csm.DBManager;
import com.csm.entity.Enclosures;

public class EnclosureManage {
	// diet insert
	public int insert(Enclosures e) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "insert into GWWP.Enclosures (Enclosure_Type,Enclosure_Location) values(?,?)";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// insert enclosure details
		prepare_statement.setString(1, e.getEnclosure_Type());
		prepare_statement.setString(2, e.getEnclosure_Location());
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};

	public Enclosures getEnclosureById(int Enclosures_ID) throws ClassNotFoundException, SQLException {
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// prepare statement
		sql = "SELECT * FROM `GWWP`.`Enclosures` " + "WHERE (`Enclosure_ID` = ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, Enclosures_ID);
		ResultSet rs = pstmt.executeQuery();

		Enclosures e = null;

		while (rs.next()) {
			e = new Enclosures(
					rs.getString("Enclosure_Type"), rs.getString("Enclosure_Location"));
			e.setEnclosure_ID(rs.getInt("Enclosure_ID"));
		}
		return e;
	}

	public int Update(Enclosures e) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "update GWWP.Enclosures set "
				+ "Enclosure_Type=?,"
				+ "Enclosure_Location=? where Enclosure_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// update enclosure type with id
		prepare_statement.setString(1, e.getEnclosure_Type());
		prepare_statement.setString(2, e.getEnclosure_Location());
		prepare_statement.setInt(3, e.getEnclosure_ID());
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};

	public int delete(Enclosures e) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "delete from `GWWP`.`Enclosures` where Enclosure_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// delete enclosure with id
		prepare_statement.setInt(1, e.getEnclosure_ID());
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};

	public List<Enclosures> selectAll() throws ClassNotFoundException, SQLException {
		List<Enclosures> enclosures = new ArrayList<>();
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		String query = "select * from GWWP.Enclosures";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		ResultSet resultSet = prepare_statement.executeQuery();

		while (resultSet.next()) {
			Enclosures enclosure = new Enclosures(resultSet.getString("Enclosure_Type"),
					resultSet.getString("Enclosure_Location"));
			enclosure.setEnclosure_ID(resultSet.getInt("Enclosure_ID"));
			enclosure.setEnclosure_Type(resultSet.getString("Enclosure_Type"));
			enclosure.setEnclosure_Location(resultSet.getString("Enclosure_Location"));
			enclosures.add(enclosure);
		}

		resultSet.close();
		prepare_statement.close();
		conn.close();
		return enclosures;
	}
}
