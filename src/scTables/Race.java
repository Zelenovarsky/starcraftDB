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

    static Connection connection;
    static CallableStatement createStatement = null;
    static ResultSet resultSet = null;
    static Statement statement = null;
//    public static void main(String[] args){
//
//    Connection connection = null;
//    try{
//    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","raynor","starcraft");
//    } catch  (SQLException e){
//    System.out.println("failed");
//            e.printStackTrace();
//    return;
//}
//}

//
//    TODO:
//    1) DB creation
//    2) DB deletion

    static ResultSet readTableRace() throws SQLException {
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select * from race ");
        return resultSet;
//        statement = connection.prepareStatement("select * from race");
//        resultSet = statement.executeQuery();
//        return resultSet;
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

    static ResultSet find(String race_name) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("select * from race where race_name=?");
        ps.setString(1,race_name);
        resultSet=ps.executeQuery();
        return resultSet;



//        statement = connection.createStatement();
//        resultSet = statement.executeQuery("select * from race where raceId=? ");
//
//        return resultSet;
    }

    public static void main(String[] args) throws SQLException{

        Race.connection = connection;
        try {
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "raynor", "starcraft");
        } catch (SQLException e) {
            System.out.println("failed");
            e.printStackTrace();

        }
        //StarCraftDB.insertRace(9, "asdasd");
//        System.out.print(StarCraftDB.readTableRace());
//        StarCraftDB.readTableRace();
//        while (resultSet.next()){
//            int race_id = resultSet.getInt(1);
//            String race_name = resultSet.getString(2);
//
//            System.out.println(race_id);
//
//        }
        Race.find("Terran");
        while (resultSet.next()){
            int race_id = resultSet.getInt(1);
            String race_name = resultSet.getString(2);
            System.out.println(race_name);
            System.out.println(race_id);
        }
    }
}
