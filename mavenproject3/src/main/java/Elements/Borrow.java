package Elements;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author muzum
 */
public class Borrow {
    public enum State {
        BORROW,
        RETURN
    }
    private String id;
    private String bid;
    private State state;
    private String time;
    public Borrow(){}

    public Borrow(String id, String bid, State state, String time) {
        this.id = id;
        this.bid = bid;
        this.state = state;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public String getBid() {
        return bid;
    }

    public State getState() {
        return state;
    }

    public String getTime() {
        return time;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public void setState(State state) {
        this.state = state;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    public static boolean exist(String id, String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select * from borrow where id = ? and bid = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, id);
        st.setString(2, bid);
        return st.executeQuery().next();
    }
    
    public static int count(String id) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select count(*) from borrow where id = ? and state = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, id);
        st.setInt(2, 0);
        ResultSet rs = st.executeQuery();
        if(rs.next()) return rs.getInt(1);
        return 0;
    }
    
    @Override
    public String toString() {
        return "Borrow [state=" + state + "]";
    }
}
