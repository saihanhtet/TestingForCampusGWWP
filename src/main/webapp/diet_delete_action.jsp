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
<title>Diet Delete Action</title>
</head>
<body>

<%

try {
    String dietIDParam = request.getParameter("diet_id");
    
    int rowsAffected = -1;

    if (dietIDParam != null && !dietIDParam.isEmpty()) {
        try {
            int diet_id = Integer.parseInt(dietIDParam);
            int dietId = Integer.parseInt(request.getParameter("diet_id"));
            Diet diet = new Diet(null, 0);
            diet.setDiet_Id(diet_id);
            DietManage dietManage = new DietManage();
            rowsAffected = dietManage.delete(diet);
            if (rowsAffected == 1) {
                out.println("Successfully delete the Diet Record: "+ diet_id);
            } else {
                out.println("Failed to delete the Diet. Please check again.");
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