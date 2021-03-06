package it.gestioneannunci.service;

import java.util.List;

import it.gestioneannunci.model.Annuncio;
import it.gestioneannunci.model.Utente;

public interface UtenteService extends IBaseService<Utente> {

	public Utente eseguiAccesso(String username, String password);

	public Utente caricaSingoloUtenteEager(Long id);

	public void aggiornaUtenteConRuoli(Utente utenteModel, List<String> listaIdRuoli);

	public void inserisciNuovoUtenteClassico(Utente utenteInstance);

	public boolean isUsernameDiponibile(String username);

	public List<Utente> listAllEager();

	public List<Utente> findByExampleEager(Utente example);

	public Utente cercaDaUsername(String username);

	public void inserisciNuovoUtenteConRuoli(Utente utenteInstance, List<String> listaIdRuoli);

	public Utente cercaDaEmail(String email);
	
	public String cercaUsernameDaAnnuncio(Annuncio o);

}
