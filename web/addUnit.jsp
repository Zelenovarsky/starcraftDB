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
    try {
        String unit_name = request.getParameter("name");
        int gas = Integer.parseInt(request.getParameter("gas"));
        int minerals = Integer.parseInt(request.getParameter("minerals"));
        int health = Integer.parseInt(request.getParameter("health"));
        int mana = Integer.parseInt(request.getParameter("mana"));
        int building_id = Integer.parseInt(request.getParameter("building_id"));
        int race_id = Integer.parseInt(request.getParameter("race_id"));
        try {
            Unit.insertUnit(connection, unit_name, gas, minerals, health, mana, building_id, race_id);
        }catch (SQLException ex){
            out.println("<p> The record cannot be added, check race and building id's </p>");
            out.println("<br>");
            out.println("<a href='unit.jsp'> RETURN TO UNIT PAGE </a>");
        }
    }catch(NumberFormatException ex) {


        System.out.println("Error occured with during conversion");

    }
//    Unit.insertUnit(connection,unit_name,gas,minerals,health,mana,building_id,race_id);
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

        <form name="displayForm" method="POST">
            <table border="0">
                <body>
                <%--<tr>--%>
                    <%--<td>unit_id:</td>--%>
                    <%--<td><input type="number" name="id" value="" size="10"/></td>--%>
                <%--</tr>--%>
                <tr>
                    <td>unit_name:</td>
                    <td><input type="text" name="name" value="enter name" size="50"/></td>
                </tr>
                <tr>
                    <td>gas:</td>
                    <td><input type="text" name="gas" value="0" size="10"/></td>
                </tr>
                <tr>
                    <td>minerals:</td>
                    <td><input type="number" name="minerals" value="0" size="10"/></td>
                </tr>
                <tr>
                    <td>health:</td>
                    <td><input type="number" name="health" value="0" size="10"/></td>
                </tr>
                <tr>
                    <td>mana:</td>
                    <td><input type="number" name="mana" value="0" size="10"/></td>
                </tr>
                <tr>
                    <td>building_id:</td>
                    <td><input type="number" name="building_id" value="0" size="10"/></td>
                </tr>
                <tr>
                    <td>race_id:</td>
                    <td><input type="number" name="race_id" value="0" size="10"/></td>
                </tr>
                </body>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>

    </div>
    <%--</div>--%>
</body>
<div class="footer">
    &copy; Copyright 2016
</div>
</div>
</html>