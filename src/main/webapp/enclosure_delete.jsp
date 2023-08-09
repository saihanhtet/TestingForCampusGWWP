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
				<form action="enclosure_delete_action.jsp" method="post">
					<h3>Delete Enclosure Record</h3>
					<table>
						<tr>
							<td><label for="enclosure_id">Enter the Enclosure
									ID:</label></td>
							<td><input type="text" name="enclosure_id" id="enclosure_id"
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
						<th>Type</th>
						<th>Location</th>
					</tr>
					<%@ page import="java.util.List"%>
					<%@ page import="com.csm.dao.EnclosureManage"%>
					<%@ page import="com.csm.entity.Enclosures"%>
					<%
					EnclosureManage enclosureManage = new EnclosureManage();
					List<Enclosures> enclosures = enclosureManage.selectAll();

					if (enclosures != null && !enclosures.isEmpty()) {
						for (Enclosures enclosure : enclosures) {
					%>
					<tr>
						<td><%=enclosure.getEnclosure_ID()%></td>
						<td><%=enclosure.getEnclosure_Type()%></td>
						<td><%=enclosure.getEnclosure_Location()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="3">No Enclosures found</td>
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