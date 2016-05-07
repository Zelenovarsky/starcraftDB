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
        int unit_id_for_update = Integer.parseInt(request.getParameter("id"));
        int new_gas = Integer.parseInt(request.getParameter("gas"));
        int new_minerals = Integer.parseInt(request.getParameter("minerals"));
        int new_health = Integer.parseInt(request.getParameter("health"));
        int new_mana = Integer.parseInt(request.getParameter("mana"));
        Unit.updateTableUnit(connection,unit_id_for_update,new_gas,new_minerals,new_health,new_mana);
    }catch(NumberFormatException ex){


        System.out.println("Error occured with during conversion");
    }

    //Unit.updateTableUnit(unit_id_for_update,unit_name,gas,minerals,health,mana,building_id,race_id);
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
                <tr>
                    <td>unit id for update:</td>
                    <td><input type="number" name="id" value="<%=request.getParameter("id")%>" size="10"/></td>
                </tr>
                <tr>
                    <td>new gas:</td>
                    <td><input type="number" name="id" value="" size="10"/></td>
                </tr>
                <tr>
                    <td>new minerals:</td>
                    <td><input type="number" name="id" value="" size="10"/></td>
                </tr>
                <tr>
                    <td>new health:</td>
                    <td><input type="number" name="id" value="" size="10"/></td>
                </tr>
                <tr>
                    <td>new mana:</td>
                    <td><input type="number" name="id" value="" size="10"/></td>
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