package ar.edu.itba.paw.persistence;

import ar.edu.itba.paw.model.Restaurant;
import ar.edu.itba.paw.model.User;
import ar.edu.itba.paw.persistance.RestaurantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

@Repository
public class RestaurantJdbcDao implements RestaurantDao {

    private final JdbcTemplate jdbcTemplate;
//    private final SimpleJdbcInsert jdbcInsert;

    private static final RowMapper<Restaurant> ROW_MAPPER = ((resultSet, i) ->
            new Restaurant(resultSet.getLong("restaurantId"),
                    resultSet.getString("restaurantName"),
                    resultSet.getString("phone"),
                    resultSet.getString("mail")));

    @Autowired
    public RestaurantJdbcDao(final DataSource ds) {
        jdbcTemplate = new JdbcTemplate(ds);
//        jdbcInsert = new SimpleJdbcInsert(ds)
//                .withTableName("Restaurant")
//                .usingGeneratedKeyColumns("restaurantId");
        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS restaurant ("
                + "restaurantId SERIAL PRIMARY KEY,"
                + "restaurantName varchar(100) NOT NULL,"
                + "phone varchar(100) NOT NULL,"
                + "Mail varchar(50) NOT NULL"
                + ")");
    }


    @Override
    public Optional<Restaurant> getRestaurantById(long id) {
        List<Restaurant> query = jdbcTemplate.query("SELECT * FROM restaurant WHERE restaurantId = ?",
                        new Object[]{id}, ROW_MAPPER);
        return query.stream().findFirst();
    }

    @Override
    public Restaurant create(String restaurantName, String phone, String mail) {
        return null;
    }
}