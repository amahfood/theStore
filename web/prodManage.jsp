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

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
 <h2>Management</h2>
            <table border="1">
                <thead>
                    <tr>
                        <h3>${Details.prodName} Details</h3>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>Product ID</strong></td>
                        <td><strong>Product Name</strong></td>
                        <td><strong>Product Supplier ID</strong></td>
                        <td><strong>Product Description</strong></td>
                        <td><strong>Product Activity</strong></td>
                        <td><strong>Product Price</strong></td>
                        <td><strong>Product Stock</strong></td>
                    </tr>
                    <tr>
                        <td>${Details.prodID}</td>
                        <td>${Details.prodName}</td>
                        <td>${Details.supID}</td>
                        <td>${Details.prodDesc}</td>
                        <td>${Details.active}</td>
                        <td>${Details.prodPrice}</td>
                        <td>${Details.prodQuant}</td>
                    </tr>
                </tbody>
            </table>   
             <form action="prodAdd.jsp">
                <input type="submit" value="Add New Product" />
                <div class="hidden">
                    <input type="text" name="userEmail" value="${Details.userEmail}" />
                    <input type="text" name="prodID" value="${Details.prodID}" />
                </div>
             </form>
            <form action="prodDel">
                <input type="submit" value="Delete ${Details.prodName}" />
                    <div class="hidden">
                        <input type="text" name="userEmail" value="${Details.userEmail}" />
                        <input type="text" name="prodID" value="${Details.prodID}" />
                    </div>
            </form> 
            <form action="prodEdit">
                <input type="submit" value="Edit ${Details.prodName}" />
                <div class="hidden">
                    <input type="text" name="userEmail" value="${Details.userEmail}" />
                    <input type="text" name="prodID" value="${Details.prodID}" />
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

