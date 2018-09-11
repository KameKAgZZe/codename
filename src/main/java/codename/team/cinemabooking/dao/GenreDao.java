package codename.team.cinemabooking.dao;


import codename.team.cinemabooking.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;


public interface GenreDao extends JpaRepository<Genre, Long> {
    Genre findByName(String genreName);
}


