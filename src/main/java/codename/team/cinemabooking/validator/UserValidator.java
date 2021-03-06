package codename.team.cinemabooking.validator;

import codename.team.cinemabooking.model.User;
import codename.team.cinemabooking.service.UserService;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator  implements Validator {
    @Autowired
    private UserService userService;
    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username","Required");
        if(user.getUsername().length() <4 || user.getUsername().length() >256){
            errors.rejectValue("username","Size.userForm.username");
        }
        if(userService.findByUsername(user.getUsername())!=null){
            errors.rejectValue("username","Duplicate.userForm.username");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email","Required");
        if(userService.findByEmail(user.getEmail())!=null){
            errors.rejectValue("email","Duplicate.userForm.email");
        }
        if(!EmailValidator.getInstance().isValid(user.getEmail())){
            errors.rejectValue("email","NotValid.userForm.email");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password","Required");
        if(user.getPassword().length()<8 || user.getPassword().length()>256){
            errors.rejectValue("password","Size.userForm.password");
        }
        if(!user.getConfirmPassword().equals(user.getPassword())){
            errors.rejectValue("confirmPassword","Different.userForm.password");
        }
    }
}
