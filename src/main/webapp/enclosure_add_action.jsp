<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.EnclosureManage"%>
<%@ page import="com.csm.entity.Enclosures"%>
<%@ page import="com.csm.DBManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enclosure Add Action</title>
</head>

<body>
	<%
	try {
		String enclosure_type = request.getParameter("enclosure_type");
		String enclosure_location = request.getParameter("enclosure_location");

		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();

		Enclosures enclosure = new Enclosures(enclosure_type, enclosure_location);

		EnclosureManage kMag = new EnclosureManage();
		int Affect = -1;

		Affect = kMag.insert(enclosure);

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