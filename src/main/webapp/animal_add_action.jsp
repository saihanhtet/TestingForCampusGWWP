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
<title>Animal Add Action</title>
</head>

<body>
	<%
try
{
	String animal_name = request.getParameter("animal_name");
	String sex = request.getParameter("sex");
	String year_arrive = request.getParameter("year_arrive");
	int diet_id = Integer.parseInt(request.getParameter("diet_id"));
	int keeper_id = Integer.parseInt(request.getParameter("keeper_id"));
	int enclosure_id = Integer.parseInt(request.getParameter("enclosure_id"));
	int species_id = Integer.parseInt(request.getParameter("species_id"));
	
	DBManager dbMgr = new DBManager();
	dbMgr.getConnection();
	
	Animals animal = new Animals(animal_name, sex, year_arrive, diet_id, keeper_id, enclosure_id, species_id);

	AnimalsManage animalsManage = new AnimalsManage();
	int Affect = -1;
	
	Affect = animalsManage.Insert(animal);
	if(Affect == 1){   
		out.println("Successfully Inserted Animal..");
	}
	else{
		out.println("Error occurred");
	}

}catch (ClassNotFoundException e){
	e.printStackTrace();
}catch (SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>