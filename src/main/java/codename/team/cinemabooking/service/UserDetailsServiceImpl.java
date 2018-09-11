package codename.team.cinemabooking.service;

import codename.team.cinemabooking.dao.UserDao;
import codename.team.cinemabooking.model.Role;
import codename.team.cinemabooking.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;


import java.util.HashSet;
import java.util.Set;

public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserDao userDao;
    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
        User user = userDao.findByUsername(username);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for(Role role: user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));

        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
    }
}
