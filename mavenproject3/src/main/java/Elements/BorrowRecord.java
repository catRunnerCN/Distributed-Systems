package Elements;

/**
 *
 * @author muzum
 */
public class BorrowRecord {
    private String bookName, author, remark, timeStamp;
    private int state;
    public BorrowRecord(){
    }

    public BorrowRecord(String bookName, String author, String remark, String timeStamp, int state) {
        this.bookName = bookName;
        this.author = author;
        this.remark = remark;
        this.timeStamp = timeStamp;
        this.state = state;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getBookName() {
        return bookName;
    }

    public String getAuthor() {
        return author;
    }

    public String getRemark() {
        return remark;
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    public int getState() {
        return state;
    }
}
