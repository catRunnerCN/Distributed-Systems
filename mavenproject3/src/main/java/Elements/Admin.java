/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Elements;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Tian
 */
public class Admin {
    private String account;
    private String password;

    public Admin() {
        super();
    }

    public Admin(String account, String password) {
        super();
        this.account = account;
        this.password = password;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean judge(String account, String password) throws Exception {
        boolean f = false;
        Connection conn = DBUtil.getLocalConnection();
        String sql = "select * from admin where account=? and password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, account);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) f = true;
        else f = false;    
        DBUtil.free(rs, pstmt, conn);
        return f;
    }
    
}
