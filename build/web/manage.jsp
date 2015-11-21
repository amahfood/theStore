<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : manage.jsp
    Created on : Nov 16, 2015, 9:01:02 AM
    Author     : Abby & Patrick
--%>
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE user.userEmail = ? <sql:param value="${param.userEmail}"/>
</sql:query>
<c:set var="userDetails" value="${userQuery.rows[0]}"/>

<sql:query var="product" dataSource="jdbc/mudkip">
    SELECT * FROM product
</sql:query>


<sql:query var="sup" dataSource="jdbc/mudkip">
    SELECT * FROM supplier
</sql:query>


<sql:query var="order" dataSource="jdbc/mudkip">
    SELECT * FROM orderr
</sql:query>
    
<sql:query var="user" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE user.staff != 'StoreOwner'
    ORDER BY staff
</sql:query>
    
<sql:query var="orderDetail" dataSource="jdbc/mudkip">
    SELECT * FROM orders
</sql:query>
    
 <sql:query var="orderDisplay" dataSource="jdbc/mudkip">
    SELECT * FROM orders, orderr, user
    WHERE orders.orderID = orderr.orderID AND orders.userID = user.userID
</sql:query>



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
        <title>Manage Stock</title>
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
        <div class="jumbotron">
            <h2>Management</h2>
            <c:set var="staff" scope="page" value="${userDetails.staff}"/>
            
            <table border="1">
                <thead>
                    <tr>
                        <th>Stock</th>
                        <c:if test="${staff == 'StoreOwner'}">
                               <th>Users</th>
                        </c:if>
                        <th>Suppliers</th>
                        <th>Orders</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Select Product</td>
                        <c:if test="${staff == 'StoreOwner'}">
                            <td>Select a User</td>
                        </c:if>
                        <td>Select a Supplier</td>
                        <td>Select an Order</td>
                    </tr>
                    <tr>
                        <td>
                            <form action="prodManage">
                                <select name="prodID">
                                    <c:forEach var="row" items="${product.rows}">
                                        <option value="${row.prodID}">${row.prodName} : ${row.prodID}</option>
                                    </c:forEach>
                                </select>
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" name="prodName" value="Manage Product" />
                            </form> 
                             <form action="prodAdd.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" value="Add New Product" />
                            </form>   
                        </td>
                        <c:if test="${staff == 'StoreOwner'}">
                            <td>
                                <form action="custManage.jsp">
                                    <select name="userID">
                                        <c:forEach var="row" items="${user.rows}">
                                            <option name="userID" value="${row.userID}">${row.userName} : ${row.userID} : ${row.staff}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="hidden">
                                        <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                    </div>
                                    <input type="submit" name="cust" value="Manage User" />
                                </form>
                                <form action="custAdd.jsp">
                                    <div class="hidden">
                                        <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                    </div>
                                    <input type="submit" value="Add New User" />
                                </form>
                            </td>
                        </c:if>

                        <td>
                            <form action="supDel">
                                <select name="supID">
                                    <c:forEach var="row" items="${sup.rows}">
                                        <option name="supID" value="${row.supID}">${row.supName} : ${row.supID}</option>
                                    </c:forEach>
                                </select>
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" name="supName" value="Delete Supplier" />
                            </form>
                             <form action="supAdd.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" value="Add New Supplier" />
                            </form> 
                        </td>
                        <td>
                            <form action="orderManage.jsp">
                                <select name="orderID">
                                    <c:forEach var="row" items="${orderDisplay.rows}">
                                        <option name="orderID" value="${row.orderID}">Order Number: ${row.orderID} By ${row.staff} ${row.userName}</option>
                                    </c:forEach>
                                </select>
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" name="manOrder" value="Manage Order" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>            
        </div>
      </div>
    </body>
</html>
