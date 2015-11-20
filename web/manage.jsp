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
    
<sql:query var="staff" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE staff='Staff'
</sql:query>
    
<sql:query var="cust" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE staff='Customer'
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
            <table border="1">
                <thead>
                    <tr>
                        <th>Stock</th>
                        <th>Employees</th>
                        <th>Customers</th>
                        <th>Suppliers</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Select Product to Edit</td>
                        <td>Select an Employee to Edit</td>
                        <td>Select a Customer to Edit</td>
                        <td>Select a Supplier to Edit</td>
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
                        <td>
                            <form action="empManage">
                                <select name="prodID">
                                    <c:forEach var="row" items="${staff.rows}">
                                        <option name="staffID" value="${row.userID}">${row.userName} : ${row.userID}</option>
                                    </c:forEach>
                                </select>
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" name="userName" value="Manage Employee" />
                            </form>
                            <form action="staffAdd.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" value="Add New Staff Member" />
                            </form> 
                        </td>
                        <td>
                            <form action="custManage">
                                <select name="prodID">
                                    <c:forEach var="row" items="${cust.rows}">
                                        <option name="custID" value="${row.userID}">${row.userName} : ${row.userID}</option>
                                    </c:forEach>
                                </select>
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" name="userName" value="Manage Customer" />
                            </form>
                            <form action="custAdd.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" value="Add New Customer" />
                            </form> 
                        </td>
                        <td>
                            <form action="supManage">
                                <select name="supID">
                                    <c:forEach var="row" items="${sup.rows}">
                                        <option name="supID" value="${row.supID}">${row.supName} : ${row.supID}</option>
                                    </c:forEach>
                                </select>
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" name="supName" value="Manage Supplier" />
                            </form>
                             <form action="supAdd.jsp">
                                <div class="hidden">
                                    <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                </div>
                                <input type="submit" value="Add New Supplier" />
                            </form> 
                        </td>
                    </tr>
                </tbody>
            </table>            
        </div>
      </div>
    </body>
</html>
