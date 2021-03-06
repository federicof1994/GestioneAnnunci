package it.gestioneannunci.web.servlet.utente;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import it.gestioneannunci.model.Utente;
import it.gestioneannunci.model.enumeration.StatoUtente;
import it.gestioneannunci.service.RuoloService;
import it.gestioneannunci.service.UtenteService;



/**
 * Servlet implementation class PrepareModificaUtenteServlet
 */
@WebServlet("/admin/gestioneutenti/PrepareModificaUtenteServlet")
public class PrepareModificaUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Autowired
	private RuoloService ruoloService;
	
	@Autowired
	private UtenteService utenteService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrepareModificaUtenteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("ruoliListAttr", ruoloService.listAll());
		String idUtenteDaPagina = request.getParameter("idUtente");
		request.setAttribute("statiListAttr", StatoUtente.values());
		Utente utenteCaricato = utenteService.caricaSingoloUtenteEager(Long.parseLong(idUtenteDaPagina));
		request.setAttribute("utenteAttr", utenteCaricato);
		request.setAttribute("creditoResiduoOriginaleInput", utenteCaricato.getCreditoResiduo());

		
		
		request.getRequestDispatcher("/admin/gestioneutenti/modifica.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
