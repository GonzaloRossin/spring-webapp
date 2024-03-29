package ar.edu.itba.paw.persistance;

import ar.edu.itba.paw.model.Dish;

import java.util.Optional;

public interface DishDao {

    Optional<Dish> getDishById(long id);


    void deleteDish(long dishId);

    Optional<Dish> getRecommendedDish(long reservationId);
}
