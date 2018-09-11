package codename.team.cinemabooking.validator;

import codename.team.cinemabooking.model.Movie;
import codename.team.cinemabooking.model.User;
import codename.team.cinemabooking.service.MovieService;
import codename.team.cinemabooking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class MovieValidator implements Validator {
    @Autowired
    private MovieService movieService;
    @Override
    public boolean supports(Class<?> aClass) {
        return Movie.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Movie movie = (Movie) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name","Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description","Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "director","Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age_bracket","Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "duration","Required");
        }
    }

