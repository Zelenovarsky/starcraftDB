<!DOCTYPE html>
<%@ page import="scTables.Race" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="static scTables.Race.connection" %>
<%@ page import="scTables.Unit" %>
<% Class.forName("oracle.jdbc.OracleDriver"); %>
<% try {
    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "raynor", "starcraft");
} catch (SQLException e) {
    System.out.println("failed");
    e.printStackTrace();

}
//    Race r =new Race();
   ResultSet res = Unit.readTableUnit(connection);

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
        <h3>List of races</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>gas</th>
                <th>minerals</th>
                <th>health</th>
                <th>mana</th>
                <th>building_id</th>
                <th>race_id</th>
                <th>actions</th>
            </tr>
            </thead>
            <tbody>
            <% while(res.next()){ %>
            <tr>
                <td><%= res.getInt(1) %></td>
                <td><%= res.getString(2) %></td>
                <td><%= res.getInt(3) %></td>
                <td><%= res.getInt(4) %></td>
                <td><%= res.getInt(5) %></td>
                <td><%= res.getInt(6) %></td>
                <td><%= res.getInt(7) %></td>
                <td><%= res.getInt(8) %></td>
                <td><a href="editUnit.jsp?id=<%=res.getInt(1)%>">Edit</a></td>


            </tr>
            <% }%>
            </tbody>
        </table>
        <form name="addForm" action="addUnit.jsp" method="POST">
            <input type="submit" value="Add Unit" name="addUnit" />
        </form>

    </div>
    <%--<form name="addForm" action="addUnit.jsp" method="POST">--%>
        <%--<input type="submit" value="Add Unit" name="addUnit" />--%>
    <%--</form>--%>
    <%--</div>--%>
</body>
<div class="footer">
    &copy; Copyright 2016
</div>
</div>
</html>