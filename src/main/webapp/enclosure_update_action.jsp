<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.EnclosureManage"%>
<%@ page import="com.csm.entity.Enclosures"%>
<%@ page import="com.csm.DBManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enclosure Update Action</title>
</head>
<body>

	<%
	try {
		int enclosure_id = Integer.parseInt(request.getParameter("enclosure_id"));

		Enclosures enclosure = new Enclosures("", "");
		enclosure.setEnclosure_ID(enclosure_id);

		EnclosureManage enclosureManage = new EnclosureManage();
		int rowsAffected = -1;

		String selectedAction = request.getParameter("form_status");
		String enclosure_type = request.getParameter("enclosure_type");
		String enclosure_location = request.getParameter("enclosure_location");
		
		enclosure.setEnclosure_Type(enclosure_type);
		enclosure.setEnclosure_Location(enclosure_location);
		String msg = "Successfully updated the Enclosures.";
		rowsAffected = enclosureManage.Update(enclosure);

		if (rowsAffected == 1) {
			out.println(msg);
		} else {
			msg = "Failed to update the Enclosures. Please check the Enclosures ID.";
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