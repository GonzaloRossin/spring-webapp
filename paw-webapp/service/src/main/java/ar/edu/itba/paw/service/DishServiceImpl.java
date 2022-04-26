package ar.edu.itba.paw.service;

import ar.edu.itba.paw.model.Dish;
import ar.edu.itba.paw.persistance.DishDao;
import ar.edu.itba.paw.persistance.ImageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class DishServiceImpl implements DishService{

    private DishDao dishDao;
    private ImageDao imageDao;

    @Autowired
    public  DishServiceImpl(final DishDao dishDao, final ImageDao imageDao){
        this.dishDao = dishDao;
        this.imageDao = imageDao;
    }

    @Override
    public Optional<Dish> getDishById(long id) {
        return dishDao.getDishById(id);
    }

    @Override
    public Dish create(long restaurantId, String dishName, String dishDescription, double price, long imageId){
        return dishDao.create(restaurantId, dishName, dishDescription, price, imageId);
    }

    @Override
    public void updateDish(long dishId, String dishName, String dishDescription, double price, long restaurantId) {
        dishDao.updateDish(dishId, dishName, dishDescription, price, restaurantId);
    }

    @Override
    public void updateDishPhoto(long dishId, long imageId) {
        Dish dish = dishDao.getDishById(dishId).get();
        if(dish.getImageId() > 1) {
            imageDao.deleteImageById(dish.getImageId());
        }
        dishDao.updateDishPhoto(dishId, imageId);
    }
    @Override
    public void deleteDish(long dishId) {
        dishDao.deleteDish(dishId);
    }
}
