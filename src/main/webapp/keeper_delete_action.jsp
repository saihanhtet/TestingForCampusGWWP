<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.dao.KeeperManage"%>
<%@ page import="com.csm.entity.Keeper"%>
<%@ page import="com.csm.DBManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keeper Delete Action</title>
</head>
<body>

	<%
	try {
		String keeperIDParam = request.getParameter("keeper_id");
		int rowsAffected = -1;

		if (keeperIDParam != null && !keeperIDParam.isEmpty()) {
			try {
		int keeper_id = Integer.parseInt(keeperIDParam);
		Keeper keeper = new Keeper(null, null, null);
		keeper.setKeeper_ID(keeper_id);
		KeeperManage keeperManage = new KeeperManage();
		rowsAffected = keeperManage.delete(keeper);
		if (rowsAffected == 1) {
			out.println("Successfully deleted the Keeper Record: " + keeper_id);
		} else {
			out.println("Failed to delete the Keeper. Please check again.");
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