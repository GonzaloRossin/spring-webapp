package ar.edu.itba.paw.webapp.controller.customerUserSide;

// THIS IS A SOTUYO FILE

import ar.edu.itba.paw.model.User;
import ar.edu.itba.paw.model.enums.Roles;
import ar.edu.itba.paw.service.UserService;
import ar.edu.itba.paw.webapp.annotations.PATCH;
import ar.edu.itba.paw.webapp.dto.ReservationDto;
import ar.edu.itba.paw.webapp.dto.UserDto;
import ar.edu.itba.paw.webapp.form.CreateUserForm;
import ar.edu.itba.paw.webapp.form.ReservationPatchForm;
import ar.edu.itba.paw.webapp.form.UserPatchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import java.net.URI;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Path("users")
@Component
public class UserController {

    @Autowired
    private UserService us;
    @Context
    private UriInfo uriInfo;

//    @GET //no need to implement this?
//    @Produces(value = { MediaType.APPLICATION_JSON, })
//    public Response listUsers() {
//        final List<UserDto> allUsers = us.getAll()
//                .stream()
//                .map(u -> UserDto.fromUser(uriInfo, u))
//                .collect(Collectors.toList());;
//        return Response.ok(allUsers).build();
//    }

    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_FORM_URLENCODED})
    @POST
    public Response createUser(@Valid final CreateUserForm createUserForm) {
        final User user = us.create(createUserForm.getUsername(), "123", Roles.valueOf(createUserForm.getRole()));
        final URI uri = uriInfo.getAbsolutePathBuilder()
                .path(String.valueOf(user.getId())).build();
        return Response.created(uri).build();
    }

    @GET
    @Path("/{id}")
    @Produces(value = { MediaType.APPLICATION_JSON, })
    public Response getById(@PathParam("id") final long id) {
        final Optional<User> maybeUser = us.getUserByID(id);
        if (maybeUser.isPresent()) {
            return Response.ok(UserDto.fromUser(uriInfo, maybeUser.get())).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @DELETE
    @Path("/{id}")
    @Produces(value = { MediaType.APPLICATION_JSON, })
    public Response deleteById(@PathParam("id") final long id) {
        us.deleteById(id);
        return Response.noContent().build();
    }

    @PATCH
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_FORM_URLENCODED})
    @Path("/{id}")
    public Response editUser(@PathParam("id") final long id,
                                    final UserPatchForm userPatchForm){
        if(userPatchForm == null){
            return Response.status(400).build();
        }
        boolean success = us.patchUser(id, userPatchForm.getUsername(), userPatchForm.getPsPair());
        if(success) {
            return Response.ok().build();
        } else {
            return Response.status(400).build();
        }
    }
}