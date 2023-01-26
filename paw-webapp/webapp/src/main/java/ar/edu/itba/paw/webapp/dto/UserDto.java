package ar.edu.itba.paw.webapp.dto;

import ar.edu.itba.paw.model.User;

import javax.ws.rs.core.UriInfo;
import java.net.URI;

public class UserDto {
    private String username;
    private String role;


    private URI content;

    static public UserDto fromUser(final UriInfo uriInfo, User user) {
        UserDto userDto = new UserDto();

        userDto.username = user.getUsername();
        userDto.role = user.getRole();
        switch (userDto.role) {
            case "ROLE_RESTAURANT":
                userDto.content = uriInfo.getAbsolutePathBuilder()
                        .replacePath("restaurants").path(String.valueOf(user.getId())).build();
                break;

            case "ROLE_CUSTOMER":
                userDto.content = uriInfo.getAbsolutePathBuilder()
                        .replacePath("customers").path(String.valueOf(user.getId())).build();
                break;
            case "ROLE_ANONYMOUS":

//                break;
            case "ROLE_WAITER":

//                break;
            case "ROLE_KITCHEN":

//                break;
            default:
                userDto.content = null;
        }
        return userDto;
    }

    public UserDto() {
        // Para jersey
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public URI getContent() {
        return content;
    }

    public void setContent(URI content) {
        this.content = content;
    }

}