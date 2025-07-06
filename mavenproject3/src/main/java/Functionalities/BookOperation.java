package Functionalities;

import java.sql.*;
import Elements.Book;
import Elements.DBUtil;
import Elements.BorrowRecord;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author muzum
 */
public class BookOperation {
    public BookOperation(){
    }
    
    public static Book getBook(String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select * from book where bid = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, bid);
        ResultSet rs = st.executeQuery();
        List<List> result = DBUtil.getResult(rs);
        var record = result.getFirst();
        return new Book(record.get(0).toString(), record.get(1).toString(), record.get(2).toString(), Double.parseDouble((String)record.get(3).toString()), record.get(4).toString(), Integer.parseInt(record.get(5).toString()));
    }
    
    public static List<Book> getBookList(String bookName) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select * from book where bookname = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, bookName);
        ResultSet rs = st.executeQuery();
        List<Book> res = new ArrayList<>();
        while(rs.next()){
            Book book = new Book();
            book.setBid(rs.getString("bid"));
            book.setBookname(rs.getString("bookname"));
            book.setAuthor(rs.getString("author"));
            book.setPrice(Double.parseDouble(rs.getString("price")));
            book.setRemark(rs.getString("remark"));
            book.setNumber(Integer.parseInt(rs.getString("number")));
            res.add(book);
        }
        return res;
    }
    
    public static List<Book> getAllBookList() throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select * from book;";
        PreparedStatement st = c.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        List<Book> res = new ArrayList<>();
        while(rs.next()){
            Book book = new Book();
            book.setBid(rs.getString("bid"));
            book.setBookname(rs.getString("bookname"));
            book.setAuthor(rs.getString("author"));
            book.setPrice(Double.parseDouble(rs.getString("price")));
            book.setRemark(rs.getString("remark"));
            book.setNumber(Integer.parseInt(rs.getString("number")));
            res.add(book);
        }
        return res;
    }
        
    public boolean exist(String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select bookname from book where bid = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, bid);
        ResultSet rs = st.executeQuery();
        return rs.next();
    }
    
    public static void addBook(String bid, int numberToAdd) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        PreparedStatement st;
        String sql = "update book set number = ? where bid = ?;";
        Book saveBook = getBook(bid);
        st = c.prepareStatement(sql);
        st.setInt(1, saveBook.getNumber() + numberToAdd);
        st.setString(2, bid);
        st.executeUpdate();
        DBUtil.free(null, st, c);
    }
    
    public boolean insertBook(Book book) throws Exception{
        if(exist(book.getBid())){
           addBook(book.getBid(), book.getNumber());
        }else{
            Connection c = DBUtil.getLocalConnection();
            PreparedStatement st;
            String sql = "insert into book(bid, bookname, author, price, remark, number) values(?, ?, ?, ?, ?, ?);";
            st = c.prepareStatement(sql);
            st.setString(1, Allocator.produceBid());
            st.setString(2, book.getBookname());
            st.setString(3, book.getAuthor());
            st.setDouble(4, book.getPrice());
            st.setString(5, book.getRemark());
            st.setInt(6, book.getNumber());
            st.executeUpdate();
            DBUtil.free(null, st, c);
        }

        return true;
    }
    
    public ArrayList<String> getBookId(String bookName) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select bid from book where bookname = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, bookName);
        ResultSet rs = st.executeQuery();
        ArrayList<String> res = new ArrayList<>();
        
        while(rs.next())
            res.add(rs.getString(1));
        
        return res;
    }
    
    public boolean deleteBook(String bid) throws Exception {
        if(!exist(bid)){
            return false;
        }
        
        Connection c = DBUtil.getLocalConnection();
        String sql = "delete from book where bid = ?;";
        PreparedStatement st = c.prepareStatement(sql);

        st.setString(1, bid);
        
        st.executeUpdate();
        Allocator.removeBid(bid);
        DBUtil.free(null, st, c);
        return true;
    }
    
    public static String getTime(){
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return now.format(formatter);
    }
    
    public static boolean borrowedBefore(String id, String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        String sql = "select count(*) from borrow where id = ? and bid = ? and state = ?;";
        PreparedStatement st = c.prepareStatement(sql);
        st.setString(1, id);
        st.setString(2, bid);
        st.setInt(3, 0);
        ResultSet rs = st.executeQuery();
        if(rs.next()) return rs.getInt(1) > 0;
        return false;
    }
    
    public int borrowBook(String id, String bid) throws Exception{
        if(!exist(bid) || getBook(bid).getNumber() == 0){
            return -1;
        }
        if(borrowedBefore(id, bid)){
            return -2;
        }
        addBook(bid, -1);
        
        Connection c = DBUtil.getLocalConnection();
        PreparedStatement st;
        
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String timeCurrent = now.format(formatter);
        
        String sql = "insert into borrow(id, bid, state, time) values(?, ?, ?, ?);";
        st = c.prepareStatement(sql);
        st.setString(1, id);
        st.setString(2, bid);
        st.setInt(3, 0);
        st.setString(4, timeCurrent);
        st.executeUpdate();
        DBUtil.free(null, st, c);
        return getBook(bid).getNumber();
    }
    
    public static String getBorrowTime(String id, String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        PreparedStatement st;
        
        String sql = "select time from borrow where id = ? and bid = ? and state = ?;";
        st = c.prepareStatement(sql);
        st.setString(1, id);
        st.setString(2, bid);
        st.setInt(3, 0);
        ResultSet rs = st.executeQuery();
        
        String borrowTime = null;
        if(rs.next()) borrowTime = rs.getString(1);
        
        DBUtil.free(null, st, c);
        
        return borrowTime;
    }
    
    public static int returnBook(String id, String bid) throws Exception{
        if(!borrowedBefore(id, bid)){
            return -1;
        }
        addBook(bid, 1);
        
        return calculatePeriod(getBorrowTime(id, bid));
    }
    
    public static int calculatePeriod(String borrowTime){
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String returnTime = now.format(formatter);
        
        LocalDateTime startTime = LocalDateTime.parse(borrowTime, formatter);
        LocalDateTime endTime = LocalDateTime.parse(returnTime, formatter);
        
        // floor div
        return (int)ChronoUnit.DAYS.between(startTime, endTime);
    }
    
    public static void changeState(String id, String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        PreparedStatement st;
        
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String timeCurrent = now.format(formatter);
        
        String sql = "update borrow set state = ?, time = ? where id = ? and bid = ?;";
        st = c.prepareStatement(sql);
        st.setInt(1, 1);
        st.setString(2, timeCurrent);
        st.setString(3, id);
        st.setString(4, bid);
        st.executeUpdate();
        DBUtil.free(null, st, c);
    }
    
    public static List<BorrowRecord> getBorrowRecord(String id) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        PreparedStatement st;
        
        String sql = "select book.bookName, book.author, book.remark, borrow.time, borrow.state from borrow, book where borrow.id = ? and borrow.bid = book.bid;";
        st = c.prepareStatement(sql);
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        List<BorrowRecord> records = new ArrayList<>();
        while(rs.next()){
            BorrowRecord record = new BorrowRecord();
            record.setBookName(rs.getString("book.bookName"));
            record.setAuthor(rs.getString("book.author"));
            record.setRemark(rs.getString("book.remark"));
            record.setTimeStamp(rs.getString("borrow.time"));
            record.setState(rs.getInt("borrow.state"));
            records.add(record);
        }
        DBUtil.free(null, st, c);
        return records;
    }
    
    public static double getPrice(String bid) throws Exception{
        Connection c = DBUtil.getLocalConnection();
        PreparedStatement st;
        String sql = "select price from book where bid = ?;";
        st = c.prepareStatement(sql);
        st.setString(1, bid);
        ResultSet rs = st.executeQuery();
        if(rs.next()) return Double.parseDouble(rs.getString(1));
        return 0.0;
    }
}
