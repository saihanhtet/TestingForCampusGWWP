<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.AnimalsManage"%>
<%@ page import="com.csm.entity.Animals"%>
<%@ page import="com.csm.DBManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animal Update Action</title>
</head>

<body>
	<%
	try {
		int animal_id = Integer.parseInt(request.getParameter("animal_id"));
		int rowsAffected = -1;
		String msg = "Failed to update the Keeper. Please check the Keeper ID.";
		String selectedAction = request.getParameter("form_status");

		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();

		Animals animal = new Animals(null, null, null, 0, 0, 0, 0);
		animal.setAnimal_ID(animal_id);

		AnimalsManage animalsManage = new AnimalsManage();

		String animal_name = request.getParameter("animal_name");
		String sex = request.getParameter("sex");
		String year_arrive = request.getParameter("year_arrive");	
		int diet_id = Integer.parseInt(request.getParameter("diet_id"));
		int enclosure_id = Integer.parseInt(request.getParameter("enclosure_id"));
		int species_id = Integer.parseInt(request.getParameter("species_id"));
		int keeper_id = Integer.parseInt(request.getParameter("keeper_id"));
		
		animal.setAnimal_Name(animal_name);
		animal.setAnimal_Gender(sex);
		animal.setYear_Arrive(year_arrive);
		animal.setDiet_ID(diet_id);
		animal.setKeeper_ID(keeper_id);
		animal.setEnclosure_ID(enclosure_id);
		animal.setSpecies_ID(species_id);

		rowsAffected = animalsManage.Update(animal);
		msg = "Successfully updated the Animal.";

		if (rowsAffected == 1) {
			out.println(msg);
		} else {
			out.println(msg);
		}

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>