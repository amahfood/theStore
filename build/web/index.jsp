<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Nov 15, 2015, 1:49:45 PM
    Author     : Abby
--%>

<sql:query var="product" dataSource="jdbc/mudkip">
    SELECT prodID, prodName FROM product
    WHERE product.active  = '1'
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store</title>
    </head>
    <body>
        <h2>Welcome to the Store!</h2>
        <form action="login.jsp">
            <input type="submit" value="Login" />
        </form>
        <form action="signup.jsp">
            <input type="submit" value="Signup" />
        </form>
        <table border="0">
            <thead>
                <tr>
                    <th>The Store provides many products.</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view a product, select it below:</td>
                </tr>
                <tr>
                    <td>
                        <form action="response.jsp">
                            <strong>Select a product:</strong>
                            <select name="prodID">
                                <c:forEach var="row" items="${product.rows}">
                                    <option value="${row.prodID}">${row.prodName}</option>
                                </c:forEach>
                            </select>
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
