package ar.edu.itba.paw.service;

import ar.edu.itba.paw.model.*;
import ar.edu.itba.paw.model.enums.OrderItemStatus;
import ar.edu.itba.paw.model.enums.ReservationStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface ReservationService {

    Optional<Reservation> getReservationBySecurityCode(String securityCode);

    OrderItem createOrderItemByReservation(Reservation reservation, Dish dish, int quantity);

    List<OrderItem> getOrderItemsByReservationAndStatus(Reservation reservation, OrderItemStatus status);

    List<OrderItem> getOrderItemsByStatus(OrderItemStatus status);

    Reservation createReservation(Restaurant restaurant, Customer customer, int reservationHour, int qPeople);

    float getTotal(List<OrderItem> orderItems);

    void updateOrderItemsStatus(Reservation reservation, OrderItemStatus oldStatus, OrderItemStatus newStatus);

    void updateOrderItemStatus(OrderItem orderItem, OrderItemStatus newStatus);

    void updateReservationStatus(Reservation reservation, ReservationStatus newStatus);

    void deleteOrderItemsByReservationAndStatus(Reservation reservation, OrderItemStatus status);

    void deleteOrderItemByStatus(OrderItem orderItem, OrderItemStatus status);

    List<Integer> getAvailableHours(long restaurantId, long qPeople, LocalDateTime reservationDate);

    List<Long> getUnavailableItems(long reservationId);

    List<Reservation> getAllReservations(Restaurant restaurant);

    Optional<Reservation> getReservationByIdAndIsActive(String securityCode);

    List<OrderItem> getOrderItemsByReservationAndOrder(Reservation reservation);

    List<OrderItem> getAllOrderItemsByReservation(Reservation reservation);

    List<Reservation> getReservationsByCustomer(Customer customer);

    List<Reservation> getReservationsByCustomerAndActive(Customer customer);

    void updateReservationById(Reservation reservation, Customer customer, long hour, int getqPeople);

    void checkReservationTime();

    void cleanMaybeReservations();

    void applyDiscount(String reservationSecurityCode);

    void cancelDiscount(String reservationSecurityCode);

    float getDiscountCoefficient(long reservationId);

    boolean canOrderReceipt(Reservation reservation, boolean hasOrdered);

    List<Reservation> getReservationsSeated(Restaurant restaurant);

    Optional<Reservation> getReservationBySecurityCodeAndStatus(String securityCode, ReservationStatus maybeReservation);

    List<Reservation> getAllReservationsOrderedBy(long restaurantId, String orderBy, String direction, String filterStatus, int page, long customerId);

    boolean isFromOrder(String isFromOrderP);

    Optional<OrderItem> getOrderItemById(long orderItemId);

    void updateReservationDateById(Reservation reservation, LocalDateTime reservationDate);

    List<Reservation> getReservationsByCustomerAndStatus(Customer customer, ReservationStatus status);

    void setTableNumber(Reservation reservation, int number);

    void setReservationSecurityCode(Reservation reservation);

    void raiseHand(String reservationIdP);

    boolean isRepeating(Customer customer, Reservation reservation);

    void finishReservation(Restaurant restaurant, Customer customer, Reservation reservation);

    void cancelReservation(Restaurant restaurant, Customer customer, Reservation reservation);

    Reservation createMaybeReservation(Restaurant restaurant, Customer customer, int qPeople);

    void updateReservationHourBySecurityCode(Reservation reservation, int hour, int getqPeople);

    void orderReceipt(Reservation reservation, Customer customer, List<OrderItem> orderItems);

    void seatCustomer(Reservation reservation, int seatNumber);

    void finishCustomerReservation(Reservation reservation);

    Reservation createReservationPost(long restaurantId, long customerId, int reservationHour, int qPeople, LocalDateTime startedAtTime, LocalDateTime reservationDate);

    boolean patchReservation(String securityCode, String reservationDate, Integer hour, Integer qPeople, Integer table, Boolean hand, Boolean discount, ReservationStatus reservationStatus);

    boolean deleteReservation(String securityCode);
}