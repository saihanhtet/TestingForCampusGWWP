<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.DBManager"%>
<%@ page import="com.csm.dao.DietManage"%>
<%@ page import="com.csm.entity.Diet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go Wild Wildlife Park</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex">
			<div class="left-panel">
				<!--  Diet type update  -->
				<%
				String sId = request.getParameter("diet_id");
				if (sId == null) {
					out.println("Diet ID is not found");
				} else {
					int id = Integer.parseInt(sId);
					DietManage dao = new DietManage();
					try {
						Diet diet = dao.getById(id);
				%>
				<form action="diet_update_action.jsp" method="post">
					<input type="hidden" value="diet_type_update" name="form_status">
					<h5>Update Diet Type</h5>
					<table>
						<tr>
							<td><label for="diet_id">Enter the Diet ID:</label></td>
							<td><input type="text" name="diet_id" id="diet_id" readonly required
								value="<%=diet.getDiet_Id()%>"></td>
						</tr>
						<tr>
							<td><label for="diet_type">Enter the New Diet Type:</label></td>
							<td><input type="text" name="diet_type" id="diet_type"
								value="<%=diet.getDiet_Type()%>" required></td>
						</tr>
						<tr>
							<td><label for="no_of_feed">Enter the New No of
									Feed:</label></td>
							<td><input type="text" name="no_of_feed" id="no_of_feed"
								required value="<%=diet.getNo_Of_Feed()%>"></td>
						</tr>
						<tr>
							<td><button type="reset" class="form-btn">CLEAR</button></td>
							<td><button type="submit" class="form-btn">UPDATE</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="right-panel">
				<table>
					<tr>
						<th>Diet Id</th>
						<th>Diet Type</th>
						<th>No of Feed</th>
					</tr>
					<%@ page import="java.util.List"%>
					<%@ page import="com.csm.dao.DietManage"%>
					<%@ page import="com.csm.entity.Diet"%>
					<%
					DietManage dietManage = new DietManage();
					List<Diet> diets = dietManage.selectAll();

					if (diets != null && !diets.isEmpty()) {
						for (Diet dietnew : diets) {
					%>
					<tr>
						<td><%=dietnew.getDiet_Id()%></td>
						<td><%=dietnew.getDiet_Type()%></td>
						<td><%=dietnew.getNo_Of_Feed()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="3">No diets found</td>
					</tr>
					<%
					}
					} catch (ClassNotFoundException ex) {
					out.println(ex.getMessage());
					} catch (SQLException e) {
					out.println(e.getMessage());
					}
					}
					%>

				</table>
			</div>
		</main>
	</div>
</body>
</html>



