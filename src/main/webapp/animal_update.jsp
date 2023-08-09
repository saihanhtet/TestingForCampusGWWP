<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.DBManager"%>
<%@ page import="com.csm.dao.AnimalsManage"%>
<%@ page import="com.csm.entity.Animals"%>
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
				<!--  animal name update  -->
				<%
				String sId = request.getParameter("animal_id");
				if (sId == null) {
					out.println("Animal ID is not found");
				} else {
					int id = Integer.parseInt(sId);
					AnimalsManage dao = new AnimalsManage();
					try {
						Animals a = dao.getAnimalByID(id);
				%>
				<form action="animal_update_action.jsp" method="post">
					<h5>Update Animal Name</h5>
					<table>
						<tr>
							<td><label for="animal_id">Enter the Animals ID:</label></td>
							<td><input type="text" name="animal_id" id="animal_id"
								required readonly value="<%=a.getAnimal_ID()%>"></td>
						</tr>
						<tr>
							<td><label for="animal_name">Enter the Animal Name:</label>
							</td>
							<td><input type="text" name="animal_name" id="animal_name"
								placeholder="e.g., Eddie" value="<%=a.getAnimal_Name()%>"
								required></td>
						</tr>
						<tr>
							<td><label for="sex">Enter New Animal Gender:</label></td>
							<td><input type="radio" value="M" name="sex" id="maleRadio"
								required <%=a.getAnimal_Gender().equals("M") ? "checked" : ""%>>
								<label for="maleRadio">Male</label> <input type="radio"
								value="F" name="sex" id="femaleRadio" required
								<%=a.getAnimal_Gender().equals("F") ? "checked" : ""%>>
								<label for="femaleRadio">Female</label></td>
						</tr>

						<tr>
							<td><label for="year_arrive">Enter New Year Arrive:</label></td>
							<td><input type="text" name="year_arrive" id="year_arrive"
								placeholder="e.g., 2011" value="<%=a.getYear_Arrive()%>"
								required></td>
						</tr>
						<tr>
							<td><label for="diet_id">Choose the Diet Type:</label></td>
							<td><select name="diet_id" id="diet_id" required>
									<option>Select Diet Type</option>
									<%@ page import="com.csm.dao.DietManage"%>
									<%@ page import="com.csm.entity.Diet"%>
									<%
									DietManage dietManage = new DietManage();
									List<Diet> diets = dietManage.selectAll();

									for (Diet diet : diets) {
									%>
									<option value="<%=diet.getDiet_Id()%>"
										<%=a.getDiet_ID() == diet.getDiet_Id() ? "selected" : ""%>>
										<%=diet.getDiet_Type()%> (<%=diet.getNo_Of_Feed()%>)
									</option>

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
									<option value="<%=keeper.getKeeper_ID()%>"
										<%=a.getKeeper_ID() == keeper.getKeeper_ID() ? "selected" : ""%>>
										<%=keeper.getKeeper_Name()%></option>
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
									<option value="<%=enclosure.getEnclosure_ID()%>"
										<%=a.getEnclosure_ID() == enclosure.getEnclosure_ID() ? "selected" : ""%>>
										<%=enclosure.getEnclosure_Type()%> (<%=enclosure.getEnclosure_Location()%>)
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
									<option value="<%=specie.getSpecies_ID()%>"
										<%=a.getSpecies_ID() == specie.getSpecies_ID() ? "selected" : ""%>>
										<%=specie.getSpecies_Type()%></option>
									<%
									}
									%>
							</select></td>
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

