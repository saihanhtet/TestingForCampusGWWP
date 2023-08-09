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
				<div class="left-panel">
					<form action="species_delete_action.jsp" method="post"
						autocomplete="off">
						<h3>Delete Species Record</h3>
						<table>
							<tr>
								<td><label for="species_id">Enter the Species ID:</label></td>
								<td><input type="text" name="species_id" id="species_id"
									required></td>
							</tr>
							<tr>
								<td><button type="reset" class="form-btn">Reset</button></td>
								<td><button type="submit" class="form-btn">Submit</button></td>
							</tr>
						</table>
					</form>
				</div>
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