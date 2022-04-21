package ar.edu.itba.paw.persistance;

import ar.edu.itba.paw.model.Dish;

import java.util.List;
import java.util.Optional;

public interface DishDao {

    Optional<Dish> getDishById(long id);

    Dish create(long restaurantId, String dishName, String dishDescription, double price);
}
