<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="tietokanta.Yhteys"%>
<%@page import="tietokanta.Kysely"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh"
	content="5; URL=http://viestiseina.org/viestiseina.jsp">
<title>Viestiseinä</title>
</head>
<body>
	<h1>Viestiseina: kirjoita viesti http://viestiseina.org</h1>



	<%
		Yhteys yhteys = new Yhteys();
		yhteys.yhdista();
		Kysely kysely = new Kysely(yhteys.getYhteys());
		out.println("<ul>");
		String outputti = "";
		
		kysely.suoritaYksittainenKysely("SELECT * FROM Viestit");
		ArrayList tulokset = kysely.getTulosjoukko();
				
		Iterator iter = kysely.getTulosjoukko().iterator();
		ArrayList viestit = new ArrayList();
		while (iter.hasNext()) {
			HashMap viestiMap = (HashMap) iter.next();
			String viesti = (String)viestiMap.get("viesti");
			viestit.add(viesti);
		}
		
		//Collections.reverse(alkiot);
		for (int i = 0; i < viestit.size(); i++) {
			out.println(viestit.get(i));
		}
		out.println("</ul>");
		yhteys.katkaise();
	%>



</body>
</html>