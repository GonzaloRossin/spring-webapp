package ar.edu.itba.paw.webapp.controller.customerUserSide;

import ar.edu.itba.paw.model.*;
import ar.edu.itba.paw.service.*;
import ar.edu.itba.paw.webapp.exceptions.CustomerNotFoundException;
import ar.edu.itba.paw.webapp.exceptions.ReservationNotFoundException;
import ar.edu.itba.paw.webapp.exceptions.RestaurantNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MenuController {
    private RestaurantService rs;
    private ReservationService res;
    private ControllerService controllerService;
    private CustomerService cs;


    @Autowired
    public MenuController(final RestaurantService rs, final ReservationService res,
                          final ControllerService controllerService, final CustomerService cs) {
        this.rs = rs;
        this.res = res;
        this.controllerService = controllerService;
        this.cs = cs;
    }

    @RequestMapping("/")
    public ModelAndView helloWorld() {

        final ModelAndView mav = new ModelAndView("menu/menu");

        Restaurant restaurant=rs.getRestaurantById(1).orElseThrow(RestaurantNotFoundException::new);
        restaurant.setDishes(rs.getRestaurantDishes(1));
        mav.addObject("restaurant", restaurant);
        return mav;
    }

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public ModelAndView menu(@RequestParam(name = "reservationId", defaultValue = "1") final String reservationIdP) throws Exception {

        controllerService.longParser(reservationIdP);
        long reservationId = Long.parseLong(reservationIdP);

        final ModelAndView mav = new ModelAndView("menu/fullMenu");
        Restaurant restaurant = rs.getRestaurantById(1).orElseThrow(RestaurantNotFoundException::new);
        restaurant.setDishes(rs.getRestaurantDishes(1));

        //Reservation reservation = res.getReservationById(reservationId).orElseThrow(ReservationNotFoundException::new);
        Reservation reservation = res.getReservationByIdAndIsActive(reservationId).orElseThrow(ReservationNotFoundException::new);
        Customer customer = cs.getUserByID(reservation.getCustomerId()).orElseThrow(CustomerNotFoundException::new);

        mav.addObject("discountCoefficient", res.getDiscountCoefficient(reservationId));
        mav.addObject("restaurant", restaurant);
        mav.addObject("dish", rs.getRestaurantDishes(1));
        mav.addObject("customer", customer);

        mav.addObject("reservation", reservation);

        List<FullOrderItem> orderItems = res.getOrderItemsByReservationIdAndStatus(reservationId, OrderItemStatus.SELECTED);
        mav.addObject("orderItems", orderItems);
        mav.addObject("selected", orderItems.size());
        mav.addObject("total", res.getTotal(orderItems));
        List<FullOrderItem> orderedItems = res.getOrderItemsByReservationIdAndOrder(reservationId);

        mav.addObject("ordered", res.getTotal(orderedItems));

        mav.addObject("unavailable", res.getUnavailableItems(reservationId));

        return mav;
    }

    @RequestMapping(value= "/menu/applyDiscount/{reservationId}", method = RequestMethod.POST)
    public ModelAndView applyDiscount(@PathVariable("reservationId") final String reservationIdP) throws Exception {

        controllerService.longParser(reservationIdP);
        long reservationId = Long.parseLong(reservationIdP);

        res.applyDiscount(reservationId);
        return new ModelAndView("redirect:/menu?reservationId=" + reservationId);
    }

    @RequestMapping(value= "/menu/cancelDiscount/{reservationId}", method = RequestMethod.POST)
    public ModelAndView cancelDiscount(@PathVariable("reservationId") final String reservationIdP) throws Exception {

        controllerService.longParser(reservationIdP);
        long reservationId = Long.parseLong(reservationIdP);

        res.cancelDiscount(reservationId);
        return new ModelAndView("redirect:/menu?reservationId=" + reservationId);
    }

}
