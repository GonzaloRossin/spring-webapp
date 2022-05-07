<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&family=Quicksand:wght@600&display=swap" rel="stylesheet">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <%--    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">--%>

    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">

    <title>Senta3</title>
    <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">
</head>
<body>
<%@ include file="../../components/navbar.jsp" %>

<div class="page-container">
    <c:if test="${isPresent}">
        <a href="<c:url value="/menu/orderItem?reservationId=${reservation.reservationId}&dishId=${recommendedDish.id}&isFromOrder=true"/>" class="dish-card">
            <div class="dish-img">
                <c:if test="${recommendedDish.imageId > 0}">
                    <img src="<c:url value="/resources_/images/${recommendedDish.imageId}"/>" alt="La foto del plato"/>
                </c:if>
                <c:if test="${recommendedDish.imageId == 0}">
                    <img src="<c:url value="/resources/images/fotoDefault.png"/>" alt="Es una foto default"/>
                </c:if>
            </div>
            <div class="card-info">
                <span class="presentation-text"><c:out value="${recommendedDish.dishName}"/></span>
                <p class="text description"><c:out value="${recommendedDish.dishDescription}"/></p>
                <c:if test="${reservation.reservationDiscount}">
                    <span id="original-price" class="text price">$<c:out value="${(recommendedDish.price)}"/></span>
                    <fmt:formatNumber var="dishPrice" type="number" value="${(recommendedDish.price * discountCoefficient)}" maxFractionDigits="2"/>
                    <span id="discounted-price" class="text price">$<c:out value="${dishPrice}"/></span>
                </c:if>
                <c:if test="${!reservation.reservationDiscount}">
                    <span class="text price">$<c:out value="${recommendedDish.price}"/></span>
                </c:if>
            </div>
        </a>
    </c:if>
    <div class="card confirm-card">
        <div class="card-content wider-content center">
            <span class="text main-title"><spring:message code="Completeorder.restaurant"/></span>
            <div class="with-margin">
                <span class="main-title text center"><c:out value="${restaurant.restaurantName}"/></span>
            </div>
            <div class="center">
                <span class="title2 text center"><spring:message code="Order.title"/></span>
            </div>
            <div class="summary">
                <div class="titles">
                    <div class="dishname">
                        <span class="title2 text"><spring:message code="Order.dish"/></span>
                    </div>
                    <div>
                        <span class="title2 text"><spring:message code="Order.qty"/></span>
                    </div>
                    <div>
                        <span class="title2 text"><spring:message code="Order.price"/></span>
                    </div>
                    <div>
                        <span class="title2 text"><spring:message code="Order.total"/></span>
                    </div>
                </div>
                <hr class="solid-divider">
                <c:forEach var="orderItem" items="${orderItems}">
                    <div class="titles">
                        <div >
                            <span class="items-title text"><c:out value="${orderItem.dishName}"/></span>
                        </div>
                        <div>
                            <span class="items-title text"><c:out value="${orderItem.quantity}"/></span>
                        </div>
                        <div>
                            <fmt:formatNumber var="orderItemUnitPrice" type="number" value="${(orderItem.unitPrice * discountCoefficient)}" maxFractionDigits="2"/>
                            <span class="items-title text">$<c:out value="${orderItemUnitPrice}"/></span>
                        </div>
                        <div>
                            <span class="items-title text"><c:out value="${orderItem.unitPrice * orderItem.quantity}"/></span>
                        </div>
                    </div>
                    <hr class="solid-divider">
                </c:forEach>

                <hr/>

                <div class="titles">
                    <div >
                        <p class="price"><spring:message code="Order.total"/></p>
                    </div>
                    <div>
                        <fmt:formatNumber var="totalPrice" type="number" value="${(total * discountCoefficient)}" maxFractionDigits="2"/>
                        <p class="price right "><c:out value="${totalPrice}"/></p>
                    </div>
                </div>

                    <div >
                        <c:url value="/order/send-food?reservationId=${reservationId}&restaurantId=${restaurant.id}" var="postUrl"/>
                        <form:form action="${postUrl}" method="post">
                            <input type="submit" value="Confirmar pedido" class="waves-effect waves-light btn confirm-btn green right">
                        </form:form>
                    </div>

            </div>

        </div>
    </div>

</div>
</body>
</html>

<style>

    .text{
        color:  #707070
    }

    .summary{
        margin-top: 20px;
        width: 100%;
    }


    .card{
        border-radius: 16px;
    }

    .dish-card:hover{
        transform: scale(1.1);
    }

    .center{
        justify-content: center;
    }

    .with-margin{
        margin-top: 10%;
        margin-bottom: 10%;
    }

    .page-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }

    .titles{
        display: flex;
        justify-content: space-between;
        margin-right: 10px;
    }

    .confirm-card{
        display:flex;
        justify-content: center;
        width: 40%;
        max-width: 60%;
        margin-left: 5%;
        margin-right: 5%;
    }

    .wider-content{
        width: 100%;
    }


</style>