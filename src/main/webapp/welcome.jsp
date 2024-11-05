<%@page import="java.time.LocalDateTime"%>
<%@page import="br.edu.dsw1.entities.User"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="br.edu.dsw1.repositories.UserDAOImp"%>
<%@page import="br.edu.dsw1.repositories.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<% 
	UserDAO repository = UserDAOImp.getInstance();
	String username = (String) session.getAttribute("user");
	User user = null;
	LocalDateTime currentLoginDateTime = null;
	
	user = repository.findByUsername(username).orElse(null);
	
	if (user != null) {
		var size = user.getHistory().size();
		currentLoginDateTime = user.getHistory().get(size - 1);
	}
	
	var formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-r from-black to-gray-800 min-h-screen flex flex-col font-mono items-center justify-center box-border">
	
	<% if (user != null) { %>
	
	<div class="border-solid border-2 border-gray-400 rounded-lg w-2/3">
		<h1 class="font-bold text-4xl text-center text-white mt-10 leading-relaxed">Welcome to your page, <%= user.getUsername() %></h1>
	
		<div class="flex flex-col items-center text-white p-10 mt-5">
			<p class="text-xl text-center mb-10">Current Date Time Login: <%= formatter.format(currentLoginDateTime) %></p>
			<p class="text-xl text-center leading-relaxed">Clique no primeiro bot�o para consultar o seu hist�rico de login, ou no segundo para realizar o logout.</p>
		</div>
		
		<div class="flex font-bold text-white text-lg w-full justify-center gap-5 mb-10 mt-5">
			<a href="history.do" class="bg-blue-700 w-1/4 py-4 px-4 text-center rounded-lg hover:bg-blue-600 cursor-pointer"><button>Login History</button></a>
			<a href="logout.do" class="bg-red-700  w-1/4 py-4 px-4 text-center rounded-lg hover:bg-red-500 cursor-pointer"><button>Logout</button></a>
		</div>
	</div>	
	
	<% } else { 
			response.sendRedirect("login.jsp");
	   }
	%>
	
</body>
</html>
