<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col justify-center items-center min-h-screen bg-gray-500 font-mono bg-gradient-to-r from-black to-gray-800">
	
	<div class="flex flex-col p-10 w-1/2 bg-white">
		<h1 class="self-center font-bold text-3xl mb-10">Sign In</h1>
			
		<form action="register.do" method="POST" class="flex flex-col">
			<div class="flex items-center border rounded-lg mb-7 bg-gray-200 px-3">
				<input class="px-3 py-4 bg-transparent outline-none w-full" type="text" name="username" placeholder="Username" required/>
			</div>
			
			<div class="flex items-center border rounded-lg mb-7 bg-gray-200 px-3">
				<input class="px-3 py-4 bg-transparent outline-none text-base w-full" type="password" name="username" placeholder="Password" required/>
			</div>
			
			<input class="text-lg mt-2 bg-black py-3 self-center w-1/3 rounded-lg text-white hover:bg-gray-900 cursor-pointer" type="submit" value="Enviar">
		</form>
	</div>
	
</body>
</html>