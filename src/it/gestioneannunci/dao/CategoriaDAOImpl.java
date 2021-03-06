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

import it.gestioneannunci.model.Categoria;

@Component
public class CategoriaDAOImpl implements CategoriaDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Categoria> list() {
		return em.createQuery("From Categoria", Categoria.class).getResultList();
	}

	@Override
	public Categoria get(long id) {
		return em.find(Categoria.class, id);
	}

	@Override
	public void update(Categoria o) {
		o = em.merge(o);
	}

	@Override
	public void insert(Categoria o) {
		em.persist(o);
	}

	@Override
	public void delete(Categoria o) {
		em.remove(em.merge(o));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Categoria> findByExample(Categoria o) {
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

		Criteria objectCriteria = session.createCriteria(Categoria.class);
		Example objectExample = Example.create(o).setPropertySelector(ps);

		objectCriteria.add(objectExample);
		return objectCriteria.list();
	}

}
