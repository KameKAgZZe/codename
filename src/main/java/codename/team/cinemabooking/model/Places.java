package codename.team.cinemabooking.model;


import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "places")
public class Places {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;
    @Column(name ="place")
    private Integer place;

}
