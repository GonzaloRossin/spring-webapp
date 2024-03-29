package ar.edu.itba.paw.persistence.jpa;

import ar.edu.itba.paw.model.Image;
import ar.edu.itba.paw.persistance.ImageDao;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.IOException;
import java.util.Optional;

@Repository
public class ImageJpaDao implements ImageDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Optional<Image> getImageById(long id) {
        return Optional.ofNullable(em.find(Image.class, id));
    }

    @Override
    public long create(byte[] photo) throws IOException {
        final Image image = new Image(photo);
        em.persist(image);
        return image.getImageId();
    }

    @Override
    public void deleteImageById(long imageId) {
        Image image = em.find(Image.class, imageId);
        em.remove(image);
    }
}
