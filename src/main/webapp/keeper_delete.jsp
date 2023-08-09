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
				<form action="keeper_delete_action.jsp" method="post">
					<h3>Delete Keeper Record</h3>
					<table>
						<tr>
							<td><label for="keeper_id">Enter the Keeper ID:</label></td>
							<td><input type="text" name="keeper_id" id="keeper_id"
								required></td>
						</tr>
						<tr>
							<td><button type="reset" class="form-btn">Reset</button></td>
							<td><button type="submit" class="form-btn">Submit</button></td>
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