package codename.team.cinemabooking.dao;

import codename.team.cinemabooking.model.Session;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SessionDao extends JpaRepository<Session,Long> {
}
