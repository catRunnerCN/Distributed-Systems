package Functionalities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Elements.User;
import Elements.DBUtil;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import javax.crypto.Cipher;
import java.security.interfaces.RSAPublicKey;
/**
 *
 * @author Tian
 */
public class UserOperation {
    private static KeyPairGenerator keyGenerator;
    private static KeyPair keyPair;
    private static PrivateKey privateKey;
    private static PublicKey publicKey;
    private static final String ALGORITHM = "RSA"; //Rivest-Shamir-Adleman
    public static boolean initBefore = false;
    
    public static void initAsymmetricCryptoSystem() throws Exception{
        int keyLength = 2048;

        //We need to tell which alforithm to use (RSA fir this case).
        keyGenerator = KeyPairGenerator.getInstance(ALGORITHM);
        //keyGenerator = KeyPairGenerator.getInstance("DSA");
        keyGenerator.initialize(keyLength);

        keyPair = keyGenerator.generateKeyPair();
        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();
    }
    
    public static PublicKey getPublicKey() throws Exception{
        if(!initBefore){
            initBefore = true;
            initAsymmetricCryptoSystem();
        }
        return publicKey;
    }
    public static PrivateKey getPrivateKey() throws Exception{
        if(!initBefore){
            initBefore = true;
            initAsymmetricCryptoSystem();
        }
        return privateKey;
    }
    
    public static String getPublicKeyAsString() throws Exception{
        RSAPublicKey rsaPublicKey = (RSAPublicKey) getPublicKey();
        String encodedKey = Base64.getEncoder().encodeToString(rsaPublicKey.getEncoded());
        return "-----BEGIN PUBLIC KEY-----\n" + encodedKey + "\n-----END PUBLIC KEY-----";
   }
    public static String decrypt(String encryptedText) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decodedBytes = Base64.getDecoder().decode(encryptedText);
        byte[] decryptedBytes = cipher.doFinal(decodedBytes);
        return new String(decryptedBytes);
    }
    
    public static byte[] decrypt(PrivateKey key, byte[] cipherText) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);

        byte[] decryptedBytes = cipher.doFinal(cipherText);

        return decryptedBytes;
    }
    
    public static byte[] encrypt(PublicKey key, byte[] inputText)
            throws Exception {
        
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);

        byte[] encryptedBytes = cipher.doFinal(inputText);

        return encryptedBytes;
    }

    public static User getUser(String account) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select * from user_info where account = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, account);
        ResultSet rs = st.executeQuery();
        List<List> result = DBUtil.getResult(rs);
        var record = result.getFirst();
        return new User(record.get(0).toString(), record.get(1).toString(), record.get(2).toString(), record.get(3).toString(), record.get(4).toString(), record.get(5).toString(), Integer.parseInt(record.get(6).toString()));
    }
    public static String getSidFromAccount(String account)throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select id from user_info where account = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, account);
        ResultSet rs = st.executeQuery();
        if(rs.next()) return rs.getString(1);
        return null;
    }
    public static boolean existAccount(String account) throws Exception {
        Connection c = DBUtil.getLocalConnection();
        String sql = "select account from user_info where account = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, account);
        ResultSet rs = st.executeQuery();
        return rs.next();
    }
    public static boolean insert(User u) throws Exception {
        if(findOneUser(u.getAccount()) != null){
            return false;
        }
        Connection conn = DBUtil.getLocalConnection();
        String sql="insert into user_info(id,user_name,sex,major,account,password, numberOfBorrow) values(?,?,?,?,?,?,?);";
        PreparedStatement  pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, u.getSid());
//        pstmt.setString(1, Allocator.produceSid());
        pstmt.setString(2, u.getName());
        pstmt.setString(3, u.getSex());
        pstmt.setString(4, u.getMajor());
        
        if (u.getNumberOfBorrow() != 0)
            pstmt.setInt(7, u.getNumberOfBorrow());
        else
            pstmt.setInt(7, 0);
        
        pstmt.setString(5, u.getAccount());
        pstmt.setString(6, u.getPassword());
        pstmt.executeUpdate();
        DBUtil.free(null, pstmt, conn);
        
        return false;
    }

    public static boolean delete(String account) throws Exception {
        if(!existAccount(account)) return false;
        Connection conn = null;
        PreparedStatement  pstmt = null;
        String sql="delete from user_info where account=?";
        conn = DBUtil.getLocalConnection();

        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, account);

        //Allocator.removeSid(getSidFromAccount(account));   // problem
        pstmt.executeUpdate();
        DBUtil.free(null, pstmt, conn);
        
        return true;
    }

    public static List<User> findAllUser() throws Exception {
        Connection conn =DBUtil.getLocalConnection();
        String sql = "select * from user_info";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
        List<User> list=new ArrayList<User>();
        User cou=null;
        while(rs.next()) {
            String sid=rs.getString("id");
            String name=rs.getString("user_name");
            String sex=rs.getString("sex");
            String major=rs.getString("major");
            int number=rs.getInt("numberOfBorrow");
            String account=rs.getString("account");
            String password=rs.getString("password");
            cou=new User(sid,name,sex,major,account,password, number);
            list.add(cou);
        }
        DBUtil.free(rs, pstmt, conn);
        return list;
    }

    public static User findOneUser(String u) throws Exception {
        Connection conn =DBUtil.getLocalConnection();
        String sql = "select * from user_info where account=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, u);

        ResultSet rs = pstmt.executeQuery();
        User user=null;
        if(rs.next()) {
            String sid=rs.getString("id");
            String name=rs.getString("user_name");
            String sex=rs.getString("sex");
            String major=rs.getString("major");
            int number=rs.getInt("numberOfBorrow");
            String account=rs.getString("account");
            String password=rs.getString("password");
            user=new User(sid,name,sex,major,account,password, number);
        }
        DBUtil.free(rs, pstmt, conn);
        if (user != null) return user;
        else return null;
    }
    
    public static double getMoney(String id) throws Exception{
        Connection conn =DBUtil.getLocalConnection();
        String sql = "select money from deposit where sid = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();

        if(rs.next()) return Double.parseDouble(rs.getString(1));
        return 0.0;
    }
//    public List<User> findUserList(String accountForSearch) throws Exception {
//        Connection conn =DBUtil.getLocalConnection();
//        String sql = "select * from user_info where account= ?;";
//        PreparedStatement pstmt = conn.prepareStatement(sql);
//        pstmt.setString(1, accountForSearch);
//
//        ResultSet rs = pstmt.executeQuery();
//        rs.beforeFirst();
//        List<User> list = new ArrayList<User>();
//        while(rs.next()) {
//            String sid = rs.getString("id");
//            String name = rs.getString("user_name");
//            String sex = rs.getString("sex");
//            String major = rs.getString("major");
//            int number = rs.getInt("numberOfBorrow");
//            String account = rs.getString("account");
//            String password = rs.getString("password");
//            User u = new User(sid, name, sex, major, account, password, number);
//            list.add(u);
//        }
//        DBUtil.free(rs, pstmt, conn);
//        return list;
//	}
    //    public void importFromExcel(File excelPath, int sheetNo) throws Exception {
    //        Connection conn = DBUtil.getLocalConnection();
    //        String sql="insert into user(sid,name,sex,major,lend,account,password) values(?,?,?,?,?,?,?)";
    //        PreparedStatement pstmt = conn.prepareStatement(sql);
    //        Workbook workbook = Workbook.getWorkbook(excelPath);
    //        Sheet sheet = workbook.getSheet(sheetNo - 1);
    //        int r = sheet.getRows();
    //        int c = sheet.getColumns();
    //        for (int i = 1; i < r; i++) {
    //            for (int j = 1; j <= c; j++) {
    //                    pstmt.setString(j, sheet.getCell(j - 1, i).getContents().trim());
    //            }
    //            pstmt.addBatch();
    //        }
    //        pstmt.executeBatch();
    //        if (workbook != null)
    //                workbook.close();
    //        JdbcUtil.free(null, pstmt, conn);
    //    }

//        public static void main(String args[]) throws Exception{
//            Allocator.removeSid(getSidFromAccount("diana456"));
//        }
}
