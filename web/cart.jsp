<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : cart
    Created on : Nov 15, 2015, 8:49:24 PM
    Author     : Abby & Patrick
--%>
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE user.userEmail = ? <sql:param value="${param.userEmail}"/>
</sql:query>
<c:set var="userDetails" value="${userQuery.rows[0]}"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Cart</title>
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
      <div class="jumbotron">
        <table border="1">
            <sql:query var="containsQuery" dataSource="jdbc/mudkip">
                SELECT product.prodName, contains.quant, product.prodPrice, (prodPrice * contains.quant) AS Cost FROM user, contains, product
                WHERE user.orderID = ${userDetails.orderID} AND contains.orderID = ${userDetails.orderID} AND product.prodID = contains.prodID;
            </sql:query>
            <thead>
                <tr>
                    <th>
                        <h2>${userDetails.userName}'s Shopping Cart</h2>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Product Name</td>
                    <td>Quantity</td>
                    <td>Price Per Item</td>
                    <td>Cost</td>
                </tr>
                <c:forEach var="row" items="${containsQuery.rowsByIndex}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                <tr>
                    <td>
                        <form action="returnStore">
                            <input type="submit" value="Return to the Store" />
                            <div class="hidden">
                                <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                            </div>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
      </div>
      </div>

    </body>
</html>
