<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Nov 15, 2015, 1:49:45 PM
    Author     : Abby & Patrick
--%>
<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user, product
    WHERE user.userEmail = ? <sql:param value="${param.userEmail}"/> AND product.prodID = ? <sql:param value="${param.prodID}"/>
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
                <form class="form-signin" action="storeServlet" method="post">
                  <h2 class="form-signin-heading">Add New Product</h2>
                  <label for="inputName" class="sr-only">Product Name</label>
                  <input type="text" id="inputName" class="form-control" placeholder="Name" name="prodName" required autofocus>
                  <label for="inputsup" class="sr-only">Supplier ID</label>
                  <input type="text" id="inputsup" class="form-control" placeholder="Supplier ID" name="supID" required autofocus>
                  <label for="inputDesc" class="sr-only">Product Description</label>
                  <textarea id="inputDesc" name="prodDesc" rows="2" cols="142">Product Description</textarea>
                  <br><label for="inputActive" class="sr-only">Active</label>
                  <label for="inputPrice" class="sr-only">Price</label>
                  <input type="text" id="inputPrice" class="form-control" placeholder="Product Price" name="prodPrice" required>
                  <label for="prodQuant" class="sr-only">Quantity</label>
                  <input type="text" id="inputQuant" class="form-control" placeholder="Product Quantity" name="prodQuant" required>
                  </div>
                  <button class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">Submit</button>
                </form>
            </div> <!-- /jumbotron -->
            </div> <!-- /container -->
            
            
    </body>
</html>
