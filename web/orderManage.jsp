<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : orderManage
    Created on : Nov 15, 2015, 1:49:45 PM
    Author     : Abby & Patrick
--%>
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE userEmail = ? <sql:param value="${param.userEmail}"/> OR orderID = ? <sql:param value="${param.orderID}"/> 
    ORDER BY staff
</sql:query>
<c:set var="custDetails" value="${userQuery.rows[0]}"/>
<c:set var="userDetails" value="${userQuery.rows[1]}"/>
    
<sql:query var="orderIndexQuery" dataSource="jdbc/mudkip">
    SELECT  contains.i FROM contains, user, product, orderr
    WHERE contains.orderID = ${custDetails.orderID} AND user.orderID = ${custDetails.orderID} AND contains.prodID = product.prodID AND orderr.orderID = ${custDetails.orderID}
</sql:query>
    
<sql:query var="containsQuery" dataSource="jdbc/mudkip">
    SELECT  contains.i, product.prodID, product.prodName AS Product, quant AS Quantity, prodPrice, prodPrice*quant AS Cost FROM contains, user, product, orderr
    WHERE contains.orderID = ${custDetails.orderID} AND user.orderID = ${custDetails.orderID} AND contains.prodID = product.prodID AND orderr.orderID = ${custDetails.orderID}
</sql:query>
    
<sql:query var="totalCost" dataSource="jdbc/mudkip">
    SELECT SUM(prodPrice*quant) AS Total FROM contains, user, product, orderr
    WHERE contains.orderID = ${custDetails.orderID} AND user.orderID = ${custDetails.orderID} AND contains.prodID = product.prodID AND orderr.orderID = ${custDetails.orderID}
</sql:query>
<c:set var="total" value="${totalCost.rows[0]}"/>
    


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <!--    <link rel="icon" href="../../favicon.ico">-->

        <title>The Store!</title>

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
            <div class="jumbotron">
                <h2>Management</h2>
                <h3>----------------------------------------</h3>
                <h3>${custDetails.userName}'s Cart</h3>
                <h3>${custDetails.userName}'s OrderID: ${custDetails.orderID}</h3>
                <!-- Total Cost -->
                <h4>Total Cost: $${total.Total}</h4>
                <h3>----------------------------------------</h3>
                <table border="1">
                    <!-- column headers -->
                    <tr>
                        <th>Index</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price Per Item</th>
                        <th>Cost</th>
                    </tr>
                    <!-- column data -->
                    <c:forEach var="row" items="${containsQuery.rowsByIndex}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>

                <form action="staffDelItem">
                    <h4>Select Product Item to Remove</h4>
                    <select name="orderIndex">
                        <c:forEach var="row" items="${orderIndexQuery.rowsByIndex}">
                            <c:forEach var="column" items="${row}">
                                <option><c:out value="${column}"/></option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                    <div class="hidden">
                        <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                        <input type="text" name="orderID" value="${custDetails.orderID}" />
                    </div>
                    <input type="submit" value="Item to Delete" />
                </form>


                <form action="staffClearOrder">
                    <input type="submit" value="Delete Everything in Order" />
                    <div class="hidden">
                        <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                        <input type="text" name="orderID" value="${custDetails.orderID}" />
                    </div>
                </form> 
                <form action="userEdit.jsp">
                    <input type="submit" value="Edit ${custDetails.userName}'s Order" />
                    <div class="hidden">
                        <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                        <input type="text" name="userID" value="${custDetails.userID}" />
                    </div>
                </form> 
            </div>

        </div> <!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>


