<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="br.edu.dsw1.repositories.UserDAOImp"%>
<%@page import="br.edu.dsw1.repositories.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	var username = (String) session.getAttribute("user");
	UserDAO repository = UserDAOImp.getInstance();
	var user = repository.findByUsername(username).orElse(null);
	var formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login History</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-black to-gray-800 min-h-screen flex flex-col font-mono items-center justify-center box-border">
	
	<% if (user != null) { %>
			<div class="flex flex-col items-center justify-center border-solid border-2 border-gray-400 rounded-lg w-2/3">
				<h1 class="text-white font-bold text-4xl mt-5">Login History</h1>
				<p class="text-white font-bold text-2xl mt-10">Confira o seu histórico de login abaixo:</p>
				<ul class="my-10">
					<% for (var dateTime : user.getHistory()) { %>
						<li class="text-white text-xl font-semi py-2"> <%= formatter.format(dateTime) %> </li>
					<% } %>
				</ul>
				<a href="welcome.jsp" class="bg-blue-700 w-1/4 py-4 px-4 text-center rounded-lg hover:bg-blue-600 cursor-pointer text-white font-bold text-xl mb-10">
					<button>Voltar</button>
				</a>
			</div>
	<% } else { 
			response.sendRedirect("login.do");  
	   }
	%>
		
</body>
</html>