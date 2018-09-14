package codename.team.cinemabooking.controller;

import codename.team.cinemabooking.model.Genre;
import codename.team.cinemabooking.model.Movie;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Set;

public class ChangedMovie {
    private String name;
    private String description;
    private String director;
    private String age_bracket;
    private String duration;
    private Set<Genre> genres;

    public void applyChanges(Movie movie) {
        movie.setName(name);
        movie.setDescription(description);
        movie.setAge_bracket(age_bracket);
        movie.setDirector(director);
        movie.setDuration(duration);
        movie.setGenres(genres);
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setAge_bracket(String age_bracket) {
        this.age_bracket = age_bracket;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setGenres(Set<Genre> genres) {
        this.genres = genres;
    }
}
