<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : prodEdit
    Created on : Nov 15, 2015, 1:49:45 PM
    Author     : Abby & Patrick
--%>
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user, product
    WHERE userEmail = ? <sql:param value="${param.userEmail}"/> AND prodID = ? <sql:param value="${param.prodID}"/>
</sql:query>
<c:set var="Details" value="${userQuery.rows[0]}"/>

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
                <form class="form-signin" action="prodEdit" method="post">
                  <h2 class="form-signin-heading">Edit ${Details.prodName}</h2>
                  <p>Product Name</p><input type="text" id="inputName" class="form-control" placeholder="${Details.prodName}" name="prodName" required autofocus>
                  <p>Supplier ID</p><input type="text" id="inputsup" class="form-control" placeholder="${Details.supID}" name="supID" required autofocus>
                  <p>Product Description</p><textarea id="inputDesc" name="prodDesc" rows="2" cols="142">${Details.prodDesc}</textarea>
                  <br>
                  <p>Active</p>
                  <select name="active">
                      <option>1</option>
                      <option>0</option>
                  </select>
                  </br>
                  <p>Price</p>
                  <input type="text" id="inputPrice" class="form-control" placeholder="${Details.prodPrice}" name="prodPrice" required>
                  </div>
                    <div class="hidden">
                        <input type="text" name="userEmail" value="${Details.userEmail}" />
                        <input type="text" name="prodID" value="${Details.prodID}" />
                        <input type="text" name="prodQuant" value="${Details.prodQuant}" />
                    </div>
                  <button class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">Submit</button>
                </form>
            </div> <!-- /jumbotron -->
            </div> <!-- /container -->
            
            
    </body>
</html>
