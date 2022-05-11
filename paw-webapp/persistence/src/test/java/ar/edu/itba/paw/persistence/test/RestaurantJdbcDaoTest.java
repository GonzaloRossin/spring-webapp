package ar.edu.itba.paw.persistence.test;

import ar.edu.itba.paw.model.Dish;
import ar.edu.itba.paw.model.FullReservation;
import ar.edu.itba.paw.model.enums.DishCategory;
import ar.edu.itba.paw.model.enums.ReservationStatus;
import ar.edu.itba.paw.persistence.ReservationJdbcDao;
import ar.edu.itba.paw.persistence.RestaurantJdbcDao;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.jdbc.JdbcTestUtils;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static ar.edu.itba.paw.model.enums.DishCategory.DRINKS;
import static ar.edu.itba.paw.model.enums.DishCategory.MAIN_DISH;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
@Rollback
public class    RestaurantJdbcDaoTest {

    private static final String RESTAURANT_TABLE = "restaurant";
    private static final String DISH_TABLE = "dish";

    private RestaurantJdbcDao restaurantDao;
    private JdbcTemplate jdbcTemplate;
    private SimpleJdbcInsert jdbcInsertRestaurant;
    private SimpleJdbcInsert jdbcInsertDish;

    @Autowired
    private DataSource ds;


    @Before
    public void setUp(){
        restaurantDao = new RestaurantJdbcDao(ds);
        jdbcTemplate = new JdbcTemplate(ds);
        jdbcInsertRestaurant = new SimpleJdbcInsert(ds)
                .withTableName(RESTAURANT_TABLE)
                .usingGeneratedKeyColumns("restaurantId");
        jdbcInsertDish = new SimpleJdbcInsert(ds)
                .withTableName(DISH_TABLE)
                .usingGeneratedKeyColumns("dishId");
    }


    private Number insertDish(String name, String description, int price, int restaurantId, int imageId, DishCategory category){
        final Map<String, Object> dishData = new HashMap<>();
        dishData.put("dishName", name);
        dishData.put("dishDescription", description);
        dishData.put("price", price);
        dishData.put("restaurantId", restaurantId);
        dishData.put("imageId", imageId);
        dishData.put("category", category);
        Number dishId = jdbcInsertDish.executeAndReturnKey(dishData);
        return dishId;
    }

    private void cleanAllTables(){
        JdbcTestUtils.deleteFromTables(jdbcTemplate, DISH_TABLE);
    }

    @Test
    @Rollback
    public void testGetRestaurantDishes(){
        // 1. Precondiciones
        cleanAllTables();
        Number dishId1 = insertDish("Empanada", "sin pasas de uva", 100, 1, 1, MAIN_DISH);
        Number dishId2 = insertDish("Empanada2", "sin pasas de uva", 100, 1, 1, MAIN_DISH);

        // 2. Ejercitacion
        List<Dish> allDishes = restaurantDao.getRestaurantDishes(1);

        // 3. PostCondiciones
        Assert.assertEquals(2, allDishes.size());
    }

    @Test
    @Rollback
    public void testGetRestaurantDishes_noRestaurant(){
        // 1. Precondiciones
        cleanAllTables();
        Number dishId1 = insertDish("Empanada", "sin pasas de uva", 100, 1, 1, MAIN_DISH);
        Number dishId2 = insertDish("Empanada2", "sin pasas de uva", 100, 1, 1, MAIN_DISH);

        // 2. Ejercitacion
        List<Dish> allDishes = restaurantDao.getRestaurantDishes(0);

        // 3. PostCondiciones
        Assert.assertEquals(0, allDishes.size());
    }

    @Test
    @Rollback
    public void testGetRestaurantDishesByCategory(){
        // 1. Precondiciones
        cleanAllTables();
        Number dishId1 = insertDish("Empanada", "sin pasas de uva", 100, 1, 1, MAIN_DISH);
        Number dishId2 = insertDish("Empanada2", "sin pasas de uva", 100, 1, 1, MAIN_DISH);
        Number dishId3 = insertDish("Empanada líquida", "sin pasas de uva", 100, 1, 1, DRINKS);

        // 2. Ejercitacion
        List<Dish> allDishes = restaurantDao.getRestaurantDishesByCategory(1, MAIN_DISH);

        // 3. PostCondiciones
        Assert.assertEquals(2, allDishes.size());
    }

    /*
    @Test
    @Rollback
    public void testGetRestaurantDishesByCategory_wrongCategory(){
        // 1. Precondiciones
        cleanAllTables();
        Number dishId1 = insertDish("Empanada", "sin pasas de uva", 100, 1, 1, MAIN_DISH);
        Number dishId2 = insertDish("Empanada2", "sin pasas de uva", 100, 1, 1, MAIN_DISH);

        // 2. Ejercitacion
        List<Dish> allDishes = restaurantDao.getRestaurantDishesByCategory(1, DishCategory.valueOf("asd")); //ni me deja, asique bien

        // 3. PostCondiciones
        Assert.assertEquals(0, allDishes.size());
    }
     */

}
