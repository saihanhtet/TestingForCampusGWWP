<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.DBManager"%>
<%@ page import="com.csm.dao.KeeperManage"%>
<%@ page import="com.csm.entity.Keeper"%>
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
		<%
		String sId = request.getParameter("keeper_id");
		if (sId == null) {
			out.println("Keeper ID is not found");
		} else {
			int id = Integer.parseInt(sId);
			KeeperManage dao = new KeeperManage();
			try {
				Keeper k = dao.getKeeperById(id);
		%>
		<main class="d-flex">
			<div class="left-panel">
				<form action="keeper_update_action.jsp" method="post">
					<input type="hidden" value="keeper_name_update" name="form_status">
					<h5>Update Keeper Name</h5>
					<table>
						<tr>
							<td><label for="keeper_id">Enter the Keeper ID:</label></td>
							<td><input type="text" name="keeper_id" id="keeper_id"
								required value="<%=k.getKeeper_ID()%>" readonly></td>
						</tr>
						<tr>
							<td><label for="keeper_name">Enter New Name:</label></td>
							<td><input type="text" name="keeper_name" id="keeper_name"
								placeholder="e.g.,John wick" required  value="<%=k.getKeeper_Name()%>"></td>
						</tr>
						<tr>
							<td><label for="dob">Enter the New DOB:</label></td>
							<td><input type="text" name="dob" id="dob"
								placeholder="yyyy-mm-dd" min="1997-01-01" max="2030-12-31"
								required  value="<%=k.getKeeper_DOB()%>"></td>
						</tr>
						<tr>
							<td><label for="dob">Enter the New Rank:</label></td>
							<td><input type="text" name="rank" id="rank"
								placeholder="Senior" required  value="<%=k.getKeeper_Rank()%>"></td>
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


