<%-- 
    Document   : login
    Created on : Nov 15, 2015, 9:10:45 PM
    Author     : Abby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
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
</html>
