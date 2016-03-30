<%@ page import="scTables.Race" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="static scTables.Race.connection" %>
<% Class.forName("oracle.jdbc.OracleDriver"); %><%--
  Created by IntelliJ IDEA.
  User: zelen
  Date: 3/30/2016
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select data from Race</title>
</head>
<body>
    <h1>Select data from race</h1>
    <% try {
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "raynor", "starcraft");
    } catch (SQLException e) {
        System.out.println("failed");
        e.printStackTrace();

    }
    String race_name;// = new String();
    Race r =new Race();
        race_name=request.getParameter("name");
    ResultSet res = r.find(race_name);
%>



    <table border="0">
        <body>
        <tr>
            <td>race_id:</td>
            <td>race_name:</td>
        </tr>
        <% while(res.next()){ %>
        <tr>
            <td><%= res.getInt(1) %></td>
            <td><%= res.getString(2) %></td>
        </tr>
        <% }%>
        </body>

</body>
</html>
