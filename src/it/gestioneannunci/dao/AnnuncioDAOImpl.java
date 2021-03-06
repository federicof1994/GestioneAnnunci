package it.gestioneannunci.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Example.PropertySelector;
import org.hibernate.type.Type;
import org.springframework.stereotype.Component;

import it.gestioneannunci.model.Annuncio;

@Component
public class AnnuncioDAOImpl implements AnnuncioDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Annuncio> list() {
		return em.createQuery("From Annuncio", Annuncio.class).getResultList();
	}

	@Override
	public Annuncio get(long id) {
		return em.find(Annuncio.class, id);
	}

	@Override
	public void update(Annuncio o) {
		o = em.merge(o);
	}

	@Override
	public void insert(Annuncio o) {
		em.persist(o);
	}

	@Override
	public void delete(Annuncio o) {
		em.remove(em.merge(o));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Annuncio> findByExample(Annuncio o) {
		Session session = (Session) em.getDelegate();

		@SuppressWarnings("serial")
		PropertySelector ps = new PropertySelector() {
			@Override
			public boolean include(Object object, String propertyName, Type type) {
				if (object == null)
					return false;
				// String
				if (object instanceof String)
					return StringUtils.isNotBlank((String) object);
				// Number
				if (object instanceof Integer)
					return ((Integer) object) != null;
				return true;
			}
		};

		Criteria objectCriteria = session.createCriteria(Annuncio.class);
		Example objectExample = Example.create(o).setPropertySelector(ps);

		objectCriteria.add(objectExample);
		return objectCriteria.list();
	}

	@Override
	public List<Annuncio> findAllByUtenteId(long id) {
		return em.createQuery("From Annuncio a where a.utente.id ='" + id + "'", Annuncio.class).getResultList();
	}

	@Override
	public Annuncio getEager(Long id) {
		try {
			return em.createQuery("from Annuncio a left join fetch a.categorie where a.id =" + id, Annuncio.class)
					.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Annuncio> findAllByTextWithAndIdCategory(String title, List<String> idCategoryList) {
		String q = "select distinct a From Annuncio a left join a.categorie c where a.aperto=1 and a.testoAnnuncio like '%" + title + "%' ";

		for (int i = 0; i < idCategoryList.size(); i++) {
			if (i == 0) {
				q += " and (c.id =" + idCategoryList.get(i) + " ";
			} else {
				q += " or c.id =" + idCategoryList.get(i) + " ";
			}

			if (i == idCategoryList.size() - 1) {
				q += ") ";
			}

		}

		return em.createQuery(q, Annuncio.class).getResultList();
	}

}
