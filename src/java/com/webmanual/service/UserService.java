package com.webmanual.service;

import com.webmanual.dao.UserDaoImp;
import com.webmanual.entity.User;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.webmanual.exception.ObjectNotFoundException;

@Service
public class UserService {
    
    private final UserDaoImp userDao = new UserDaoImp();
    
    public void create(User user) {
        userDao.create(user);
    }

    public void update(User user) {
        userDao.update(user);
    }

    public User getById(Integer userId) throws ObjectNotFoundException {
        return userDao.getById(userId);
    }

    public List<User> getAll() {
        return userDao.getAll();
    }

    public User getByNickname(String nickname) throws ObjectNotFoundException {
        return userDao.getByNickname(nickname);
    }

    public void delete(User user) {
       userDao.delete(user);
    }
    
    public List<User> getOrderByRating() {
        return userDao.orderByRating();
    }

    public List<User> getUsersByWord(String word){ 
        return userDao.getUsersByWord(word);
    }   
    public User login(String login, String password) throws ObjectNotFoundException {
        return userDao.login(login, password);
    }

    public List<User> orderByAlphabet() {
        return userDao.orderByAlphabet();
    }
}
