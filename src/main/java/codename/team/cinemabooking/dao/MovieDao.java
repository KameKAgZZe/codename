package codename.team.cinemabooking.dao;


import codename.team.cinemabooking.model.Movie;

import org.springframework.data.jpa.repository.JpaRepository;


public interface MovieDao extends JpaRepository<Movie,Long> {
    Movie findByName(String name);
}
