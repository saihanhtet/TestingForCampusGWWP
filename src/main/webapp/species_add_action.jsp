<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.SpeciesManage"%>
<%@ page import="com.csm.entity.Species"%>
<%@ page import="com.csm.DBManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Species Add Action</title>
</head>

<body>
	<%
	try {
		String species_type = request.getParameter("species_type");
		String species_gp = request.getParameter("species_group");
		String species_lifestyle = request.getParameter("species_lifestyle");
		String species_status = request.getParameter("species_status");

		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();

		Species species = new Species(species_type, species_gp, species_lifestyle, species_status);

		SpeciesManage speciesManage = new SpeciesManage();
		int Affect = -1;

		Affect = speciesManage.insert(species);

		if (Affect == 1)
			out.println("Successfully Insert..");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>