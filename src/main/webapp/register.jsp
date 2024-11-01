<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col justify-center items-center min-h-screen bg-gray-500 font-mono text-white">
	
	<form action="register.do" method="POST" class="flex flex-col w-1/2 p-6 bg-sky-950 rounded-md shadow-lg shadow-black">
		<div class="flex flex-col py-3">
			<label class="pb-3 text-lg font-bold" for="user">Nome de Usuário:</label>
			<input class="py-3 px-3 rounded-lg text-black" type="text" name="user" id="user" required placeholder="Digite seu nome de usuário">
		</div>
		
		<div class="flex flex-col py-3">
			<label class="pb-3 text-lg font-bold" for="password">Senha:</label>
			<input class="py-3 px-3 rounded-lg text-black" type="password" name="password" id="password" required placeholder="Digite a sua senha">
		</div>
		
		<input class="bg-cyan-600 mt-10 py-3 w-1/3 self-center rounded-lg font-bold hover:bg-cyan-500 cursor-pointer" type="submit" value="Enviar">
	</form>
</body>
</html>