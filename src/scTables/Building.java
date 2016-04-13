package scTables;

import java.sql.*;

/**
 * Created by zelen on 3/29/2016.
 */
public class Building {
    public static Connection connection;
    public static CallableStatement createStatement = null;
    public static ResultSet resultSet = null;
    public static Statement statement = null;



    static ResultSet readTableBuilding() throws SQLException {
        PreparedStatement ps = connection.prepareStatement("select* from building");
        resultSet=ps.executeQuery();
        return resultSet;
    }

    static void insertBuilding(int building_id,String building_name, int gas, int minerals, int race_id) throws SQLException {
        createStatement = connection.prepareCall("{call insertBuilding(?,?,?,?,?)}");
        createStatement.setInt(1,building_id);
        createStatement.setString(2,building_name);
        createStatement.setInt(3,gas);
        createStatement.setInt(4,minerals);
        createStatement.setInt(5,race_id);
        createStatement.execute();
    }

    static void updateTableBuilding(int building_id_for_update, int new_gas, int new_minerals) throws SQLException {
        createStatement = connection.prepareCall("{call updateTableBuilding(?,?,?)}");
        createStatement.setInt(1, building_id_for_update);
        createStatement.setInt(2, new_gas);
        createStatement.setInt(3, new_minerals);
        createStatement.execute();
    }

    static ResultSet deleteFromBuilding(int building_id) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("delete from building where building_id=?");
        ps.setInt(1,building_id);
        resultSet=ps.executeQuery();
        return resultSet;
    }

    public static ResultSet find(String building_name) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("select* from building where building_name=?");
        ps.setString(1,building_name);
        resultSet=ps.executeQuery();
        return resultSet;
    }

}
