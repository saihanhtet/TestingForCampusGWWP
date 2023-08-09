<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.EnclosureManage" %>
<%@ page import="com.csm.entity.Enclosures" %>
<%@ page import="com.csm.DBManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enclosures Delete Action</title>
</head>
<body>

<%

try {
    String enclosureIDParam = request.getParameter("enclosure_id");
    int rowsAffected = -1;

    if (enclosureIDParam != null && !enclosureIDParam.isEmpty()) {
        try {
            int enclosure_id = Integer.parseInt(enclosureIDParam);
            Enclosures enclosure = new Enclosures(null, null);
            enclosure.setEnclosure_ID(enclosure_id);
            EnclosureManage enclosureManage = new EnclosureManage();
            rowsAffected = enclosureManage.delete(enclosure);
            if (rowsAffected == 1) {
                out.println("Successfully deleted the Enclosures Record: " + enclosure_id);
            } else {
                out.println("Failed to delete the Enclosures. Please check again.");
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