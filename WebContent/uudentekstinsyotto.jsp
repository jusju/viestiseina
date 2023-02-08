<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Uuden kommentin syöttö</title>
</head>
<body>
	<h1>Kirjoita viesti seinälle</h1>

	<form action="KirjoitaViesti" method="post">
		<table>
			<tr>
				<td>Viesti:</td>
				<td><input type="text" name="viesti" size="50" length="50">
				</td>
				<td><input type="submit" value="Lähetä viesti"></td>
			</tr>
		</table>

	</form>



</body>
</html>