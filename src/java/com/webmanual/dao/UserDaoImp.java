package com.webmanual.dao;

import com.webmanual.entity.HibernateUtil;
import com.webmanual.entity.User;
import com.webmanual.exception.ObjectNotFoundException;
import java.util.List;
import javax.transaction.Transaction;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class UserDaoImp {
    
    private final SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    private Session session;
    
    
    public void create(User user) {
        session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback(); 
        }
        finally {
            session.close();
        }  
    }

    public void update(User user) {
        session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(user);
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

    public User getById(Integer userId) throws ObjectNotFoundException {
        User user = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            user = (User) session.createQuery("from User user where user.id=:id").setParameter("id", userId).list().get(0);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        if(user!=null) return user;
        else throw new ObjectNotFoundException("Object with such id not found");
    }

    public List<User> getUsersByWord(String word){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<User> listUsers = session.createQuery("from User user where lower(user.group) like lower(:word) or lower(firstName) like lower(:word)"
                    + " or lower(lastName) like lower(:word)"
                    + " or lower(concat_ws(' ', first_name, last_name)) like lower(:word) or lower(concat_ws(' ', lastName, firstName)) like lower(:word)").setParameter("word", "%" + word + "%").setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        session.getTransaction().commit();
        session.flush();
        session.close(); 
        return listUsers;
    }
    
    public List<User> orderByAlphabet(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<User> listUsers = session.createCriteria(User.class).addOrder(Property.forName("firstName").asc()).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        session.getTransaction().commit();
        session.flush();
        session.close(); 
        return listUsers;
    }
    
    public List<User> getAll(){
        List<User> listUser = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            listUser = session.createQuery("from User").setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        return listUser;
    }
    
    public User getByNickname(String nickname) throws ObjectNotFoundException {
        User user = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            user = (User) session.createQuery("from User user where user.nickname=:nickname or email=:nickname").setParameter("nickname", nickname).list().get(0);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        if(user!=null) return user;
        else throw new ObjectNotFoundException("Object not found");
    }

    public void delete(User user) {
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            session.delete(user);
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
    
    public User login(String login, String password) throws ObjectNotFoundException {
        User user = null;
        session = sessionFactory.openSession();  
        try {
            session.beginTransaction();
            user = (User) session.createQuery("from User user where (user.nickname=:login or email=:login) and password=:password").setParameter("login", login).setParameter("password", password).setParameter("password", password).list().get(0);
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        if(user!=null) return user;
        else throw new ObjectNotFoundException();
    }
    
    public List<User> orderByRating() {
        List<User> listUser = null;
        session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            listUser = session.createCriteria(User.class).addOrder(Order.desc("rating")).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
            session.getTransaction().commit();
        } catch (Exception exc) {
            exc.printStackTrace();
            session.getTransaction().rollback();
        }
        finally {
            session.flush();
            session.close();
        }
        return listUser;
    }
}
