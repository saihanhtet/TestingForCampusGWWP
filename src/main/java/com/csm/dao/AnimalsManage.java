package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csm.*;
import com.csm.entity.*;

public class AnimalsManage {
	public int Insert(Animals a) throws ClassNotFoundException, SQLException {
		int result = -1;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		String query = "insert into GWWP.Animals ("
				+ "Animal_Name, Animal_Gender, Year_Arrive, Keeper_ID, Diet_ID, Enclosure_ID, Species_ID) "
				+ "values (?,?,?,?,?,?,?)";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		prepare_statement.setString(1, a.getAnimal_Name());
		prepare_statement.setString(2, a.getAnimal_Gender());
		prepare_statement.setString(3, a.getYear_Arrive());
		prepare_statement.setInt(4, a.getKeeper_ID());
		prepare_statement.setInt(5, a.getDiet_ID());
		prepare_statement.setInt(6, a.getEnclosure_ID());
		prepare_statement.setInt(7, a.getSpecies_ID());

		result = prepare_statement.executeUpdate();
		return result;
	}

	public int Update(Animals a) throws ClassNotFoundException, SQLException {
		int result = -1;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		String query = "UPDATE GWWP.Animals SET "
				+ "Animal_Name=?,"
				+ "Animal_Gender=?,"
				+ "Year_Arrive=?,"
				+ "Keeper_ID=?,"
				+ "Diet_ID=?,"
				+ "Enclosure_ID=?,"
				+ "Species_ID=?  WHERE Animal_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		prepare_statement.setString(1, a.getAnimal_Name());
		prepare_statement.setString(2, a.getAnimal_Gender());
		prepare_statement.setString(3, a.getYear_Arrive());
		prepare_statement.setInt(4, a.getKeeper_ID());
		prepare_statement.setInt(5, a.getDiet_ID());
		prepare_statement.setInt(6, a.getEnclosure_ID());
		prepare_statement.setInt(7, a.getSpecies_ID());
		prepare_statement.setInt(8, a.getAnimal_ID());

		result = prepare_statement.executeUpdate();
		return result;
	}


	public int Delete(Animals a) throws ClassNotFoundException, SQLException {
		int result = -1;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		String query = "delete from GWWP.Animals where Animal_ID=?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		prepare_statement.setInt(1, a.getAnimal_ID());

		result = prepare_statement.executeUpdate();
		return result;
	}

	public List<Animals> selectAll() throws ClassNotFoundException, SQLException {
		List<Animals> animals = new ArrayList<>();
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		String query = "select * from GWWP.Animals";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		ResultSet resultSet = prepare_statement.executeQuery();

		while (resultSet.next()) {
			Animals animal = new Animals(resultSet.getString("Animal_Name"), resultSet.getString("Animal_Gender"),
					resultSet.getString("Year_Arrive"), resultSet.getInt("Keeper_ID"), resultSet.getInt("Diet_ID"),
					resultSet.getInt("Enclosure_ID"), resultSet.getInt("Species_ID"));
			animal.setAnimal_ID(resultSet.getInt("Animal_ID"));
			animals.add(animal);
		}

		resultSet.close();
		prepare_statement.close();
		conn.close();
		return animals;
	}

	public ArrayList<Animals> fetchDaveorTemi() throws ClassNotFoundException, SQLException {
		ArrayList<Animals> animal = new ArrayList<Animals>();
		Animals animalInfo;

		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		String sql = "SELECT * FROM GWWP.report1;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet resultSet = pstmt.executeQuery();

		while (resultSet.next()) {
			animalInfo = new Animals(resultSet.getString("A_Name"), resultSet.getString("A_Gender"),
					resultSet.getString("A_Arrived"), resultSet.getInt("K_ID"), 0, 0, 0);
			animalInfo.setAnimal_ID(resultSet.getInt("A_ID"));
			animalInfo.setKeeper_Name(resultSet.getString("K_Name"));
			animal.add(animalInfo);
		}
		return animal;

	}

	public ArrayList<Animals> fetchAnimalGroupByKeeper() throws ClassNotFoundException, SQLException { // select all
		ArrayList<Animals> animals = new ArrayList<Animals>();
		Animals animalinfobykeeper;
		// get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		String sql = "select \n"
				+ "	GWWP.Keepers.Keeper_Name as Keeper_Name, \n"
				+ "    count(GWWP.Animals.Animal_ID) as Total_Animals\n"
				+ "from GWWP.Keepers\n"
				+ "left join GWWP.Animals\n"
				+ "on GWWP.Keepers.Keeper_ID = GWWP.Animals.Keeper_ID\n"
				+ "group by GWWP.Keepers.Keeper_ID;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			animalinfobykeeper = new Animals(
					rs.getString("Keeper_Name"), rs.getInt("Total_Animals"));

			animals.add(animalinfobykeeper);
		}

		return animals;

	}

	public Animals getAnimalByID(int animalID) throws ClassNotFoundException, SQLException {
		Animals animal = null;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		String query = "SELECT * FROM GWWP.Animals WHERE Animal_ID = ?";
		PreparedStatement prepare_statement = conn.prepareStatement(query);
		prepare_statement.setInt(1, animalID);
		ResultSet resultSet = prepare_statement.executeQuery();

		if (resultSet.next()) {
			animal = new Animals(resultSet.getString("Animal_Name"), resultSet.getString("Animal_Gender"),
					resultSet.getString("Year_Arrive"), resultSet.getInt("Keeper_ID"), resultSet.getInt("Diet_ID"),
					resultSet.getInt("Enclosure_ID"), resultSet.getInt("Species_ID"));
			animal.setAnimal_ID(resultSet.getInt("Animal_ID"));
		}

		resultSet.close();
		prepare_statement.close();
		conn.close();
		return animal;
	}
}
