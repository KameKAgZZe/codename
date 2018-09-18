package codename.team.cinemabooking.model;

import javax.persistence.*;

@Entity
@Table(name = "row")
public class Row {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "place_in_row")
    private Long place_in_row;
    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Long getPlace_in_row() {
        return place_in_row;
    }

    public void setPlace_in_row(Long place_in_row) {
        this.place_in_row = place_in_row;
    }
}
