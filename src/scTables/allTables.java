package scTables;

import java.sql.*;

/**
 * Created by zelen on 3/29/2016.
 */
public class AllTables {
    public static Connection connection;
    public static ResultSet resultSet = null;
    public static Statement statement = null;

    public static ResultSet showAll(Connection connection) throws SQLException {
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select u.Unit_name,r.race_name,b.Building_name,u.health, u.mana,u.gas,u.MINERALS from Building b, race r, Unit u where b.Building_id = u.building_id and r.race_id = u.race_id ");
        return resultSet;
    }

    public static void main(String[] args) {
        try {
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "raynor", "starcraft");
        } catch (SQLException e) {
            System.out.println("failed");
            e.printStackTrace();

        }
        try {
            ResultSet res = AllTables.showAll(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
