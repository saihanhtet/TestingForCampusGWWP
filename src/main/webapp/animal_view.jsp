<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animals View</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex table-view">
			<table>
				<thead>
					<tr>
						<th>Animal Id</th>
						<th>Animal Name</th>
						<th>Animal Gender</th>
						<th>Year Arrive</th>
						<th>Diet_Id</th>
						<th>Keeper_Id</th>
						<th>Enclosure_Id</th>
						<th>Species_Id</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%@ page import="java.util.List"%>
					<%@ page import="com.csm.dao.AnimalsManage"%>
					<%@ page import="com.csm.entity.Animals"%>
					<%
					AnimalsManage animalsManage = new AnimalsManage();
					List<Animals> animals = animalsManage.selectAll();

					if (animals != null && !animals.isEmpty()) {
						for (Animals animal : animals) {
					%>
					<tr>
						<td><%=animal.getAnimal_ID()%></td>
						<td><%=animal.getAnimal_Name()%></td>
						<td><%=animal.getAnimal_Gender()%></td>
						<td><%=animal.getYear_Arrive()%></td>
						<td><%=animal.getDiet_ID()%></td>
						<td><%=animal.getKeeper_ID()%></td>
						<td><%=animal.getEnclosure_ID()%></td>
						<td><%=animal.getSpecies_ID()%></td>
						<td>
							<a href="animal_update.jsp?animal_id=<%= animal.getAnimal_ID() %>">Update</a>
							<a href="animal_delete_action.jsp?animal_id=<%= animal.getAnimal_ID() %>">Delete</a>
						</td>
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
					%>
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>