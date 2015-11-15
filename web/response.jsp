<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : response
    Created on : Nov 15, 2015, 1:52:19 PM
    Author     : Abby
--%>
<sql:query var="prodQuery" dataSource="jdbc/myData">
    SELECT * FROM product
    WHERE product.prodID = ? <sql:param value="${param.prodID}"/>
</sql:query>
    
<c:set var="prodDetails" value="${prodQuery.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${prodDetails.prodName}</title>
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">${prodDetails.prodName}</th>
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
            </tbody>
        </table>
    </body>
</html>
