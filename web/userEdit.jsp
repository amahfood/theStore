<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : userEdit
    Created on : Nov 15, 2015, 1:49:45 PM
    Author     : Abby & Patrick
--%>
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE userEmail = ? <sql:param value="${param.userEmail}"/> OR userID = ? <sql:param value="${param.userID}"/>
    ORDER BY staff
</sql:query>
<c:set var="Details" value="${userQuery.rows[1]}"/>
<c:set var="userDetails" value="${userQuery.rows[0]}"/>

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
                        <input type="text" name="userEmail" value="${Details.userEmail}" />
                    </div>
              </form>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <form action="profileInfo">
                <input type="submit" value="${Details.userName}'s Profile" />
                <div class="hidden">
                    <input type="text" name="userEmail" value="${Details.userEmail}" />
                </div>
            </form>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

            <div class="container">
                <div class="jumbotron">
                <form class="form-signin" action="userEdit" method="post">
                  <h2 class="form-signin-heading">Edit ${userDetails.userName}'s Account</h2>
                  <p>User ID ${userDetails.userID}</p>
                  <p>Order ID ${userDetails.orderID}</p>
                  <p>User Name</p><input type="text" id="inputName" class="form-control" placeholder="${userDetails.userName}" name="userName" required autofocus>
                  <p>User Email</p><input type="text" id="inputsup" class="form-control" placeholder="${userDetails.userEmail}" name="editEmail" required autofocus>
                  <p>User Password</p><input type="text" id="inputsup" class="form-control" placeholder="${userDetails.userPass}" name="userPass" required autofocus>
                  <p>User Address</p><input type="text" id="inputsup" class="form-control" placeholder="${userDetails.userAddr}" name="userAddr" required autofocus>
                  <p>User Status <select name="staff">
                          <option>Customer</option>
                          <option>Staff</option>
                      </select></p>
                  </div>
                    <div class="hidden">
                        <input type="text" name="userEmail" value="${Details.userEmail}" />
                        <input type="text" name="userID" value="${userDetails.userID}" />
                    </div>
                  <button class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">Submit</button>
                </form>
            </div> <!-- /jumbotron -->
            </div> <!-- /container -->
            
            
    </body>
</html>
