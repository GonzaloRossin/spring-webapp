<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&family=Quicksand:wght@600&display=swap" rel="stylesheet">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Materialize CSS -->
        <link rel="stylesheet" href=" <c:url value="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"/>">
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">

        <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet">


        <title>Senta3</title>
        <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">
    </head>
    <body>
        <div class="row">
            <%@ include file="../../components/navbar.jsp" %>
        </div>
        <div class="restaurant-header">
            <div class="restaurant-info" style="background-color: rgb(255, 242, 229);">
                <div>
                    <i class="medium material-icons">restaurant</i>
                </div>
                <div>
                    <div class="presentation-text title restaurant-title">
                        <span class="presentation-text header-title"><c:out value="${restaurant.restaurantName}"/></span>
                    </div>
                    <div class="presentation-text restaurant-description">
                        <span><spring:message code="Fullmenu.phone"/> </span>
                        <span><c:out value="${restaurant.phone}"/></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-container">
            <div class="restaurant-content">
                <div class="card left-section">
                    <div class="client-actions center">
                        <span class="presentation-text box-comments"><spring:message code="Menu.reservation.new.title"/></span>
                        <sec:authorize access="!hasRole('RESTAURANT')">
                            <div class="reservation-action-btn">
                                <c:url value="/createReservation-0" var="postUrl"/>
                                <form:form action="${postUrl}" method="post">
                                    <spring:message code="Button.reserve" var="label"/>
                                    <input type="submit" value="${label}" class="waves-effect waves-light btn confirm-btn">
                                </form:form>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('RESTAURANT')">
                            <div class="reservation-action-btn">
                                <a disabled class="waves-effect waves-light btn confirm-btn" href=""><spring:message code="Menu.reservation.new"/></a>
                            </div>
                        </sec:authorize>
                        <span class="presentation-text box-comments"><spring:message code="Menu.reservation.exists.title"/></span>
                        <sec:authorize access="!hasRole('RESTAURANT')">
                            <div class="enter-confirm-btn">
                                <a class="waves-effect waves-light btn confirm-btn" href="findReservation?restaurantId=${restaurant.id}"><spring:message code="Menu.reservation.exists"/></a>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('RESTAURANT')">
                            <div class="enter-confirm-btn">
                                <a disabled class="waves-effect waves-light btn confirm-btn" href=""><spring:message code="Menu.reservation.exists"/></a>
                            </div>
                        </sec:authorize>
                    </div>
                    <div class="filter-box">
                        <span class="presentation-text"><spring:message code="FilterBox.title"/></span>
                        <ul class="categories">
                            <c:forEach var="category" items="${categories}">
                                <a href="<c:url value="/?category=${category}"/>">
                                    <c:if test="${currentCategory.name == category.name}">
                                        <button class="waves-effect waves-light btn confirm-btn text description">
                                            <c:out value="${category.name}"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${currentCategory.name != category.name}">
                                        <button class="waves-effect waves-light btn confirm-btn text description">
                                            <c:out value="${category.name}"/>
                                        </button>
                                    </c:if>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="dish-categories">
                    <div>
                        <h3 class="presentation-text header-title"><c:out value="${currentCategory.name}"/></h3>
                    </div>
                    <div class="dishList">
                        <c:forEach var="dish" items="${dishes}">
                            <c:url value="/createReservation-1" var="postUrl"/>
                            <a class="card horizontal" href="${postUrl}">
                                <div class="card-image">
                                    <c:if test="${dish.imageId > 0}">
                                        <img src="<c:url value="/resources_/images/${dish.imageId}"/>" alt="La foto del plato"/>
                                    </c:if>
                                    <c:if test="${dish.imageId == 0}">
                                        <img src="<c:url value="/resources/images/fotoDefault.png"/>" alt="Es una foto default"/>
                                    </c:if>
                                </div>
                                <div class="card-stacked">
                                    <div class="card-content">
                                        <div>
                                            <span class="presentation-text info"><c:out value="${dish.dishName}"/></span>
                                            <p class="text description info"><c:out value="${dish.dishDescription}"/></p>
                                            <c:if test="${reservation.reservationDiscount}">
                                                <span id="original-price" class="text price">$<c:out value="${dish.price}"/></span>
                                                <fmt:formatNumber var="dishPrice" type="number" value="${(dish.price * discountCoefficient)}" maxFractionDigits="2"/>
                                                <span id="discounted-price" class="text price">$<c:out value="${dishPrice}"/></span>
                                            </c:if>
                                        </div>
                                        <c:if test="${!reservation.reservationDiscount}">
                                            <span class="text price info">$<c:out value="${dish.price}"/></span>
                                        </c:if>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<style>
    .card.horizontal{
        width: 27em;
        height: 9rem;
        margin: 1%;
        box-shadow: 0 1.4rem 8rem rgba(0,0,0,.35);
        transition: 0.8s;
    }
    .card.horizontal:hover{
        transform: scale(1.1);
    }
    .btn.confirm-btn{
        margin-bottom: 0.5em;
    }
    .card.horizontal .card-image{
        object-fit: fill;
        max-width: 25%;
        margin-left: 2%;
    }
    .card.horizontal .card-image img{
        border-radius: .8rem;
        width: clamp(5rem,100%,10rem);
        height: clamp(5rem,100%,10rem);
        aspect-ratio: 1/1;
    }
    .card-stacked{
        height: 100%;
    }
    .page-container{
        padding-left: 20px;
        padding-right: 20px;
    }
    .restaurant-info{
        width: 100%;
        background-color: rgb(16, 24, 28);
    }
    .restaurant-content {
        margin-top: 30px;
        display: flex;
        width: 100%;
        justify-content: flex-start;
        flex-wrap: wrap;
    }
    .card.left-section{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: clamp(10em,15%,15em);
        height: clamp(34em,100%,40em);
    }
    .categories{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .btn.text.description{
        color: white;
    }
    .client-actions{
        margin-top: 1em;
    }
    .filter-box{
        display: flex;
        margin-top: 1em;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
    }
    .card-info p{
        margin-block-start: 0;
    }
    .presentation-text.info{
        font-size: 1rem;
    }
    .text.description.info{
        font-size: 0.8rem;
    }
    .text.price.info{
        font-size: 0.8rem;
    }

    .presentation-text.box-comments{
        color: #171616;
    }
    i{
        color: rgb(255, 68, 31);
        margin-right: 25px;
    }
    .reservation-action-btn{
        display: flex;
        flex-direction: row;
        justify-content: center;
    }

    .dish-categories{
        margin-left: 2em;
        width: clamp(30em,79%,105em);
    }
    .dishList{
        display: flex;
        justify-content: flex-start;
        flex-wrap: wrap;
        width: clamp(30em,100%,105em);
    }
    @media (max-width: 600px){
        .restaurant-content{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }
        .card.left-section{
            width: 100%;
        }
        .card.horizontal{
            margin: 2%;
        }
        .card.horizontal:hover{
            transform: scale(1.1);
        }
        .dish-categories{
            width: 100%;
        }
        .card.left-section{
            width: clamp(15em,100%,20em);
        }
    }


</style>

