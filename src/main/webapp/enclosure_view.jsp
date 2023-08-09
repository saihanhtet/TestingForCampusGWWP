<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enclosure View</title>
<link rel="stylesheet" href="./index.css">
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />

		<main class="d-flex table-view">
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Type</th>
						<th>Location</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
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
						<td><a
							href="enclosure_update.jsp?enclosure_id=<%=enclosure.getEnclosure_ID()%>">Update</a>
							|<a
							href="enclosure_delete_action.jsp?enclosure_id=<%=enclosure.getEnclosure_ID()%>">Delete</a>
						</td>
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
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>