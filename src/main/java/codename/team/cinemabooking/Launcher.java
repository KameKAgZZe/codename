package codename.team.cinemabooking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@SpringBootApplication
@EnableWebSecurity
public class Launcher {
    public static void main(String[] args) {
        SpringApplication.run(Launcher.class, args);
    }
}
