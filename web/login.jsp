<%-- 
    Document   : login
    Created on : Nov 15, 2015, 9:10:45 PM
    Author     : Abby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="profile.jsp">
            <table border="1">
                <thead>
                    <tr>
                        <th>Please Login</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>User Email:</strong><input type="text" name="userEmail" value="" /></td>
                    </tr>
                    <tr>
                        <td><strong>User Password:</strong><input type="password" name="userPass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                    </tr>
                </tbody>
            </table>            
        </form>
    </body>
</html>-->


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login Page</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
      
    <div class="container">

    <form class="form-signin" action=""profile.jsp">
      <h2 class="form-signin-heading">Please sign in</h2>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="userEmail" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="userPass" required>
      <div class="checkbox">
<!--        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>-->
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit" value="Submit">Sign in</button>
    </form>

    </div> <!-- /container -->
    
<!--    <form action="profile.jsp">
        <table border="1">
            <thead>
                <tr>
                    <th>Please Login</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>User Email:</strong><input type="text" name="userEmail" value="" /></td>
                </tr>
                <tr>
                    <td><strong>User Password:</strong><input type="password" name="userPass" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </tbody>
        </table>            
    </form>-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
