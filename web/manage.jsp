<%-- 
    Document   : manage.jsp
    Created on : Nov 16, 2015, 9:01:02 AM
    Author     : Abby & Patrick
--%>

<sql:query var="product" dataSource="jdbc/mudkip">
    SELECT * FROM product
</sql:query>


<sql:query var="supQuery" dataSource="jdbc/mudkip">
    SELECT * FROM supplier
</sql:query>

<c:set var="supDetails" value="${supQuery.rows[0]}"/>

<sql:query var="OrderQuery" dataSource="jdbc/mudkip">
    SELECT * FROM Order
</sql:query>

<c:set var="orderDetails" value="${OrderQuery.rows[0]}"/>


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

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
          <h2>Stock</h2>
          <h5>Select Product to view</h5>
          <form>
                <strong>Select a product:</strong>
                    <select name="prodID">
                        <c:forEach var="row" items="${product.rows}">
                            <option value="${row.prodID}">${row.prodName} : ${row.prodID}</option>
                        </c:forEach>
                    </select>
           </form>
                <div value="${stockDetails.prodID}">
                    <br><strong>Product ID</strong>: ${stockDetails.prodID}</br>
                    <br><strong>Product Name</strong>: ${stockDetails.prodName}</br>
                    <br><strong>Product Supplier</strong>: ${stockDetails.supID}</br>
                    <br><strong>Product Description</strong>: ${stockDetails.prodDesc}</br>
                    <br><strong>Product Activity</strong>: ${stockDetails.active}</br>
                    <br><strong>Product Price</strong>: ${stockDetails.prodPrice}</br>
                    <br><strong>Product Availability</strong>: ${stockDetails.prodQuant}</br>
                    <br>---------------------------------------------------------------</br>
                </div>
        <h2>Suppliers</h2>
                <div value="${supDetails.supID}">
                    <br><strong>Supplier ID</strong>: ${stockDetails.supID}</br>
                    <br><strong>Supplier Name</strong>: ${stockDetails.supName}</br>
                    <br>---------------------------------------------------------------</br>
                </div>
        <h2>Orders</h2>
                <div value="${orderDetails.orderID}">
                    <br><strong>Order ID</strong>: ${orderDetails.orderID}</br>
                    <br><strong>Order Date</strong>: ${orderDetails.orderDate}</br>
                    <br><strong>Order Paid</strong>: ${orderDetails.orderPaid}</br>
                    <br>---------------------------------------------------------------</br>
                </div>
      </div>
      </div>
    </body>
</html>
