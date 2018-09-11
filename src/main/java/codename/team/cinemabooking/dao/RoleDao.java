package codename.team.cinemabooking.dao;

import codename.team.cinemabooking.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDao extends JpaRepository<Role, Long> {
}
