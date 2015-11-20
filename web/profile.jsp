<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : profile
    Created on : Nov 15, 2015, 9:18:25 PM
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>${userDetails.userName}'s Profile</title>
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
            <thead>
                <tr>
                    <th><h3>${userDetails.userName}'s Profile</h3></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>User ID:</strong>${userDetails.userID}</td>
                </tr>
                <tr>
                    <td><strong>User Name:</strong>${userDetails.userName}</td>
                </tr>
                <tr>
                    <td><strong>User Email:</strong>${userDetails.userEmail}</td>
                </tr>
                <tr>
                    <td><strong>User Address:</strong>${userDetails.userAddr}</td>
                </tr>
                <tr>
                    <td><strong>Member Status:</strong>
                        <c:choose>
                            <c:when test="${userDetails.staff == 'Staff'}">
                            Active Staff Member
                            </c:when>
                            <c:when test="${userDetails.staff == 'Customer'}">
                            Active Store Member
                            </c:when>
                        </c:choose>
                        
                    </td>
                </tr>
                <c:if test="!${userDetails.staff}">
                    <tr>
                        <td><strong>User OrderID:</strong>${userDetails.orderID}</td>
                    </tr>
                </c:if>
                <tr>
                    <td><strong>User Options:</strong>
                        <form action="returnStore">
                            <input type="submit" value="Return to the Store" />
                            <div class="hidden">
                                <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                            </div>
                        </form>
                            <c:choose>
                                <c:when test="${userDetails.staff == 'Staff'}">
                                    <form action="manageInfo">
                                        <input type="submit" value="Manage" />
                                        <div class="hidden">
                                            <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                        </div>
                                    </form>
                                    
                                </c:when>
                                <c:when test="${userDetails.staff == 'Customer'}">
                                    <form action="cartServlet">
                                        <input type="submit" value="View Order" />
                                        <div class="hidden">
                                            <input type="text" name="userEmail" value="${userDetails.userEmail}" />
                                        </div>
                                    </form>
                                </c:when>
                            </c:choose>
                    </td>
                    
                </tr>

            </tbody>
        </table>
      </div> <!--/container-->
      </div> <!--/jumbotron-->
                



    </body>
</html>
