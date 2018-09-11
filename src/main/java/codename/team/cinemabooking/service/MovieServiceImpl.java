package codename.team.cinemabooking.service;

import codename.team.cinemabooking.dao.GenreDao;
import codename.team.cinemabooking.dao.MovieDao;
import codename.team.cinemabooking.model.Genre;
import codename.team.cinemabooking.model.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class MovieServiceImpl implements MovieService{
    @Autowired
    private MovieDao movieDao;
    @Autowired
    private GenreDao genreDao;

    @Override
    public void save(Movie movie) {
        movieDao.save(movie);
    }

    @Override
    public Movie findByName(String name) {
     return  movieDao.findByName(name);
    }

    @Override
    public List<Movie> movieList() {
     return movieDao.findAll();
    }

    @Override
    public List<Genre> genreList() {
        return genreDao.findAll();
    }
}
