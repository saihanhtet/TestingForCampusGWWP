<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keeper View</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex table-view">
			<table>
				<thead>
					<tr>
						<th>Keeper Id</th>
						<th>Keeper Name</th>
						<th>Keeper DOB</th>
						<th>Keeper Rank</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
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
						<td><a
							href="keeper_update.jsp?keeper_id=<%=keeper.getKeeper_ID()%>">Update</a>|
							<a
							href="keeper_delete_action.jsp?keeper_id=<%=keeper.getKeeper_ID()%>">Delete</a>
						</td>
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
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>