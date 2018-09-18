package codename.team.cinemabooking.service;

import codename.team.cinemabooking.model.Genre;
import codename.team.cinemabooking.model.Movie;

import java.util.List;

public interface MovieService {
    void save(Movie movie);
    Movie findByName(String name);
    public List<Movie> movieList();
    public List<Genre> genreList();
    public List<String> ageBracketList();
}
