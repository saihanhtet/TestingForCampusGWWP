<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Species View</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex table-view">
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Type</th>
						<th>Group</th>
						<th>LifeStyle</th>
						<th>Conservation Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%@ page import="java.util.List"%>
					<%@ page import="com.csm.dao.SpeciesManage"%>
					<%@ page import="com.csm.entity.Species"%>
					<%
					SpeciesManage speciesManage = new SpeciesManage();
					List<Species> species = speciesManage.selectAll();

					if (species != null && !species.isEmpty()) {
						for (Species specie : species) {
					%>
					<tr>
						<td><%=specie.getSpecies_ID()%></td>
						<td><%=specie.getSpecies_Type()%></td>
						<td><%=specie.getSpecies_GP()%></td>
						<td><%=specie.getSpecies_Lifestyle()%></td>
						<td><%=specie.getConservationStatus()%></td>
						<td>
						<a href="species_update.jsp?species_id=<%= specie.getSpecies_ID() %>">Update</a>|
							<a href="species_delete_action.jsp?species_id=<%= specie.getSpecies_ID() %>">Delete</a>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="3">No Species found</td>
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