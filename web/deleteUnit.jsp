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
        int unit_id = Integer.parseInt(request.getParameter("id"));
        Unit.deleteUnit(connection,unit_id);
        out.println("<p> The record is successfully deleted. </p>");
        out.println("<br>");
        out.println("<a href='unit.jsp'> RETURN TO UNIT PAGE </a>");
    }catch(NumberFormatException ex){


        System.out.println("Error occured with during conversion");
    }

%>
