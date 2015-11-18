<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : response
    Created on : Nov 15, 2015, 1:52:19 PM
    Author     : Abby & Patrick
--%>
<sql:query var="prodQuery" dataSource="jdbc/mudkip">
    SELECT * FROM product
    WHERE product.prodID = ? <sql:param value="${param.prodID}"/>
</sql:query>

<c:set var="prodDetails" value="${prodQuery.rows[0]}"/>

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
        <title>${prodDetails.prodName}</title>
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
                <li class="active"><a href="index.jsp">Home</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="signup.jsp">Signup</a></li>
    <!--            <li class="active"><a href="./">Static top <span class="sr-only">(current)</span></a></li>-->
                <li><a href="login.jsp">Login</a></li>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </nav>
           
          <div class="container">
              <div class="jumbotron">
                <table border="0">
                  <thead>
                      <tr>
                          <th colspan="2"><h3>${prodDetails.prodName}</h3></th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td><strong>Product ID: </strong> ${prodDetails.prodID}</td>
                      </tr>

                      <tr>
                          <td><strong>Description: </strong>${prodDetails.prodDesc}</td>
                      </tr>

                      <tr>
                          <td><strong>Stock: </strong>${prodDetails.prodQuant}</td>
                      </tr>

                      <tr>
                          <td><strong>Price: </strong>$ ${prodDetails.prodPrice}</td>
                      </tr>

                      <tr>
                          <td>
                              <form action="cart.jsp">
                                  <select name="Quantity">
                                      <option>1</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                      <option>5</option>
                                  </select>
                                  <input type="submit" value="Add to Cart" />
                              </form>
                          </td>
                      </tr>

                      <tr>
                          <td>
                              <form action="index.jsp">
                                  <input type="submit" value="Return to Store" />
                              </form>
                          </td>
                      </tr>
                  </tbody>
          </table>
              </div><!-- /jumbotron -->
          </div> <!-- /container -->
            
        

    </body>
</html>
