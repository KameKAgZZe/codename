package codename.team.cinemabooking.dao;

import codename.team.cinemabooking.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDao extends JpaRepository<User,Long> {
    User findByUsername(String username);
    User findByEmail(String email);
    User findByActivationCode(String code);
}
