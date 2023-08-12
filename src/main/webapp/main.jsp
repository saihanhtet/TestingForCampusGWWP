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
		<main>
			<h1>Welcome To Go Wild WildLife Park</h1>
			<h2>Discover the animals world !!!!!!</h2>
			<p>
				<b>Over 2000 animals with new challenges and excitement.Just
					enjoy the moment.</b>
			</p>
		</main>
	</div>
	<script>
	    function autoRefresh() {
	        window.location = window.location.href;
	    }
	    setInterval('autoRefresh()', 5000);
</script>
</body>

</html>