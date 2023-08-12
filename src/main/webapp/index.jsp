<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.csm.DBManager"%>
<%@ page import="com.csm.dao.UserManage"%>
<%@ page import="com.csm.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	outline: 0px dashed black;
}

body {
	width: 100vw;
	height: 100vh;
	padding: 1rem;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgb(231, 238, 247);
}

form {
	width: 95vw;
	height: 95vh;
	padding: 10px;
	gap: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0px 2px 6px 0px #ccc;
	background-color: whitesmoke;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
}

form img {
	width: 320px !important;
	height: 100% !important;
	object-position: cover;
	object-fit: center;
	object-position: cover;
}

form div:first-child {
	float: left;
}

form div:last-child {
	float: right;
	width: 100% !important;
	height: 100%;
	padding: 10px;
	display: flex;
	flex-direction: column;
	justify-content: space-between !important;
	align-item: center;
}

form div:last-child header {
	text-align: center;
	margin-bottom: 10px !important;
}

form div:last-child header h4 {
	width: 100%;
	padding: 10px;
	font-size: 18px;
	font-weight: 700;
}

form div:last-child main {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-item: center;
	height: 50% !important;
	padding: 10px !important;
}

input[type="text"], input[type="password"] {
	height: 40px;
	border: none;
	border-bottom: 1px solid black;
	border-radius: none;
	margin: 10px 0 !important;
	background-color: transparent !important;
	padding: 0px 10px !important;
}

input[type="checkbox"] {
	margin-right: 10px!im10portant;
}

.btn {
	width: 100%;
	height: 40px;
	margin: 10px !important;
	background-color: #29465b;
	color: white;
	border: none;
	border-radius: 10px;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
}


.prompt{
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	position: absolute;
	padding: 10px;
	width: auto;
	height: 100px;
	top: calc(50vh - 50px);
	background-color: lightgray;
	border: 1px dashed black;
	border-radius: 10px;
}

.prompt .btn{
	width: 100%;
	padding: 10px;
	margin: 10px 0px 0px 0px !important;
}
</style>
</head>
<body>
	<form action="./index.jsp" autocomplete="off" method="post">
		<div>
			<img src="login.jpg">
		</div>
		<div>
			<header>
				<h4>Go Wild Wild Life</h4>
				<p>Member Login</p>
			</header>
			<main>
				<input type="text" name="username" placeholder="Enter your username"
					required> <input type="password" name="password"
					placeholder="Enter your password" required id="password"> <label
					for="showpass"> <input type="checkbox" name="showpass"
					id="showpass"><span>Show Password</span>
				</label>
			</main>
			<footer>
				<input type="submit" value="Login" class="btn">
			</footer>
		</div>
	</form>

	<%
	
	String msg = null;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	UserManage userValidator = new UserManage();
	// check user exists or not in procedure and login
	if (username != null && password != null) {
		boolean isValid = userValidator.validateUser(username, password);
		if (isValid) {
            session.setAttribute("loggedIn", true);
            response.sendRedirect("main.jsp");
        } else {
            msg = "Invalid credentials. Please try again.";
        }
    }
	%>
	
	<div class="prompt" style="display: <%= msg != null ? "block" : "none" %>;" id="prompt">
        <p><%= msg %></p>
        <button class="btn" onclick="closePrompt();">Close</button>
    </div>

    <script>
        function closePrompt() {
            const prompt = document.getElementById('prompt');
            prompt.style.display = "none";
            // Redirect to the same page after closing prompt
            window.location.replace("index.jsp");
        }
        
        const showpassbtn = document.getElementById('showpass');
        const passinput = document.getElementById('password');

        showpassbtn.addEventListener('change', function() {
            if (showpassbtn.checked) {
                passinput.type = "text";
            } else {
                passinput.type = "password";
            }
        });
    </script>
</body>
</html>