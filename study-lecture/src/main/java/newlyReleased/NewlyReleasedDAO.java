package newlyReleased;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;

public class NewlyReleasedDAO {
    private Connection con;
    private Statement stmt;
    private ResultSet rs;

    private static final String DRIVER="com.mysql.jdbc.Driver";
    private static final String URL="jdbc:mysql://localhost:3306/web_programming?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
    private static final String USER="root";
    private static final String PW="1234";

    public NewlyReleasedDAO() {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<NewlyReleased> getNewlyReleased() {
        ArrayList<NewlyReleased> list = new ArrayList<>();
        String sql = "select * from newlyreleased";
        try {
            con= DriverManager.getConnection(URL, USER, PW);
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);

            while(rs.next()) {
                NewlyReleased newlyReleased = new NewlyReleased();
                newlyReleased.setNewlyReleasedId(rs.getInt("id"));
                newlyReleased.setNewlyReleasedName(rs.getString("name"));
                newlyReleased.setNewlyReleasedReleaseDate(rs.getTimestamp("release_date"));
                newlyReleased.setNewlyReleasedImageURL(rs.getString("image"));
                newlyReleased.setNewlyReleasedPrice(0, rs.getDouble("us_price"));
                newlyReleased.setNewlyReleasedPrice(1, rs.getDouble("kor_price"));
                newlyReleased.setNewlyReleasedPrice(2, rs.getDouble("jap_price"));
                newlyReleased.setNewlyReleasedPrice(3, rs.getDouble("uk_price"));
                list.add(newlyReleased);
            }
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void close(Connection con, Statement stmt, ResultSet rs) {
        if(rs!=null) {
            try {
                rs.close();
            } catch(SQLException e) {

            }
        }

        if(stmt!=null) {
            try {
                stmt.close();
            } catch(SQLException e) {

            }
        }

        if(con!=null) {
            try {
                con.close();
            } catch(SQLException e) {

            }
        }
    }
}
