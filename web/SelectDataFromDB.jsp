<%--
  Created by IntelliJ IDEA.
  User: zelen
  Date: 3/30/2016
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select data from a db</title>
</head>
<body>
<h1>Select data from a db</h1>
<form name="displayForm" action="display.jsp" method="POST">
    <table>
        <tbody>
        <tr>
            <td>race_id:</td>
            <td><input type="number" name="id" value="" size="10"/></td>
        </tr>
        <tr>
            <td>race_name:</td>
            <td><input type="text" name="name" value="" size="50"/></td>
        </tr>
        </tbody>
    </table>
    <input type="reset" value="Clear" name="clear" />
    <input type="submit" value="Submit" name="submit" />
</form>

</body>
</html>
