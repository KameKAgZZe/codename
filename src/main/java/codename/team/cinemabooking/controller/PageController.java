package codename.team.cinemabooking.controller;

import codename.team.cinemabooking.model.Booking;
import codename.team.cinemabooking.model.Place;
import codename.team.cinemabooking.model.Session;
import codename.team.cinemabooking.model.User;
import codename.team.cinemabooking.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

@Controller
public class PageController {
    @Autowired
    private SessionService sessionService;
    @Value("${cinema.name}")
    private String cinema_name;
    @RequestMapping(value = "/", method = RequestMethod.GET)

    public String index() {
        return "index";
    }
    @RequestMapping(value ="/index", method = RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("cinema_name",cinema_name);
        return "index";
    }
    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model model) {
        return "about";
    }
    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contacts(Model model) {
        return "contacts";
    }
    @GetMapping("/booking/{session}")
    public String bookingForm(@PathVariable Session session, Model model){
        model.addAttribute("session", session);
        model.addAttribute("rows",sessionService.rowList(session.getRoom()));
        return "booking";
    }
    @PostMapping("/booking/{session}")
    public String bookingForm(@RequestParam List<String> isChecked, Booking booking, @PathVariable Session session, Model model){

        session.getRoom();
        booking.setSession(session);
        booking.setDate(new Timestamp(java.util.Calendar.getInstance().getTimeInMillis()));
        //TODO user and places
        return "redirect:/complete";
    }
}
