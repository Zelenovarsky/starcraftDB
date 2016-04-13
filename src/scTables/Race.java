package scTables;

/**
 * Created by zelen on 3/28/2016.
 */

import java.sql.SQLException;
import java.sql.*;

/**
 * Created by zelen on 3/26/2016.
 */
public class Race {

    public static Connection connection;
    public static CallableStatement createStatement = null;
    public static ResultSet resultSet = null;
    public static Statement statement = null;



    static ResultSet readTableRace() throws SQLException {
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select * from race ");
        return resultSet;
    }

    static void clean(String name) throws SQLException {
        createStatement = connection.prepareCall("{call cleanRace(?);}");
        createStatement.setString(1, name);
        createStatement.execute();
    }

    static void insertRace(int race_id,String race_name) throws SQLException {
        createStatement = connection.prepareCall("{call insertRace(?,?)}");
        createStatement.setInt(1,race_id);
        createStatement.setString(2,race_name);
        createStatement.execute();
    }

    static void updateTableRace(int race_id,String race_name) throws SQLException {
        createStatement = connection.prepareCall("{call updateTableRace(?,?)}");
        createStatement.setInt(1, race_id);
        createStatement.setString(2, race_name);
        createStatement.execute();
    }

    static void deleteFromRace(int race_id) throws SQLException {
        createStatement = connection.prepareCall("{call deleteFromRace(?)}");
        createStatement.setInt(1, race_id);
        createStatement.execute();
    }

    public static ResultSet find(String race_name) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("select race_id, race_name from race where race_name=?");
        ps.setString(1,race_name);
        resultSet=ps.executeQuery();
        return resultSet;
    }

    public static void main(String[] args) throws SQLException{

//        Race.connection = connection;
//        try {
//            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "raynor", "starcraft");
//        } catch (SQLException e) {
//            System.out.println("failed");
//            e.printStackTrace();
//
//        }
        Race r=new Race();
        ResultSet res = r.find("Terran");
        while (res.next()){
            int race_id = res.getInt(1);
            String race_name = res.getString(2);
            System.out.println(race_name);
            System.out.println(race_id);
        }
    }
}
