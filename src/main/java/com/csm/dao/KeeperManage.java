package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csm.DBManager;
import com.csm.entity.Keeper;

public class KeeperManage {
	
	public int insert (Keeper k) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection 
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "insert into `GWWP`.`Keepers` (Keeper_Name, Keeper_DOB, Keeper_Rank) values(?,?,?)";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// insert keeper details
		prepare_statement.setString(1, k.getKeeper_Name());
		prepare_statement.setString(2, k.getKeeper_DOB());
		prepare_statement.setString(3, k.getKeeper_Rank());	
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};
	
	public Keeper getKeeperById(int Keeper_ID) throws ClassNotFoundException, SQLException {
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// prepare statement
		sql = "SELECT * FROM `GWWP`.`Keepers` " + "WHERE (`Keeper_ID` = ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, Keeper_ID);
		ResultSet rs = pstmt.executeQuery();

		Keeper k = null;

		while (rs.next()) {
			k = new Keeper(
					rs.getString("Keeper_Name"), rs.getString("Keeper_DOB"), rs.getString("Keeper_Rank"));
			k.setKeeper_ID(rs.getInt("Keeper_ID"));
		}
		return k;
	}
	
	
	public int update (Keeper k) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection 
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "update GWWP.Keepers set "
				+ "Keeper_Name=?,"
				+ "Keeper_DOB=?,"
				+ "Keeper_Rank=? where Keeper_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// update keeper name with id
		prepare_statement.setString(1, k.getKeeper_Name());
		prepare_statement.setString(2, k.getKeeper_DOB());
		prepare_statement.setString(3, k.getKeeper_Rank());
		prepare_statement.setInt(4, k.getKeeper_ID());		
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};
		
		
	public int delete (Keeper k) throws ClassNotFoundException, SQLException {
		int result = -1;
		// get the connection 
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// prepare statement
		String query = "delete from `GWWP`.`Keepers` where Keeper_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		// delete keeper with id
		prepare_statement.setInt(1, k.getKeeper_ID());		
		// execute statement
		result = prepare_statement.executeUpdate();
		return result;
	};
	
	public List<Keeper> selectAll() throws ClassNotFoundException, SQLException {
        List<Keeper> keepers = new ArrayList<>();
        DBManager dbMgr = new DBManager();
        Connection conn = dbMgr.getConnection();
        
        String query = "select * from GWWP.Keepers";
        PreparedStatement prepare_statement = conn.prepareStatement(query);
        ResultSet resultSet = prepare_statement.executeQuery();

        while (resultSet.next()) {
            Keeper keeper = new Keeper(resultSet.getString("Keeper_Name"),resultSet.getString("Keeper_DOB"), resultSet.getString("Keeper_Rank"));
            keeper.setKeeper_ID(resultSet.getInt("Keeper_ID"));
            keeper.setKeeper_Name(resultSet.getString("Keeper_Name"));
            keeper.setKeeper_DOB(resultSet.getString("Keeper_DOB"));
            keeper.setKeeper_Rank(resultSet.getString("Keeper_Rank"));
            keepers.add(keeper);
        }

        resultSet.close();
        prepare_statement.close();
        conn.close();
        return keepers;
    }
}
