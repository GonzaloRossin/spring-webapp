package ar.edu.itba.paw.service;

import ar.edu.itba.paw.model.Restaurant;



public interface MailingService{

    void sendConfirmationEmail(Restaurant restaurant);
}
