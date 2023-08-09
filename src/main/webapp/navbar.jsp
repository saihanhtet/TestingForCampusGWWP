<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav>
	<div class="logoField">
		<h2>Go Wild Wildlife Park</h2>
	</div>
	<ul class="nav-item">
		<li><a href="./index.jsp">Home</a></li>
		<li>
			<div class="dropdown">
				<button class="dropbtn">Diet</button>
				<div class="dropdown-content">
					<a href="./diet_add.jsp">Add</a>
					<a href="./diet_view.jsp">View</a> <a href="./diet_delete.jsp">Delete</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown">
				<button class="dropbtn">Keeper</button>
				<div class="dropdown-content">
					<a href="./keeper_add.jsp">Add</a>
					<a href="./keeper_view.jsp">View</a> <a href="./keeper_delete.jsp">Delete</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown">
				<button class="dropbtn">Species</button>
				<div class="dropdown-content">
					<a href="./species_add.jsp">Add</a> 
					<a href="./species_view.jsp">View</a> <a
						href="./species_delete.jsp">Delete</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown">
				<button class="dropbtn">Enclosure</button>
				<div class="dropdown-content">
					<a href="./enclosure_add.jsp">Add</a> <a
						href="./enclosure_view.jsp">View</a> <a
						href="./enclosure_delete.jsp">Delete</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown">
				<button class="dropbtn">Animals</button>
				<div class="dropdown-content">
					<a href="./animal_add.jsp">Add</a>
					<a href="./animal_view.jsp">View</a>
					<a href="./animal_delete.jsp">Delete</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown">
				<button class="dropbtn">KeepersReport</button>
				<div class="dropdown-content">
					<a href="./report1.jsp">Report 1</a>
					<a href="./report2.jsp">Report 2</a>
				</div>
			</div>
		</li>
	</ul>
</nav>