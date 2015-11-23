<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : productSearch
    Created on : Nov 15, 2015, 1:49:45 PM
    Author     : Abby & Patrick
--%>
   
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE user.userEmail = ? <sql:param value="${param.userEmail}"/>
</sql:query>
<c:set var="userDetails" value="${userQuery.rows[0]}"/>

<sql:query var="result" dataSource="jdbc/mudkip">
    SELECT prodID, prodName, supName, prodDesc, prodPrice, prodQuant  FROM product, supplier
    WHERE product.supID = supplier.supID AND product.active='1' AND product.prodName = ? <sql:param value="${param.prodName}"/>
</sql:query>
<c:set var="prodDetails" value="${result.rows[0]}"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--    <link rel="icon" href="../../favicon.ico">-->

    <title>Products</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="styles/navbar-fixed-top.css" rel="stylesheet">

  </head>

  <body>

    <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">Database Project</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
              <form action="returnStore">
                  <li class="active"><input type="submit" value="Home" /></li>
                  <div class="hidden">
                        <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                    </div>
              </form>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <form action="profileInfo">
                <input type="submit" value="${userDetails.userName}'s Profile" />
                <div class="hidden">
                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                </div>
            </form>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="container">
              <div class="jumbotron">
                  
                      <c:choose>
                          <c:when test="${prodDetails.prodQuant > 0}">
                            <h2>${prodDetails.prodName}</h2>
                            <br><strong>Product ID: </strong> ${prodDetails.prodID}</br>
                            <br><strong>Product Name: </strong> ${prodDetails.prodName}</br>
                            <br><strong>Product Supplier: </strong> ${prodDetails.supName}</br>
                            <br><strong>Product Description: </strong> ${prodDetails.prodDesc}</br>
                            <br><strong>Product Price: </strong> ${prodDetails.prodPrice}</br>
                            <br><strong>Product Stock: </strong> ${prodDetails.prodQuant} ${prodDetails.prodName} in Stock</br>
                            <form action="addToOrder" method="POST">
                                  <input type="text" name="prodQuant" value="0" />
                                  <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                    <input type="text" name="userID" value="${userDetails.userID}" />
                                    <input type="text" name="prodID" value="${prodDetails.prodID}" />
                                    <input type="text" name="orderID" value="${userDetails.orderID}" />
                                  </div>
                                  <input type="submit" value="Add to Order" />
                            </form>
                            <form action="logged.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                  <input type="submit" value="Return to Store" />
                            </form>
                        </c:when>
                          <c:otherwise>
                              <h2>The Product You Searched For is Not in Stock</h2>
                              <form action="logged.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                  <input type="submit" value="Return to Store" />
                            </form>
                          </c:otherwise>
                      </c:choose>

                      
              </div><!-- /jumbotron -->
              
          </div> <!-- /container -->
          
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
