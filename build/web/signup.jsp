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
                    <td><strong>Name:</strong><input type="text" name="userName"/></td>
                </tr>
                <tr>
                    <td><strong>Email:</strong><input type="text" name="userEmail" /></td>
                </tr>
                <tr>
                    <td><strong>Address:</strong><input type="text" name="userAddr" /></td>
                </tr>
                <tr>
                    <td><strong>Password:</strong><input type="text" name="userPass"/></td>
                </tr>
                <tr>
                    <td><strong>Are you a staff member?</strong><input type="checkbox" name="is_staff" value="ON" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </tbody>
        </table>
        </form>
    </body>
</html>
