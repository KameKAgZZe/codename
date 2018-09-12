package codename.team.cinemabooking.controller;

import codename.team.cinemabooking.model.User;
import codename.team.cinemabooking.service.MailSender;
import codename.team.cinemabooking.service.SecurityService;
import codename.team.cinemabooking.service.UserService;
import codename.team.cinemabooking.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    // Which is auto-generated by Spring, we will use it to handle the data
    @Autowired
    private MailSender mailSender;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;
    @Value("${cinema.name}")
    private String cinema_name;
    @Value("${activation.link}")
    private String activationLink;
    @Value("${restore.link}")
    private String restoreLink;
    @RequestMapping(value = "/", method = RequestMethod.GET)

    public String index() {
        return "index";
    }
    @RequestMapping(value ="/index", method = RequestMethod.GET)
    public String index(Model model){
        return "index";
    }
    @RequestMapping(value ="/restore", method = RequestMethod.GET)
    public String restore(Model model, String error, String logout){

        return "restore";
    }
    //TODO: Need make refactoring this method and check active status user. If user not active, redirect to page with resend button activation code.
    @RequestMapping(value ="/restorecheck", method = RequestMethod.POST)
    public String restore(Model model, @RequestParam("email") String email) {

        User user = userService.findByEmail(email);
        if (user == null) {
            model.addAttribute("error", "Такого пользователя не существует!");
            return "restore";
        }
        user.setActivationCode(UUID.randomUUID().toString());
        if (!StringUtils.isEmpty(email)) {
            String message = String.format("Здравствуйте, %s!'\n" +
                    "Запрос на восстановления пароля на сайте сети кинотеатра %s!\n" +
                    "Для восстановления доступа к аккаунту передите по ссылке: %s%s", user.getUsername(), cinema_name, restoreLink, user.getActivationCode());
            mailSender.send(email, "Restore your account", message);
            return "checkyouremail";
        }
        return "restore";
    }
    @RequestMapping(value ="/registration", method = RequestMethod.GET)
    public String registration(Model model){
        model.addAttribute("userForm", new User());
        return "registration";
    }
    @RequestMapping(value ="/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model){
        userValidator.validate(userForm, bindingResult);
        if(bindingResult.hasErrors()){
            return "registration";
        }
        userForm.setActive(false);
        userForm.setActivationCode(UUID.randomUUID().toString());
        userService.Save(userForm);
        if(!StringUtils.isEmpty(userForm.getEmail())){
            String message = String.format("Здравствуйте, %s!'\n" +
                    "Добро пожаловать на сайт кинотеатра %s!\n" +
                "Для подтверждения регистрации передите по ссылке: %s%s",userForm.getUsername(),cinema_name,activationLink,userForm.getActivationCode());
            mailSender.send(userForm.getEmail(),"Please confirm your email address", message);
        }

        return "redirect:/confirm";
    }
    @RequestMapping(value ="/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout){

            if (error != null) {
                model.addAttribute("error", "Данные для входа не корректны, либо пользователь не активировал свой аккаунт   .");
            }
            if (logout != null) {
                model.addAttribute("message", "Вы успешно вышли!");
            }

        return "login";
    }
    @RequestMapping(value ="/login", method = RequestMethod.POST)
    public String login(Model model){
        return "login";
    }
    @RequestMapping(value ="activatecheck",method = RequestMethod.GET)
    public String activatecheck(Model model, @RequestParam String username){
        if(userService.findByUsername(username).isActive()){
            return "redirect:/welcome";
        }
        else return "login?fail";
    }
    @RequestMapping(value ="/welcome", method = RequestMethod.GET)
    public String welcome(Model model){
        return "welcome";
    }

    @RequestMapping(value ="/confirm", method = RequestMethod.GET)
    public String confirm(Model model){
        return "confirm";
    }
    @RequestMapping(value ="/checkyouremail", method = RequestMethod.GET)
    public String checkyouremail(Model model){
        return "checkyouremail";
    }
    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
        boolean isActivate = userService.activateUser(code);
        if(isActivate){
            model.addAttribute("message","Пользователь был активирован");
//            securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
        }
        else{
            model.addAttribute("message","Код подтверждения не был найден");
        }

        return "redirect:/welcome";
    }
    //TODO: create method userService.restorateUser(String code)
    @GetMapping("/restoring/{code}")
    public String restoring(Model model, @PathVariable String code){
        boolean isActivate = userService.activateUser(code);
        if(isActivate){
            model.addAttribute("message","Пользователь был восстановлен");
//            securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
            return "restoring";
        }
        else{
            model.addAttribute("message","Код подтверждения не был найден");
        }

        return "redirect:/restore";
    }


}
