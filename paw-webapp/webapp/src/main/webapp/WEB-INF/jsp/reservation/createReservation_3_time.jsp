<%@ page import="java.util.LinkedList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Materialize CSS -->
    <link rel="stylesheet" href=" <c:url value="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"/>">

    <title>Sentate-Registro</title>
    <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">

    <script>
        function validateSelect()
        {
            const sel = document.getElementById('hourSelect');
            window.location.href = 'people=' + <c:out value="${people}"/> + "/hour=" + sel.value;
        }
    </script>
<body>
<%@ include file="../components/navbar.jsp" %>

<div class="content">
    <c:url value="/createReservation-1" var="postPath"/>
    <div class="content-container">
        <div class="card register-card">
            <span class="main-title">A que hora?</span>

            <div class="input-field">
                <select id="hourSelect" name="hourSelection">
                    <c:forEach items="${hours}" var="eachHour">
                        <option value=${eachHour}>${eachHour}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="submit center">
                <input type="button" id="continueButton" value="Continuar" class="continue-btn" onclick="return validateSelect()"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<style>

    body{
        background-color: #F0F0F0;
    }
    .card{
        border-radius: 16px;
        display: flex;
        flex-wrap: wrap;
        margin: 10px;
        justify-content: center;
        align-content: center;
        flex-direction: column;
        min-height: 300px;
        height: 100%;
        min-width: 250px;
        width: 100%;
        padding: 20px;
    }

    .content{
        display: flex;
        justify-content: center;
        padding: 20px;
        align-content: center;
    }
    span{
        font-family: "Segoe UI", Lato, sans-serif;
        font-size: 23px;
    }
    input{
        font-family: "Segoe UI", Lato, sans-serif;
        font-size: 20px;
    }
    select{
        display: flex;
    }


    .continue-btn{
        padding-inline: 7%;
        padding-block: 1%;
        border-radius: 16px;
        background-color: #37A6E6;
        margin-top: 5%;
        opacity: 57%;
    }

    .continue-btn:hover{
        background-color: #37A6E6;
        color: white;
        opacity: 100%;
    }

    .back-btn{
        border-radius: 16px;
        margin-top: 5%;
        background-color: #E63737 ;
        opacity: 87%;
    }

    .back-btn:hover{
        border-radius: 16px;
        margin-top: 5%;
        background-color: #E63737 ;
        opacity: 100%;
    }

    .input{
        margin-bottom: 1px;
    }

    .center{
        align-items: center;
    }

</style>
