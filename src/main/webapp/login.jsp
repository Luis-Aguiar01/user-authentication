<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col">
	
	<form>
		<div>
			<label for="username">Username:</label>
			<input type="text" name="username" id="username" placeholder="Digite o nome de usuário" required/>
		</div>
		
		<div>
			<label for="password">Password:</label>
			<input type="text" name="password" id="password" placeholder="Digite a sua senha" required>
		</div>
		
		<input type="submit" value="Enviar">
	</form>
	
</body>
</html>