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
				<form action="animal_add_action.jsp" method="post">
					<h3>Add Animals</h3>
					<table>
						<tr>
							<td><label for="animal_name">Enter the Animal Name:</label></td>
							<td><input type="text" name="animal_name" id="animal_name"
								placeholder="e.g., Eddie" value="" required></td>
						</tr>
						<tr>
							<td><label for="sex">Enter the Animal Gender:</label></td>
							<td><input type="radio" value="M" name="sex" required>Male
								<input type="radio" value="F" name="sex" required>Female
							</td>
						</tr>
						<tr>
							<td><label for="year_arrive">Enter the Year Arrive:</label></td>
							<td><input type="text" name="year_arrive" id="year_arrive"
								placeholder="e.g., 2011" value="" required></td>
						</tr>
						<tr>
							<td><label for="diet_id">Choose the Diet Type:</label></td>
							<td><select name="diet_id" id="diet_id" required>
									<option value="">Select Diet Type</option>
									<%@ page import="com.csm.dao.DietManage"%>
									<%@ page import="com.csm.entity.Diet"%>
									<%
									DietManage dietManage = new DietManage();
									List<Diet> diets = dietManage.selectAll();

									for (Diet diet : diets) {
									%>
									<option value="<%=diet.getDiet_Id()%>"><%=diet.getDiet_Type()%></option>
									<%
									}
									%>
							</select></td>
						</tr>
						<tr>
							<td><label for="keeper_id">Choose the Keeper:</label></td>
							<td><select name="keeper_id" id="keeper_id" required>
									<option value="">Select Keeper Name</option>
									<%@ page import="com.csm.dao.KeeperManage"%>
									<%@ page import="com.csm.entity.Keeper"%>
									<%
									KeeperManage keeperManage = new KeeperManage();
									List<Keeper> keepers = keeperManage.selectAll();

									for (Keeper keeper : keepers) {
									%>
									<option value="<%=keeper.getKeeper_ID()%>"><%=keeper.getKeeper_Name()%></option>
									<%
									}
									%>
							</select></td>
						</tr>
						<tr>
							<td><label for="enclosure_id">Choose the Enclosure:</label></td>
							<td><select name="enclosure_id" id="enclosure_id" required>
									<option value="">Select Enclosure Name</option>
									<%@ page import="com.csm.dao.EnclosureManage"%>
									<%@ page import="com.csm.entity.Enclosures"%>
									<%
									EnclosureManage enclosureManage = new EnclosureManage();
									List<Enclosures> enclosures = enclosureManage.selectAll();

									for (Enclosures enclosure : enclosures) {
									%>
									<option value="<%=enclosure.getEnclosure_ID()%>"><%=enclosure.getEnclosure_Type()%>
										(<%=enclosure.getEnclosure_Location()%>)
									</option>
									<%
									}
									%>
							</select></td>
						</tr>
						<tr>
							<td><label for="species_id">Choose the Species:</label></td>
							<td><select name="species_id" id="species_id" required>
									<option value="">Select Species Type</option>
									<%@ page import="com.csm.dao.SpeciesManage"%>
									<%@ page import="com.csm.entity.Species"%>
									<%
									SpeciesManage speciesManage = new SpeciesManage();
									List<Species> species = speciesManage.selectAll();

									for (Species specie : species) {
									%>
									<option value="<%=specie.getSpecies_ID()%>"><%=specie.getSpecies_Type()%></option>
									<%
									}
									%>
							</select></td>
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