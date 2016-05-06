/**
 * Created by zelen on 3/28/2016.
 */
import java.sql.*;
////
public class ConnectToDB {
    public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
    public static String username = "raynor";
    public static String password = "starcraft";
    public static Connection con;

    public static Connection getConnection() {
        try {
            con = DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }




}
