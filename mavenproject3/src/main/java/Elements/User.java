package Elements;
 
import Functionalities.UserOperation;
import java.sql.*;
/**
 *
 * @author muzum
 */
public class User {
    private String id;
    private String user_name;
    private String sex;
    private String major;
    private String account;
    private String password;
    private int numberOfBorrow;
    
    public User(String id, String user_name, String sex, String major, String account, String password, int number){
        this.id = id;
        this.user_name = user_name;
        this.sex = sex;
        this.major = major;
        this.account = account;
        this.password = password;
        this.numberOfBorrow = number;
    }
    
    public User(String id, String user_name, String sex, String major, String account, String password){
        this.id = id;
        this.user_name = user_name;
        this.sex = sex;
        this.major = major;
        this.account = account;
        this.password = password;
        this.numberOfBorrow = 0;
    }
    
    public User(){
    }
    
    public int getNumberOfBorrow() throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select count(*) from borrow where id = ? and state = ?";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, id);
        st.setInt(2, 0);
        ResultSet rs = st.executeQuery();
        if(rs.next()) return rs.getInt(1);
        return -1;
    }
    
    public void borrowOne(){
        ++numberOfBorrow;
    }
    
    public void returnOne(){
        // TODO: add exception assert(--numberOfBorrow >= 0)
        --numberOfBorrow;
    }

    public String getSid() {
        return id;
    }

    public String getName() {
        return user_name;
    }

    public String getSex() {
        return sex;
    }

    public String getMajor() {
        return major;
    }

    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }

    public void setSid(String id) {
        this.id = id;
    }

    public void setName(String user_name) {
        this.user_name = user_name;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    // 0: does not exist
    // -1: incorrect password
    // 1: correct
    public static int exist(String account, String password) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        if(!UserOperation.existAccount(account)) return 0;
        String sql = "select password from user_info where account = ?";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, account);
        ResultSet rs = st.executeQuery();
        rs.next(); 
        return rs.getString("password").equals(password) ? 1 : -1;
    }
    
    public static String getSidFromAccount(String account) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select id from user_info where account = ?";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, account);
        ResultSet rs = st.executeQuery();
        if(rs.next()) return rs.getString("id");
        return null;
    }
}
