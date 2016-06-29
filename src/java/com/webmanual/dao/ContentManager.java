package com.webmanual.dao;

import com.webmanual.entity.CompletedTest;
import com.webmanual.entity.HibernateUtil;
import com.webmanual.entity.Language;
import com.webmanual.entity.Page;
import com.webmanual.entity.Test;
import com.webmanual.exception.ObjectNotFoundException;
import java.util.List;
import javax.transaction.Transaction;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class ContentManager {
    
    private final static SessionFactory sessionFactory;
    private Session session;
    
    static {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    public Language getLanguageById(Integer languageId) throws ObjectNotFoundException {
        Language language = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            language = (Language) session.createQuery("from Language language where language.id=:id").setParameter("id", languageId).list().get(0);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        if(language!=null) return language;
        else throw new ObjectNotFoundException("Object with such id not found");
    }

    public List<Language> getAllLanguages() {
        List<Language> listLanguage = null;
        session = sessionFactory.openSession();  
        session.beginTransaction();
        listLanguage = session.createQuery("from Language").setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        session.getTransaction().commit();
        session.flush();
        session.close();
        return listLanguage;
    }
    
    public List<Test> getAllTests() {
        List<Test> listTests = null;
        session = sessionFactory.openSession();  
        session.beginTransaction();
        listTests = session.createQuery("from Test").setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        session.getTransaction().commit();
        session.flush();
        session.close();
        return listTests;
    }
    
    public List<Page> getPagesByWord(String word){
        session = sessionFactory.openSession();  
        session.beginTransaction();
        List<Page> listPages = session.createCriteria(Page.class).add(Restrictions.like("name", "%" + word + "%")).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        session.getTransaction().commit();
        session.flush();
        session.close();
        return listPages;
    }
    
    public void saveCompletedTest(CompletedTest completedTest) {
        session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(completedTest);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback(); 
        }
        finally {
            session.flush();
            session.close();
        }
    }
    
    public Test getTestById(Integer id) throws ObjectNotFoundException {
        Test test;
        session = sessionFactory.openSession();  
        session.beginTransaction();
        test = (Test) session.createQuery("from Test where id=:id").setParameter("id", id).list().get(0);
        session.getTransaction().commit();
        session.flush();
        session.close();
        if(test!=null) return test;
        else throw new ObjectNotFoundException("Objects not found");
    }
    
    public List<Page> getAllPagesByLanguage(Language language) throws ObjectNotFoundException {
        List<Page> listPages = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            listPages = session.createQuery("from Pages where id_language=:id").setParameter("id", language.getId()).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        if(listPages!=null) return listPages;
        else throw new ObjectNotFoundException("Objects not found");
    }
    
    public List<Language> getLanguageByName(String languageName) {
        List<Language> listLanguage = null;
        session = sessionFactory.openSession();  
        session.beginTransaction();
        listLanguage = session.createQuery("from Language language where lower(language.name)=:name").setParameter("name", languageName).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        session.getTransaction().commit();
        session.flush();
        session.close();
        return listLanguage;
    }
    
    public Page getPageByName(String pageName, Language language) throws ObjectNotFoundException {
        Page page = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            page = (Page) session.createQuery("from Page page where page.name=:name and page.language=:language").setParameter("name", pageName).setParameter("language", language).list().get(0);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        if(page!=null) return page;
        else throw new ObjectNotFoundException("Object not found");
    }

}
