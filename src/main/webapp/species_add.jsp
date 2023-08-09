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
				<form action="species_add_action.jsp">
					<h3>Add Species</h3>
					<table>
						<tr>
							<td><label for="species_type">Enter the Species
									Type:</label></td>
							<td><input type="text" name="species_type" id="species_type"
								placeholder="e.g., Gorilla" required></td>
						</tr>
						<tr>
							<td><label for="species_group">Enter the Species
									Group:</label></td>
							<td><input type="text" name="species_group"
								id="species_group" placeholder="e.g., Mammal" required>
							</td>
						</tr>
						<tr>
							<td><label for="species_lifestyle">Enter the Life
									Style:</label></td>
							<td><input type="text" name="species_lifestyle"
								id="species_lifestyle" placeholder="e.g., Social" required>
							</td>
						</tr>
						<tr>
							<td><label for="species_status">Enter the
									Conservation Status:</label></td>
							<td><input type="text" name="species_status"
								id="species_status" placeholder="e.g., Threatened" required>
							</td>
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
						<th>Id</th>
						<th>Type</th>
						<th>Group</th>
						<th>LifeStyle</th>
						<th>Conservation Status</th>
					</tr>
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
				</table>
			</div>
		</main>
	</div>
</body>

</html>