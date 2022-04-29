package bestSeller;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;

public class BestSellerDAO {
    private Connection con;
    private Statement stmt;
    private ResultSet rs;

    private static final String DRIVER="com.mysql.jdbc.Driver";
    private static final String URL="jdbc:mysql://localhost:3306/web_programming?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
    private static final String USER="root";
    private static final String PW="1234";

    public BestSellerDAO() {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<BestSeller> getBestSellers() {
        ArrayList<BestSeller> list = new ArrayList<>();
        String sql = "select * from bestsellers";
        try {
            con= DriverManager.getConnection(URL, USER, PW);
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);

            while(rs.next()) {
                BestSeller bestSeller = new BestSeller();
                bestSeller.setBestSellerId(rs.getInt("id"));
                bestSeller.setBestSellerName(rs.getString("name"));
                //bestSeller.setBestSellerReleasedDate(rs.getTimestamp("released_date"));
                bestSeller.setBestSellerDollar(rs.getDouble("dollar"));
                list.add(bestSeller);
            }
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
