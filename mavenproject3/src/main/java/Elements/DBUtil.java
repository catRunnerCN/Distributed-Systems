package Elements;

/**
 *
 * @author muzum
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Functionalities.BookOperation;

public class DBUtil {
//    private String dbDriver = "com.mysql.cj.jdbc.Driver";
    public static Connection getConnection(String dbDriver, String dbURL, String username, String password) {
        Connection connection = null;

        try {
            //System.out.println("OK first");
            Class.forName(dbDriver).newInstance();
            //System.out.println("OK here");
            connection = DriverManager.getConnection(dbURL, username, password);
            return connection;
        } catch (Exception e) {
            System.out.println("Database cannot be connected!");
            e.printStackTrace();
        }
        return null;
    }

    /**Connect to local database and return the conenction.
     * @return Database conenction; If the database cannot be connected, return null.
     */
    public static Connection getLocalConnection() throws ClassNotFoundException, SQLException {
        Connection connection2 = null;
        
        //Modify the following code for your own MySql database.
        String databaseAddress = "jdbc:mysql://localhost:3306/authentication?useSSL=false";
//        String databaseAddress = "jdbc:mysql://localhost:3306/library_db?useSSL=false";
        String databaseUsername = "root";
        String databasePassword = "020905";

        Class.forName("com.mysql.cj.jdbc.Driver");
        connection2 = DriverManager.getConnection(databaseAddress, databaseUsername, databasePassword);

        System.out.println("Database connected.");
        return connection2;
    }

    public static void close(Connection c) {
        if (c != null) {
            try {
                c.close();
                System.out.println("Database connection closed.");
            } catch (Exception e) {
                /* ignore close errors */
                System.err.println("Database cannot be closed!");
                e.printStackTrace();
            }
        }
    }

    public static List<String> getColumnNames(ResultSetMetaData rsmd) {

        try {
            int colNum = rsmd.getColumnCount();
            List<String> colNames = new ArrayList<>();

            for (int i = 1; i <= colNum; i++) {
                colNames.add(rsmd.getColumnName(i));
            }

            return colNames;
        } catch (SQLException e) {
            System.err.println("Error in retrieving column names.");
            e.printStackTrace();
        }

        return null;
    }

    public static List<List> getResult(ResultSet rset) {

        List<List> result = new ArrayList<List>();
        List<String> row;

        try {
            int colNum = rset.getMetaData().getColumnCount();
            while (rset.next()) {
                row = new ArrayList<>();

                for (int i = 1; i <= colNum; i++) {
                    row.add(rset.getString(i));
                }

                result.add(row);
            }
            return result;
        } catch (SQLException e) {
            System.err.println("Error in retrieving data.");
            e.printStackTrace();
        }

        return null;
    }

    public static List<List> getFilteredResult(ResultSet rset, int col, String filterValue) {

        List<List> result = new ArrayList<>();
        List<String> row;

        try {
            int colNum = rset.getMetaData().getColumnCount();
            while (rset.next()) {

                //If the value of this colums equals to the filter string, ignore this row.
                if (rset.getString(col).equals(filterValue)) {
                    continue;
                }

                row = new ArrayList<>();
                for (int i = 1; i <= colNum; i++) {
                    row.add(rset.getString(i));
                }

                result.add(row);
            }
            return result;
        } catch (SQLException e) {
            System.err.println("Error in retrieving data.");
            e.printStackTrace();
        }

        return null;
    }
    
    public static void free(ResultSet rs,PreparedStatement pst,Connection conn) throws Exception {
            if(rs!=null) {
                rs.close();
            }
            if(pst!=null) {
                pst.close();
            }
            if(conn!=null) {
                conn.close();
            }
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException, Exception {
        Connection c = getLocalConnection();
        String query = "Select bookname from book;";
        Statement statement = c.createStatement();

        ResultSet resultSet = statement.executeQuery(query);
        List<List> result = DBUtil.getResult(resultSet);
        System.out.println("Pre " + result);
        BookOperation op = new BookOperation();
        Book book = new Book("123", "Test", "lixiao", 12.12, "dasdas", 1);
//        op.insertBook(book);
//        System.out.println(op.getBookId("Test"));
//        System.out.println(op.borrowBook(book.getBid()));
//        System.out.println(op.returnBook(book.getBid()));
//        System.out.println(op.deleteBook("Test"));
        resultSet = statement.executeQuery(query);
        result = DBUtil.getResult(resultSet);
        System.out.println("After " + result);
    }
}
