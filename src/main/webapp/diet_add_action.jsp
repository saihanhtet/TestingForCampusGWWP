<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.DietManage"%>
<%@ page import="com.csm.entity.Diet"%>
<%@ page import="com.csm.DBManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Diet Add Action</title>
</head>

<body>
	<%
	try {
		String dt = request.getParameter("diet_type");

		int df = Integer.parseInt(request.getParameter("no_of_feed"));
		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();
		Diet c = new Diet(dt, df);
		DietManage eMag = new DietManage();
		int Affect = -1;
		Affect = eMag.insert(c);
		if (Affect == 1)
			out.println("Successfully Insert Diet..");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>