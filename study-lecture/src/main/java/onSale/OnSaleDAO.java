package onSale;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;

public class OnSaleDAO {
    private Connection con;
    private Statement stmt;
    private ResultSet rs;

    private static final String DRIVER="com.mysql.jdbc.Driver";
    private static final String URL="jdbc:mysql://localhost:3306/web_programming?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
    private static final String USER="root";
    private static final String PW="1234";

    public OnSaleDAO() {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<OnSale> getOnSale() {
        ArrayList<OnSale> list = new ArrayList<>();
        String sql = "select * from onsale";
        try {
            con= DriverManager.getConnection(URL, USER, PW);
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);

            while(rs.next()) {
                OnSale onSale = new OnSale();
                onSale.setOnSaleId(rs.getInt("id"));
                onSale.setOnSaleName(rs.getString("name"));
                onSale.setOnSaleReleaseDate(rs.getTimestamp("release_date"));
                onSale.setOnSaleImageURL(rs.getString("image"));
                onSale.setOnSaleSale(rs.getFloat("sale"));
                onSale.setOnSalePrice(0, rs.getDouble("us_price"));
                onSale.setOnSalePrice(1, rs.getDouble("kor_price"));
                onSale.setOnSalePrice(2, rs.getDouble("jap_price"));
                onSale.setOnSalePrice(3, rs.getDouble("uk_price"));
                list.add(onSale);
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
