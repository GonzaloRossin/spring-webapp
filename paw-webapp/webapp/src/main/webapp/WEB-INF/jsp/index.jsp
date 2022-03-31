<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%--<html>--%>
<%--    <body>--%>
<%--        <h2>Hello <c:out value="${user.username}"/>!</h2>--%>
<%--        <h4>The users id is <c:out value="${user.id}"/></h4>--%>
<%--    </body>--%>
<%--</html>--%>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
    <body>
        <%@ include file="components/navbar.jsp" %>
        <div class="footer">
            <div class="buttons">
                <button type="button" class="btn btn-primary">Reservar</button>
                <button type="button" class="btn btn-primary">Ver menu</button>
                <div>
                    <input  type="text" class="form-control" placeholder="Codigo" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
        </div>
    </body>
</html>

<style>
    body{
        display:flex;
        flex-direction: column;
        min-height: 100vh;

    }
    .footer{
        position: absolute;
        bottom:0;
        width: 100%;
        background-color: orange;
        padding: 1em 0;
    }
    .buttons{
        display: flex;
        align-items: center;
        flex-grow: 1;
        justify-content: space-between;
        margin-left: 30%;
        margin-right: 30%;
    }

</style>

