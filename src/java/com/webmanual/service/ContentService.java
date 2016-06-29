package com.webmanual.service;

import com.webmanual.dao.ContentManager;
import com.webmanual.entity.CompletedTest;
import com.webmanual.entity.Language;
import com.webmanual.entity.Page;
import com.webmanual.entity.Test;
import com.webmanual.entity.User;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.webmanual.exception.ObjectNotFoundException;

@Service
public class ContentService {
    
    private final ContentManager contentManager = new ContentManager();
    UserService userService = new UserService();
    
    public Page getPageByName(String pageName, Language language) throws ObjectNotFoundException {
        return contentManager.getPageByName(pageName, language);
    }

    public List<Language> getLanguageByName(String languageName) {
        return contentManager.getLanguageByName(languageName);
    }
    
    public List<Page> getAllPagesByLanguage(Language language) throws ObjectNotFoundException {
        return contentManager.getAllPagesByLanguage(language);
    }

    public List<Page> getPagesByWord(String word) {
        return contentManager.getPagesByWord(word);
    }
    public List<Language> getAllLanguages() {
        return contentManager.getAllLanguages();
    }

    public List<Test> getAllTests() {
        return contentManager.getAllTests();
    }
    
    public Test getTestById(Integer id) throws ObjectNotFoundException {
        return contentManager.getTestById(id);
    }
    
    public void PassTest(Integer idUser, Integer idTest, Integer score) throws ObjectNotFoundException {
        User user = userService.getById(idUser);
        Test test = contentManager.getTestById(idTest);
        CompletedTest newCompletedTest = new CompletedTest(test, user, score);
        contentManager.saveCompletedTest(newCompletedTest);
        user.changeRating(score);
        user.getTests().add(newCompletedTest);
        userService.update(user);
    }
}
