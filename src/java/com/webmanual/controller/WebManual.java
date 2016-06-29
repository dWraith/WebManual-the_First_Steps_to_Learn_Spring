package com.webmanual.controller;

import static com.sun.xml.internal.ws.dump.LoggingDumpTube.Position.Before;
import com.webmanual.entity.Answer;
import com.webmanual.entity.CompletedTest;
import com.webmanual.entity.HibernateUtil;
import com.webmanual.entity.Language;
import com.webmanual.entity.Page;
import com.webmanual.entity.Question;
import com.webmanual.entity.Test;
import com.webmanual.entity.User;
import com.webmanual.entity.User;
import com.webmanual.exception.ObjectNotFoundException;
import com.webmanual.service.ContentService;
import com.webmanual.service.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Controller
public class WebManual{
    
    UserService userService = new UserService();
    ContentService contentService = new ContentService();
    
    @ModelAttribute("languages")
    public List<Language> getListLanguage() {    
        return contentService.getAllLanguages();
    }
    
    @ModelAttribute("tests")
    public List<Test> getListTests() {    
        return contentService.getAllTests();
    }

    @RequestMapping(value = "/login")    
    public String getLoginPage(ModelMap model) {
        return "login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)    
    public String getLogin(Model model, HttpSession session, @RequestParam("login") String login, @RequestParam("password") String password) {
        User currentUser;
        try {
            currentUser = userService.login(login, password);
            session.setAttribute("currentUser", currentUser);
        } catch (ObjectNotFoundException ex) {
            model.addAttribute("message", "Вы ввели неккоректный логин или пароль");
            return "login";
        }
        return "redirect:/users/"+currentUser.getNickname();
    }
    
    
    @RequestMapping(value = "/users/{nickname}")    
    public String getUserByNickname(ModelMap model, @PathVariable("nickname") String nickname) {
        try {
            model.addAttribute("user", userService.getByNickname(nickname));
        } catch (ObjectNotFoundException ex) {
            return "redirect:/404";
        }
        return "userForm";
    }
    
    @RequestMapping(value = {"/welcome","/"})
    public String getStart(ModelMap map) {
        return "/index";
    }
    
    @RequestMapping(value = "/{name_language}/pages")
    public String home122(ModelMap model, @PathVariable("name_language") String name) {
        List<Page> listPages;
        model.addAttribute("languages", contentService.getLanguageByName(name));
        listPages = contentService.getLanguageByName(name).get(0).getListPages();
        model.addAttribute("pages", listPages);
        return "pages";
    }
    
    @RequestMapping(value = "/{name_language}/pages", params={"searchWord"}, method=RequestMethod.POST)
    public String home1222(ModelMap model, @PathVariable("name_language") String name, @RequestParam String searchWord) {
        model.addAttribute("pages", contentService.getPagesByWord(searchWord));
        model.addAttribute("languages", contentService.getLanguageByName(name));
        return "pages";
    }
    
    @RequestMapping(value = "/{name_language}/pages/{name}")
    public String home121(ModelMap map, @PathVariable("name_language") String nameLanguage, @PathVariable("name") String name) {
        try {
            map.addAttribute("page", contentService.getPageByName(name, contentService.getLanguageByName(nameLanguage).get(0)));
            map.addAttribute("languages", contentService.getLanguageByName(nameLanguage));
        } catch (ObjectNotFoundException ex) {
            return "redirect:/404";
        }
        return "page";
    }
    
    @RequestMapping(value = "/users/{nickname}/edit")
    public String getUserFormUpdate(ModelMap map, @PathVariable("nickname") String nickname) throws ObjectNotFoundException {
        map.addAttribute("user", userService.getByNickname(nickname));
        return "changeProfile";
    }
     
    @RequestMapping(value = "/users/{nickname}/edit", method = RequestMethod.POST)
    public String updateUserProfile(ModelMap map, @ModelAttribute("user") User user) {
        userService.update(user);
        map.addAttribute("page", 1);
        map.addAttribute("s", 1);
        return "redirect:/users";
    }
    
    @RequestMapping(value = "/users")
    public String showUserList(ModelMap model, @RequestParam("s") Integer type, HttpSession hSession) {
        List<User> listUsers;
        if(type==2) listUsers = userService.orderByAlphabet();
        else listUsers = userService.getAll();
        model.addAttribute("users", listUsers);
        return "searchUsers";
    }
    
    @RequestMapping(value = "/users", params={"searchWord"}, method = RequestMethod.POST)
    public String home51(ModelMap model, @RequestParam String searchWord) {
        model.addAttribute("users", userService.getUsersByWord(searchWord));
        return "searchUsers";
    }
    
    @RequestMapping(value = "/signup")
    public String getFormSignUp(ModelMap map) {
        map.addAttribute("newUser", new User());
        return "signup";
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String getSignUp(ModelMap map, @ModelAttribute("newUser") User user) {
        userService.create(user);
        map.addAttribute("message", "Вы удачно зарегистрировались. Войдите в систему, используя логин и пароль");
        return "redirect:/login";
    }
    
    @RequestMapping(value = "/tests/{id_test}")
    public String home7(ModelMap model, @PathVariable("id_test") Integer idTest) {
        try {
            model.addAttribute("test", contentService.getTestById(idTest));
        } catch (ObjectNotFoundException ex) {
            return "redirect:/404";
        }
        return "test";
    }
    
    @RequestMapping(value = "/tests/save", method = RequestMethod.POST)   
    public String home71(ModelMap model, @RequestParam("id_user") Integer idUser, @RequestParam("id_test") Integer idTest, @RequestParam("score") Integer score) throws ObjectNotFoundException {
        contentService.PassTest(idUser, idTest, score);
        model.addAttribute("page", 1);
        return "redirect:/pages";
    }
    
    @RequestMapping(value = "/users/top")
    public String home8(ModelMap model) {
        model.addAttribute("users", userService.getOrderByRating());
        return "topUsers";
    }
    
    @RequestMapping(value = "/logout")
    public String home81(ModelMap map, HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }
}
