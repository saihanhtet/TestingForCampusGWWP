<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.AnimalsManage" %>
<%@ page import="com.csm.entity.Animals" %>
<%@ page import="com.csm.DBManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal Delete Action</title>
</head>
<body>

<%


try {
    String animalIDParam = request.getParameter("animal_id");
    int rowsAffected = -1;

    if (animalIDParam != null && !animalIDParam.isEmpty()) {
        try {
            int animal_id = Integer.parseInt(animalIDParam);
            Animals animal = new Animals(null, null, null, 0, 0, 0, 0);
            animal.setAnimal_ID(animal_id);
            AnimalsManage animalManage = new AnimalsManage();
            rowsAffected = animalManage.Delete(animal);
            if (rowsAffected == 1) {
                out.println("Successfully deleted the Animal Record: " + animal_id);
            } else {
                out.println("Failed to delete the Animal. Please check again.");
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
