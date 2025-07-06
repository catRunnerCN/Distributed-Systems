package Elements;

/**
 *
 * @author muzum
 */
public class Book {
    private String bid;
    private String bookname;
    private String author;
    private double price;
    private String remark;
    private int number;
    
    public Book(){
    }
    
    public Book(String bid, String bookname, String author, double price, String remark, int number) {
        super();
        this.bid = bid;
        this.bookname = bookname;
        this.author = author;
        this.price = price;
        this.remark = remark;
        this.number = number;
    }
    
    public Book(String bookname, String author, double price, String remark, int number) {
        super();
        this.bookname = bookname;
        this.author = author;
        this.price = price;
        this.remark = remark;
        this.number = number;
    }
    
    public void view(){
        System.out.print(bid + " ");
        System.out.print(bookname + " ");
        System.out.print(author + " ");
        System.out.print(price + " ");
        System.out.print(remark + " ");
        System.out.print(number + "\n");
    }

    public String getBid() {
        return bid;
    }

    public String getBookname() {
        return bookname;
    }

    public String getAuthor() {
        return author;
    }

    public double getPrice() {
        return price;
    }

    public String getRemark() {
        return remark;
    }

    public int getNumber() {
        return number;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public void setNumber(int number) {
        this.number = number;
    }
    
}
