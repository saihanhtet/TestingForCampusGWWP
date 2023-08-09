<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.KeeperManage" %>
<%@ page import="com.csm.entity.Keeper" %>
<%@ page import="com.csm.DBManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keeper Update Action</title>
</head>
<body>

<%

try{
	int keeper_id = Integer.parseInt(request.getParameter("keeper_id"));
	String msg = "Failed to update the Keeper. Please check the Keeper ID.";

    Keeper keeper = new Keeper(null,null, null);
    keeper.setKeeper_ID(keeper_id);
    
    
    KeeperManage keeperManage = new KeeperManage();
    int rowsAffected = -1;
    
    String selectedAction = request.getParameter("form_status");
    
    String keeper_name = request.getParameter("keeper_name");
    String keeper_dob = request.getParameter("dob");
    String keeper_rank = request.getParameter("rank");
	keeper.setKeeper_Name(keeper_name);
	keeper.setKeeper_DOB(keeper_dob);
	keeper.setKeeper_Rank(keeper_rank);
    rowsAffected = keeperManage.update(keeper);
    
    if (rowsAffected == 1) {
    	msg = "Successfully updated the Keeper.";
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