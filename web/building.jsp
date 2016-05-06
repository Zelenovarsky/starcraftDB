<!DOCTYPE html>
<%@ page import="scTables.Race" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="static scTables.Race.connection" %>
<%@ page import="scTables.Building" %>
<% Class.forName("oracle.jdbc.OracleDriver"); %>
<% try {
    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "raynor", "starcraft");
} catch (SQLException e) {
    System.out.println("failed");
    e.printStackTrace();

}
//    Race r =new Race();
    ResultSet res = Building.readTableBuilding(connection);

%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>StarCraft Database</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Description" lang="en" content="ADD SITE DESCRIPTION">
    <meta name="author" content="ADD AUTHOR INFORMATION">
    <meta name="robots" content="index, follow">
    <!-- Override CSS file - add your own CSS rules -->
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <div class="header">
        <h1 class="header-heading">StarCraft Database</h1>
    </div>
    <div class="nav-bar">
        <ul class="nav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="race.jsp">race</a></li>
            <li><a href="unit.jsp">Unit</a></li>
            <li><a href="building.jsp">Building</a></li>

        </ul>
    </div>
    <div class="content">
        <h3>List of buildings</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>id</th>
                <th>building name</th>
            </tr>
            </thead>
            <tbody>
            <% while(res.next()){ %>
            <tr>
                <td><%= res.getInt(1) %></td>
                <td><%= res.getString(2) %></td>
            </tr>
            <% }%>
            </tbody>
        </table>


    </div>
    <%--</div>--%>
</body>
<div class="footer">
    &copy; Copyright 2016
</div>
</div>
</html>