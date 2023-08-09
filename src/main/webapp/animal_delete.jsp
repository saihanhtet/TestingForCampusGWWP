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
				<!--  animal delete  -->
				<form action="animal_delete_action.jsp" method="get">
					<h5>Delete Animals</h5>
					<table>
						<tr>
							<td><label for="animal_id">Enter the Animals ID:</label></td>
							<td><input type="text" name="animal_id" id="animal_id"
								required></td>
						</tr>
						<tr>
							<td><button type="reset" class="form-btn">Reset</button></td>
							<td><button type="submit" class="form-btn">Delete</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="right-panel">
				<table>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Sex</th>
						<th>YA</th>
						<th>D_Id</th>
						<th>K_Id</th>
						<th>E_Id</th>
						<th>S_Id</th>
					</tr>
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
				</table>
			</div>
		</main>
	</div>
</body>

</html>