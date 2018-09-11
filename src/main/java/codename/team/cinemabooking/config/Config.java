package codename.team.cinemabooking.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.JavaMailSender;

import java.util.Properties;

@Configuration
@ImportResource("appconfig-security.xml")
public class Config {
    @Value("${spring.mail.host}")
    private String host;

    @Value("${spring.mail.username}")
    private String username;

    @Value("${spring.mail.password}")
    private String password;

    @Value("${spring.mail.port}")
    private int port;

    @Value("${spring.mail.protocol}")
    private String protocol;

    @Value("${mail.debug}")
    private String debug;
    @Bean
    public JavaMailSenderImpl javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(host);
        mailSender.setPort(port);
        mailSender.setUsername(username);
        mailSender.setPassword(password);

        Properties properties = mailSender.getJavaMailProperties();

        properties.setProperty("mail.transport.protocol", protocol);
        properties.setProperty("mail.debug", debug);

        return mailSender;
    }
    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("/WEB-INF/messages/validation");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }
}
