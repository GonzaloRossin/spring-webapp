<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Materialize CSS -->
    <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"/>">

    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">

    <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">

    <title>Editar Plato</title>
<body>
<%@ include file="../../components/navbar.jsp" %>

<div class="form-container">
    <c:url value="/profile/editMail" var="postPath"/>
    <form:form modelAttribute="editMailForm" action="${postPath}" method="post">
        <div class="card card-content">
            <span class="main-title"><spring:message code="Customer.edit.mail"/></span>
            <div class="disName">
                <form:errors path="mail" element="p" cssStyle="color:red"/>
                <form:input path="mail" type="text"/>
            </div>
            <div class="submit center">
                <spring:message code="Button.confirm" var="label"/>
                <input type="submit" value="${label}" class="continue-btn"/>
            </div>
        </div>
    </form:form>
</div>
</body>
</html>

<style>

    .form-container{
        display: flex;
        padding-top: 30px;
        justify-content: center;
    }
    form{
        min-width: 30%;
    }
    .container { position: relative; }
    .container img{display: block}
    .container .material-icons{
        position: absolute;
        bottom: 45px;
        left: 65px;
    }
    .img-visualizer{
        align-self: center;
        width: 50%;
    }
    .container:hover img{
        filter: blur(1.5px);
    }
    .container:hover .material-icons{
        display: block;
    }
    img{
        border-radius: 16px;
        width: 100%;
        height: 100%;
    }
    .material-icons{
        display: none;
        color: black;
    }
    .card{
        border-radius: 16px;
        padding: 20px;
        display: flex;
    }
    .card.card-content{
        justify-content: center;
        flex-direction: column;
        align-content: center;
        font-family: "Segoe UI", Lato, sans-serif;
        min-height: 20%;
        min-width: 100%;
    }
    .card-description.text{
        font-family: "Goldplay", sans-serif;
        font-size: 25px;
        margin-bottom: 15px;
    }
    .continue-btn{
        font-family: "Goldplay", sans-serif;
        border-radius: 10px;
        background-color: #37A6E6;
        margin-top: 5%;
        opacity: 57%;
        padding: 2%;
        color: white;
    }
    .continue-btn:hover{
        background-color: #37A6E6;
        color: white;
        opacity: 100%;
    }

</style>