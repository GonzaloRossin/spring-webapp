<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&family=Quicksand:wght@600&display=swap" rel="stylesheet">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Materialize CSS -->
  <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"/>">
  <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">

  <title>Sentate-Register</title>

  <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon">
<body>
<%@ include file="../components/navbar.jsp" %>

<div class="row">
  <div class="col s3"></div>     <!-- acá va el restaurant card -->


  <c:url value="/restaurant=${restaurantId}/editTables" var="postPath"/>
  <form:form modelAttribute="editTablesForm" action="${postPath}" method="post">
    <div class="col s6 center">
      <div class="card register-card">
        <div class="card-content white-text">
          <span class="card-title text"><spring:message code="Restaurant.tables"/></span>
          <div class="row">
            <div class="input-field col s12 input">
              <form:errors path="openHour" element="p" cssStyle="color:red"/>
              <form:label path="openHour" class="helper-text" data-error="wrong" data-success="right"><spring:message code="Restaurant.hour.open"/></form:label>
              <form:input path="openHour" type="text"/>
            </div>
            <div class="input-field col s12 input">
              <form:errors path="closeHour" element="p" cssStyle="color:red"/>
              <form:label path="closeHour" class="helper-text" data-error="wrong" data-success="right"><spring:message code="Restaurant.hour.close"/></form:label>
              <form:input path="closeHour" type="text"/>
            </div>
            <div class="input-field col s12 input">
              <form:errors path="tableQty" element="p" cssStyle="color:red"/>
              <form:label path="tableQty" class="helper-text" data-error="wrong" data-success="right"><spring:message code="Restaurant.chairs"/></form:label>
              <form:input path="tableQty" type="text"/>
            </div>
          </div>
          <div class="col s12 center">
            <!-- acá va un href -->
            <spring:message code="Button.continue" var="label"/>
            <input type="submit" value="${label}" class="continue-btn"/>
          </div>
        </div>
      </div>
    </div>
  </form:form>
</div>
</body>
</html>

<style>
  .text{
    color:  #707070;
  }

  .card{
    border-radius: 16px;
    display: grid;
  }

  .restaurant-card{
    width:100%;
  }

  .register-card{

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
