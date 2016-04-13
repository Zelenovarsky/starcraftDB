package scTables;

import java.sql.*;

/**
 * Created by zelen on 3/29/2016.
 */
public class Unit {
    public static Connection connection;
    public static CallableStatement createStatement = null;
    public static ResultSet resultSet = null;
    public static Statement statement = null;



    static ResultSet readTableUnit() throws SQLException {
        PreparedStatement ps = connection.prepareStatement("select* from unit");
        resultSet=ps.executeQuery();
        return resultSet;
    }

    static void insertUnit(int unit_id,String unit_name, int gas, int minerals,int health, int mana,int building_id, int race_id) throws SQLException {
        createStatement = connection.prepareCall("{call insertBuilding(?,?,?,?,?,?,?,?)}");
        createStatement.setInt(1,unit_id);
        createStatement.setString(2,unit_name);
        createStatement.setInt(3,gas);
        createStatement.setInt(4,minerals);
        createStatement.setInt(5,health);
        createStatement.setInt(6,mana);
        createStatement.setInt(7,building_id);
        createStatement.setInt(8,race_id);

        createStatement.execute();
    }

    static void updateTableUnit(int unit_id_for_update, int new_gas, int new_minerals, int new_health, int new_mana) throws SQLException {
        createStatement = connection.prepareCall("{call updateTableUnit(?,?,?,?,?)}");
        createStatement.setInt(1, unit_id_for_update);
        createStatement.setInt(2, new_gas);
        createStatement.setInt(3, new_minerals);
        createStatement.setInt(4, new_health);
        createStatement.setInt(5, new_mana);
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
