<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.DBManager"%>
<%@ page import="com.csm.dao.EnclosureManage"%>
<%@ page import="com.csm.entity.Enclosures"%>
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
				<!--  Enclosure type update  -->
				<%
				String sId = request.getParameter("enclosure_id");
				if (sId == null) {
					out.println("Enclosure ID is not found");
				} else {
					int id = Integer.parseInt(sId);
					EnclosureManage dao = new EnclosureManage();
					try {
						Enclosures e = dao.getEnclosureById(id);
				%>
				<form action="enclosure_update_action.jsp" method="post">
					<h5>Update Enclosure Type</h5>
					<table>
						<tr>
							<td><label for="enclosure_id">Enter the Enclosure
									ID:</label></td>
							<td><input type="text" name="enclosure_id" readonly
								id="enclosure_id" required value="<%=e.getEnclosure_ID()%>"></td>
						</tr>
						<tr>
							<td><label for="enclosure_type">Enter Enclosure
									Type:</label></td>
							<td><input type="text" name="enclosure_type"
								id="enclosure_type" required value="<%=e.getEnclosure_Type()%>"></td>
						</tr>
						<tr>
							<td><label for="enclosure_location">Enter the
									Location:</label></td>
							<td><input type="text" name="enclosure_location"
								id="enclosure_location" required
								value="<%=e.getEnclosure_Location()%>"></td>
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