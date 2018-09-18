package codename.team.cinemabooking.dao;

import codename.team.cinemabooking.model.Room;
import codename.team.cinemabooking.model.Row;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface RowDao extends JpaRepository<Row, Long> {
    List<Row> findByRoom(Room room);
}


