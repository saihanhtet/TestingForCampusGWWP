<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.KeeperManage"%>
<%@ page import="com.csm.entity.Keeper"%>
<%@ page import="com.csm.DBManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Keeper Add Action</title>
</head>

<body>
	<%
	try {
		String keeper_name = request.getParameter("keeper_name");
		String keeper_dob = request.getParameter("dob");
		String keeper_rank = request.getParameter("rank");

		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();

		Keeper keeper = new Keeper(keeper_name, keeper_dob, keeper_rank);

		KeeperManage kMag = new KeeperManage();
		int Affect = -1;

		Affect = kMag.insert(keeper);

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