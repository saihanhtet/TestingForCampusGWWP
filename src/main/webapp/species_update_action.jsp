<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.SpeciesManage"%>
<%@ page import="com.csm.entity.Species"%>
<%@ page import="com.csm.DBManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Species Update Action</title>
</head>
<body>

	<%
	try {
		int species_id = Integer.parseInt(request.getParameter("species_id"));
		String selectedAction = request.getParameter("form_status");
		String msg = "Failed to update the Species. Please check the Species ID.";
		int rowsAffected = -1;

		Species species = new Species(null, null, null, null);
		species.setSpecies_ID(species_id);

		SpeciesManage speciesManage = new SpeciesManage();
		
		String species_type = request.getParameter("species_type");
		String species_gp = request.getParameter("species_group");
		String species_lifestyle = request.getParameter("species_lifestyle");
		String species_status = request.getParameter("species_status");
		
		species.setSpecies_Type(species_type);
		species.setSpecies_GP(species_gp);
		species.setSpecies_Lifestyle(species_lifestyle);
		species.setConservationStatus(species_status);
		
		rowsAffected = speciesManage.update(species);

		if (rowsAffected == 1) {
			msg = "Successfully updated the Species.";
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