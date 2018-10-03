package codename.team.cinemabooking.model;


import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name = "booking")
public class Booking {
   @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
   @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "session_id")
    private Session session;
   @Column(name = "date")
   private Timestamp date;
   @OneToMany
   private Set<Place> place;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Set<Place> getPlace() {
        return place;
    }

    public void setPlace(Set<Place> place) {
        this.place = place;
    }
}
