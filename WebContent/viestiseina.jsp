<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="5; URL=http://viestiseina.org/viestiseina.jsp">
<title>Viestiseinä</title>
</head>
<body>
	<h1>Viestiseina: kirjoita viesti http://viestiseina.org</h1>



	<%
		Scanner lukija = new Scanner(new File("/tmp/viestit.txt"));
		out.println("<ul>");
		String outputti = "";
		while (lukija.hasNext()) {
			String yksiRivi = lukija.nextLine();
			outputti = outputti + yksiRivi;
			
			
		}
		String[] solut = outputti.split("</li>");
		ArrayList<String> alkiot = new ArrayList<String>();
		for(int i = solut.length-1; i >= 0; i--) {
			alkiot.add(solut[i] + "</li>");
		}
		//Collections.reverse(alkiot);
		for(int i = 0; i < alkiot.size(); i++) {
			out.println(alkiot.get(i));
		}
		out.println("</ul>");
	%>



</body>
</html>