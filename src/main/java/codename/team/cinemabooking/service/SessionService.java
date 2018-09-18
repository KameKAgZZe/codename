package codename.team.cinemabooking.service;


import codename.team.cinemabooking.model.Room;
import codename.team.cinemabooking.model.Row;
import codename.team.cinemabooking.model.Session;

import java.util.List;

public interface SessionService {
    void save(Session session);
    public List<Row>  rowList(Room room);
    public List<Room> roomList();
    public List<Session> sessionList();

}
