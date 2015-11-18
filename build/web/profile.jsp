<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : profile
    Created on : Nov 15, 2015, 9:18:25 PM
    Author     : Abby
--%>

<sql:query var="userQuery" dataSource="jdbc/mudkip">
    SELECT * FROM user
    WHERE user.userEmail = ? <sql:param value="${param.userEmail}"/>
    AND user.userPass = ? <sql:param value="${param.userPass}"/>
</sql:query>

<c:set var="userDetails" value="${userQuery.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${userDetails.userName}'s Profile</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>${userDetails.userName}'s Profile</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>User ID:</strong>${userDetails.userID}</td>
                </tr>
                <tr>
                    <td><strong>User Name:</strong>${userDetails.userName}</td>
                </tr>
                <tr>
                    <td><strong>User Email:</strong>${userDetails.userEmail}</td>
                </tr>
                <tr>
                    <td><strong>User Address:</strong>${userDetails.userAddr}</td>
                </tr>
                <tr>
                    <td><strong>Member Status:</strong>
                        <c:if test="${userDetails.staff}">
                            Active Staff Member
                        </c:if>
                        <c:if test="!${userDetails.staff}">
                            Active Store Member
                        </c:if>

                    </td>
                </tr>
                <c:if test="!${userDetails.staff}">
                    <tr>
                        <td><strong>User OrderID:</strong>${userDetails.orderID}</td>
                    </tr>
                </c:if>
                <tr>
                    <td><strong>User Options:</strong><form action="index.jsp">
                            <input type="submit" value="Return to the Store" />
                        </form>
                    
                    <c:if test="${userDetails.staff}" var="staff">
                            <form action="manage.jsp">
                                <input type="submit" value="Manage Stock" />
                            </form>
                        </td>
                    </c:if>
                    <c:if test="!${userDetails.staff}" var="staff">
                            <form action="cart.jsp">
                                <input type="submit" value="View Cart" />
                            </form>
                        </td>
                    </c:if>
                </tr>

            </tbody>
        </table>



    </body>
</html>
