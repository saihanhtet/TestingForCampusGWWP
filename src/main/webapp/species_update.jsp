<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.DBManager"%>
<%@ page import="com.csm.dao.SpeciesManage"%>
<%@ page import="com.csm.entity.Species"%>
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
				<%
				String sId = request.getParameter("species_id");
				if (sId == null) {
					out.println("Species ID is not found");
				} else {
					int id = Integer.parseInt(sId);
					SpeciesManage dao = new SpeciesManage();
					try {
						Species c = dao.getSpeciesById(id);
				%>
				<form action="species_update_action.jsp" method="post"
					autocomplete="off">
					<h5>Update Species Type</h5>
					<table>
						<tr>
							<td><label for="keeper_id">Enter the Species Id:</label></td>
							<td><input type="text" name="species_id" id="species_id"
								required readonly value="<%=c.getSpecies_ID()%>"></td>
						</tr>
						<tr>
							<td><label for="species_type">Enter New Species
									Type:</label></td>
							<td><input type="text" name="species_type" id="species_type"
								placeholder="e.g., Tiger" required
								value="<%=c.getSpecies_Type()%>"></td>
						</tr>
						<tr>
							<td><label for="species_group">Enter the New Group:</label></td>
							<td><input type="text" name="species_group"
								id="species_group" placeholder="e.g., Mammal" required
								value="<%=c.getSpecies_GP()%>"></td>
						</tr>
						<tr>
							<td><label for="species_lifestyle">Enter the New
									LifeStyle:</label></td>
							<td><input type="text" name="species_lifestyle"
								id="species_lifestyle" placeholder="e.g., Herd" required
								value="<%=c.getSpecies_Lifestyle()%>"></td>
						</tr>
						<tr>
							<td><label for="species_status">Enter
									ConservationStatus:</label></td>
							<td><input type="text" name="species_status"
								id="species_status" placeholder="e.g., Threatened" required
								value="<%=c.getConservationStatus()%>"></td>
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