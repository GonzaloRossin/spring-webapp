package ar.edu.itba.paw.webapp.auth.service;

import ar.edu.itba.paw.model.enums.Roles;
import ar.edu.itba.paw.webapp.auth.models.AuthenticationTokenDetails;

import java.util.Set;

public interface AuthenticationTokenService {
    String issueToken(String username, Set<Roles> authorities);
    AuthenticationTokenDetails parseToken(String token);
}