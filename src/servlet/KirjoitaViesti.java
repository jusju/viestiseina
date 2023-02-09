package servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.time.LocalTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tietokanta.Paivitys;
import tietokanta.Yhteys;

/**
 * Servlet implementation class KirjoitaViesti
 */
@WebServlet("/KirjoitaViesti")
public class KirjoitaViesti extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KirjoitaViesti() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uusiViesti = request.getParameter("viesti");
		Yhteys yhteys = new Yhteys();
		yhteys.yhdista();
		
		Paivitys paivitys = new Paivitys(yhteys.getYhteys());
		LocalTime aika = LocalTime.now();
		int tunti= aika.getHour();
		int minuutti = aika.getMinute();
		int sekunti = aika.getSecond();
		paivitys.suoritaSqlLause("INSERT INTO Viestit(viesti) VALUES(\"[" + tunti + ":" + minuutti + ":" + sekunti + "] " + uusiViesti + "\")\n");
		
		yhteys.katkaise();
		
	/*	File tiedosto = new File("/opt/viestit.txt");
		PrintWriter kahva = new PrintWriter(new FileWriter(tiedosto, true));
		LocalTime aika = LocalTime.now();
		int tunti= aika.getHour();
		int minuutti = aika.getMinute();
		int sekunti = aika.getSecond();
		kahva.append("<li> ["+tunti + ":" + minuutti + ":" + sekunti + "] " + uusiViesti + "</li>\n");
		kahva.close();
		
		*/
		//request.setAttribute("viesti", uusiViesti);
		
		RequestDispatcher disp = request.getRequestDispatcher("viestiseina.jsp");
		disp.forward(request, response);
	}

}
