<%-- 
    Document   : signup
    Created on : Nov 15, 2015, 9:12:10 PM
    Author     : Abby & Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Create Account</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

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
                <form class="form-signin" action="storeServlet" method="post">
                  <h2 class="form-signin-heading">Sign Up For An Account</h2>
                  <label for="inputName" class="sr-only">Name</label>
                  <input type="text" id="inputName" class="form-control" placeholder="Name" name="userName" required autofocus>
                  <label for="inputEmail" class="sr-only">Email</label>
                  <input type="email" id="inputEmail" class="form-control" placeholder="Email" name="userEmail" required autofocus>
                  <label for="inputPassword" class="sr-only">Password</label>
                  <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="userPass" required>
                  <label for="inputAddr" class="sr-only">Address</label>
                  <input type="text" id="inputAddr" class="form-control" placeholder="Address" name="userAddr" required>
                  <select name="staff" id="inputstaff" class="form-control" name="staff" required>
                      <option>Staff</option>
                      <option>Customer</option>
                  </select>
                  </div>
                  <button class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">Submit</button>
                </form>
            </div> <!-- /jumbotron -->
            </div> <!-- /container -->
            
            
    </body>
</html>
