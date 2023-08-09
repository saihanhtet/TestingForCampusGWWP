<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.DietManage" %>
<%@ page import="com.csm.entity.Diet" %>
<%@ page import="com.csm.DBManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diet Update Action</title>
</head>
<body>

<%

try {
    int dietId = Integer.parseInt(request.getParameter("diet_id"));
    
    String msg = "Failed to update the Diet. Please check the Diet ID.";

    Diet diet = new Diet(null, 0);
    diet.setDiet_Id(dietId);
    
    DietManage dietManage = new DietManage();
    int rowsAffected = -1;
	
    String dietType = request.getParameter("diet_type");
    int noOfFeed = Integer.parseInt(request.getParameter("no_of_feed"));
    diet.setDiet_Type(dietType);
    diet.setNo_Of_Feed(noOfFeed);
    rowsAffected = dietManage.update(diet);
    msg = "Successfully updated the Diet.";
    if (rowsAffected == 1) {
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