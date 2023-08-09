<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diet View</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex table-view">
			<table>
				<thead>
					<tr>
						<th>Diet Id</th>
						<th>Diet Type</th>
						<th>No of Feed</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
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
						<td><a
							href="diet_update.jsp?diet_id=<%=diet.getDiet_Id()%>">Update</a>
							<a href="diet_delete_action.jsp?diet_id=<%=diet.getDiet_Id()%>">Delete</a>
						</td>
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
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>