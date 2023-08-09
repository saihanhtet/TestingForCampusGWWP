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
				<form action="keeper_add_action.jsp">
					<h3>Add Keeper</h3>
					<table>
						<tr>
							<td><label for="keeper_name">Enter the Keeper Name:</label>
							</td>
							<td><input type="text" name="keeper_name" id="keeper_name"
								placeholder="e.g.,John wick" required></td>
						</tr>
						<tr>
							<td><label for="dob">Enter the Keeper DOB:</label></td>
							<td><input type="text" name="dob" id="dob"
								placeholder="yyyy-mm-dd" min="1997-01-01" max="2030-12-31"
								required></td>
						</tr>
						<tr>
							<td><label for="rank">Enter the Keeper Rank:</label></td>
							<td><input type="text" name="rank" id="rank"
								placeholder="Standard" required></td>
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
						<th>DOB</th>
						<th>Rank</th>
					</tr>
					<%@ page import="java.util.List"%>
					<%@ page import="com.csm.dao.KeeperManage"%>
					<%@ page import="com.csm.entity.Keeper"%>
					<%
					KeeperManage keeperManage = new KeeperManage();
					List<Keeper> keepers = keeperManage.selectAll();

					if (keepers != null && !keepers.isEmpty()) {
						for (Keeper keeper : keepers) {
					%>
					<tr>
						<td><%=keeper.getKeeper_ID()%></td>
						<td><%=keeper.getKeeper_Name()%></td>
						<td><%=keeper.getKeeper_DOB()%></td>
						<td><%=keeper.getKeeper_Rank()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="3">No Keeper found</td>
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


