package codename.team.cinemabooking.dao;

import codename.team.cinemabooking.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookingDao extends JpaRepository<Booking, Long> {
}
