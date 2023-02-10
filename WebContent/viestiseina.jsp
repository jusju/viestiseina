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
<meta http-equiv="refresh" content="5; URL=http://viestiseina.org/viestiseina/viestiseina.jsp">
<title>Viestisein<E4></title>
</head>
<body>
<div id="content">
        <img src="images/sil-tunnus-sininen.jpg" width="100" height="100" class="ribbon"/>
    </div>

        <h1>Viestiseina: kirjoita viesti http://viestiseina.org</h1>



        <%
                Yhteys yhteys = new Yhteys();
                yhteys.yhdista();
                Kysely kysely = new Kysely(yhteys.getYhteys());
                out.println("<ul>");
                String outputti = "";

                kysely.suoritaYksittainenKysely("SELECT * FROM Viestit;");
                ArrayList tulokset = kysely.getTulosjoukko();

                Iterator iter = kysely.getTulosjoukko().iterator();
                ArrayList viestit = new ArrayList();
                while (iter.hasNext()) {
                        HashMap viestiMap = (HashMap) iter.next();
                        String viesti = "<li>";
                        viesti =  viesti + (String)viestiMap.get("viesti");
                        viesti = viesti + "</li>";

                        viestit.add(viesti);
                }

                //Collections.reverse(alkiot);
                for (int i = viestit.size()-1; i >=0 ; i--) {
                        out.println(viestit.get(i));
                }
                out.println("</ul>");
                yhteys.katkaise();
        %>



</body>
</html>
                        
