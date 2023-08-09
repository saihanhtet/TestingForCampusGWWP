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
<title>Species Delete Action</title>
</head>
<body>

	<%
	try {
		String speciesIDParam = request.getParameter("species_id");
		int rowsAffected = -1;

		if (speciesIDParam != null && !speciesIDParam.isEmpty()) {
			try {
		int species_id = Integer.parseInt(speciesIDParam);
		Species specie = new Species(null, null, null, null);
		specie.setSpecies_ID(species_id);
		SpeciesManage speciesManage = new SpeciesManage();
		rowsAffected = speciesManage.delete(specie);
		if (rowsAffected == 1) {
			out.println("Successfully deleted the Species Record: " + species_id);
		} else {
			out.println("Failed to delete the Species. Please check again.");
		}
			} catch (NumberFormatException e) {
		out.println("The input value is not valid");
			}
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>

</body>
</html>