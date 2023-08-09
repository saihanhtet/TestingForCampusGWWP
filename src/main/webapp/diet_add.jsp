<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<form action="diet_add_action.jsp">
					<h3>Add Diet</h3>
					<table>
						<tr>
							<td><label for="diet_type">Enter the Diet Type:</label></td>
							<td><input type="text" name="diet_type" id="diet_type"
								placeholder="e.g., Carnivore" required></td>
						</tr>
						<tr>
							<td><label for="no_of_feed">Enter the No of Feed:</label></td>
							<td><input type="text" name="no_of_feed" id="diet_type"
								placeholder="e.g., 1" required></td>
						</tr>
						<tr>
							<td><button type="reset" class="form-btn">CLEAR</button></td>
							<td><button type="submit" class="form-btn">ADD</button></td>
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
						for (Diet diet : diets) {
					%>
					<tr>
						<td><%=diet.getDiet_Id()%></td>
						<td><%=diet.getDiet_Type()%></td>
						<td><%=diet.getNo_Of_Feed()%></td>
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
					%>
				</table>
			</div>
		</main>
	</div>
</body>
</html>

