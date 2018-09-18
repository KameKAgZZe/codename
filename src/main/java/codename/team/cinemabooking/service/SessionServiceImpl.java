package codename.team.cinemabooking.service;

import codename.team.cinemabooking.dao.RoomDao;
import codename.team.cinemabooking.dao.RowDao;
import codename.team.cinemabooking.dao.SessionDao;
import codename.team.cinemabooking.model.Room;
import codename.team.cinemabooking.model.Row;
import codename.team.cinemabooking.model.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SessionServiceImpl implements SessionService {
    @Autowired
    private RoomDao roomDao;
    @Autowired
    private RowDao rowDao;
    @Autowired
    private SessionDao sessionDao;

    @Override
    public void save(Session session) {
        sessionDao.save(session);
    }

    @Override
    public List<Row> rowList(Room room) {
        return rowDao.findByRoom(room);
    }

    @Override
    public List<Room> roomList() {
        return roomDao.findAll();
    }

    @Override
    public List<Session> sessionList() {
        return sessionDao.findAll();
    }
}
