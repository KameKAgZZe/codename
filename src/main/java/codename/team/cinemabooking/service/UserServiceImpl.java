package codename.team.cinemabooking.service;

import codename.team.cinemabooking.dao.RoleDao;
import codename.team.cinemabooking.dao.UserDao;
import codename.team.cinemabooking.model.Role;
import codename.team.cinemabooking.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Override
    public void Save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.getOne(1L));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByActivationCode(String code) {
        return userDao.findByActivationCode(code);
    }


    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public boolean activateUser(String code) {
        User user = findByActivationCode(code);
        if(user == null) {
            return false;
        }
        user.setActivationCode(null);
        user.setActive(true);
        userDao.save(user);
        return true;
    }

    @Override
    public boolean restoreUser(String code) {
        User user = findByActivationCode(code);
        if (user == null) {
            return false;
        }
    return true;
    }
}
