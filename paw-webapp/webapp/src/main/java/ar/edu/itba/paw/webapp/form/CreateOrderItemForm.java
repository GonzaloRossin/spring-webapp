package ar.edu.itba.paw.webapp.form;

import ar.edu.itba.paw.model.enums.OrderItemStatus;

public class CreateOrderItemForm {
    private long dishId;
    private int quantity;


    public long getDishId() {
        return dishId;
    }

    public void setDishId(long dishId) {
        this.dishId = dishId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}