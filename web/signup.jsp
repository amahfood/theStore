<%-- 
    Document   : signup
    Created on : Nov 15, 2015, 9:12:10 PM
    Author     : Abby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up!</title>
    </head>
    <body>


        <form action="profile.jsp">
                    <table border="1">
            <thead>
                <tr>
                    <th>Sign Up Form</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="Name" value="Name" /></td>
                </tr>
                <tr>
                    <td><input type="text" name="Email" value="Email" /></td>
                </tr>
                <tr>
                    <td><input type="text" name="Address" value="Address" /></td>
                </tr>
                <tr>
                    <td><input type="text" name="Password" value="Password" /></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="Are You Staff?" value="ON" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </tbody>
        </table>
        </form>
    </body>
</html>
