/**
 * Created by zelen on 3/28/2016.
 */
import java.sql.*;
////
public class ConnectToDB {
    private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String username = "raynor";
    private static final String password = "starcraft";
    private static Connection con;

    public static Connection getConnection() {
        try {
            con = DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }




}
