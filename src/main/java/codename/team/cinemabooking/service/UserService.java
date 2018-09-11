package codename.team.cinemabooking.service;

import codename.team.cinemabooking.model.User;

import java.util.List;

public interface UserService {
    void Save(User user);
    User findByUsername(String username);

    User findByActivationCode(String code);
    User findByEmail(String email);

    boolean activateUser(String code);
    boolean restoreUser(String code);
}
