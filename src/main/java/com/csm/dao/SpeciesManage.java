package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csm.DBManager;
import com.csm.entity.Species;

public class SpeciesManage {
	public int insert (Species s) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection 
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "insert into `GWWP`.`Species` ("
				+ "Species_Type, Species_GP, Species_Lifestyle, ConservationStatus) "
				+ "values(?,?,?,?)";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// insert species details
		prepare_statement.setString(1, s.getSpecies_Type());
		prepare_statement.setString(2, s.getSpecies_GP());
		prepare_statement.setString(3, s.getSpecies_Lifestyle());
		prepare_statement.setString(4, s.getConservationStatus());
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};
	public Species getSpeciesById(int Species_ID) throws ClassNotFoundException, SQLException {
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// prepare statement
		sql = "SELECT * FROM `GWWP`.`Species` " + "WHERE (`Species_ID` = ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, Species_ID);
		ResultSet rs = pstmt.executeQuery();

		Species s = null;

		while (rs.next()) {
			s = new Species(
					rs.getString("Species_Type"), rs.getString("Species_GP"), rs.getString("Species_Lifestyle"),
					rs.getString("ConservationStatus"));
			s.setSpecies_ID(rs.getInt("Species_ID"));
		}
		return s;
	}
		
	public int update (Species s) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection 
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "update GWWP.Species set "
				+ "Species_Type=?,"
				+ "Species_GP=?,"
				+ "Species_Lifestyle=?,"
				+ "ConservationStatus=? where Species_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		prepare_statement.setString(1, s.getSpecies_Type());
		prepare_statement.setString(2, s.getSpecies_GP());
		prepare_statement.setString(3, s.getSpecies_Lifestyle());
		prepare_statement.setString(4, s.getConservationStatus());
		prepare_statement.setInt(5, s.getSpecies_ID());		
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};
		
		
	
	public int delete (Species s) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection 
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "delete from `GWWP`.`Species` where Species_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		prepare_statement.setInt(1, s.getSpecies_ID());		
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};
	public List<Species> selectAll() throws ClassNotFoundException, SQLException {
        List<Species> species = new ArrayList<>();
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();
        
        String query = "select * from GWWP.Species";
        PreparedStatement prepare_statement = conn.prepareStatement(query);
        ResultSet resultSet = prepare_statement.executeQuery();

        while (resultSet.next()) {
            Species specie = new Species(resultSet.getString("Species_Type"),resultSet.getString("Species_GP"), resultSet.getString("Species_Lifestyle"), resultSet.getString("ConservationStatus"));
            specie.setSpecies_ID(resultSet.getInt("Species_ID"));
            specie.setSpecies_Type(resultSet.getString("Species_Type"));
            specie.setSpecies_GP(resultSet.getString("Species_GP"));
            specie.setSpecies_Lifestyle(resultSet.getString("Species_Lifestyle"));
            specie.setConservationStatus(resultSet.getString("ConservationStatus"));
            species.add(specie);
        }

        resultSet.close();
        prepare_statement.close();
        conn.close();
        return species;
    }
}
