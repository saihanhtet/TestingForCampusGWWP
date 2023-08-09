<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report 1</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex table-view">
			<table>
				<thead>
					<tr>
						<th>Keepers Name</th>
						<th>Total Animals</th>
					</tr>
				</thead>
				<tbody>
					<%@ page import="java.util.ArrayList"%>
					<%@ page import="java.sql.*"%>
					<%@ page import="com.csm.dao.AnimalsManage"%>
					<%@ page import="com.csm.entity.Animals"%>
					<%
					try {
						AnimalsManage animalManage = new AnimalsManage();
						ArrayList<Animals> animals = animalManage.fetchAnimalGroupByKeeper();

						if (animals != null && !animals.isEmpty()) {
							for (Animals a : animals) {
					%>
					<tr>
						<td> <%= a.getKeeper_Name() %></td>
						<td> <%= a.getTotal_Animals() %></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="3">No Animals found</td>
					</tr>
					<%
					}
					} catch (ClassNotFoundException e) {
					e.printStackTrace();
					} catch (SQLException e) {
					e.printStackTrace();
					}
					%>
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>