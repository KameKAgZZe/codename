package codename.team.cinemabooking.service;

public interface SecurityService {
    String findLoggedInUsername();
    void autoLogin(String username, String password);
}
