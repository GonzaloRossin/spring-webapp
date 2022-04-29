package ar.edu.itba.paw.persistance;

import ar.edu.itba.paw.model.*;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

public interface ReservationDao {


    Optional<Reservation> getReservationById(long id);

    Optional<Reservation> getReservationByIdAndStatus(long id, ReservationStatus status);

    List<Reservation> getReservationsByStatus(ReservationStatus status);

    Reservation createReservation(long restaurantId, long customerId, int reservationHour);

    List<OrderItem> addOrderItemsByReservationId(List<OrderItem> orderItems);

    OrderItem createOrderItemByReservationId(long reservationId, Dish dish, int quantity);

    List<FullOrderItem> getOrderItemsByReservationId(long reservationId);

    List<FullOrderItem> getOrderItemsByReservationIdAndStatus(long reservationId, OrderItemStatus status);

    List<FullOrderItem> getOrderItemsByStatus(OrderItemStatus status);

    void updateOrderItemsStatus(long reservationId, OrderItemStatus oldStatus, OrderItemStatus newStatus);

    void updateOrderItemStatus(long orderItemId, OrderItemStatus newStatus);

    void updateReservationStatus(long reservationId, ReservationStatus newStatus);

    void deleteOrderItemsByReservationIdAndStatus(long reservationId, OrderItemStatus status);

    List<Integer> getAvailableHours(long restaurantId);

    void cancelReservation(long restaurantId, long reservationId);

    List<Long> getUnavailableItems(long reservationId);

    List<Reservation> getAllReservations(long restaurantId);
}
