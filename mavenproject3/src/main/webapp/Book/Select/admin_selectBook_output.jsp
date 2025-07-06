<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Book</title>
<style type="text/css">
a:link,a:visited{
    text-decoration: none;
    color:#0000CD;
    display:block;
    text-align:center;
    background-color:#D4F2E7;
}
a:active,a:hover{
    background-color:#00CED1;
}
</style>
</head>
<body>
    <table border="0" bgcolor="#ccceee" width="100%">
        <tr bgcolor="CCCCC" align="center">
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Remark</th>			
            <th>Number of Book Left</th>			
            <th>Operation</th>
            <th></th>
        </tr>
        <%
            String action = request.getParameter("action");
            if (action != null && action.equals("delete")) {
                String bid = request.getParameter("bid");
                BookOperation op = new BookOperation();
                boolean deleted = op.deleteBook(bid);
                %>
                    <script type="text/javascript">  
                    alert("Book Deleted");  
                    </script>
                <%
            }
            else if (action == null){
                String bookName = request.getParameter("bookName");
                BookOperation op = new BookOperation();
                List<Book> bookList = op.getBookList(bookName);
                if (bookList == null || bookList.isEmpty()) {  
        %>  
            <script type="text/javascript">  
                alert("Book does not exist！");  
                window.history.back(-1);  
            </script>  
        <%  
            } else {  
                for (Book book : bookList) {
        %>  
        <tr>  
            <td style="text-align: center;"><%=book.getBid() %></td>  
            <td style="text-align: center;"><%=book.getBookname() %></td>  
            <td style="text-align: center;"><%=book.getAuthor() %></td>  
            <td style="text-align: center;"><%=book.getPrice() %></td>  
            <td style="text-align: center;"><%=book.getRemark() %></td>  
            <td style="text-align: center;"><%=book.getNumber() %></td> 
            <td><a href="/mavenproject3/Book/Select/admin_selectBook_output.jsp?action=delete&bid=<%=book.getBid()%>">Delete</a></td>
        </tr>  
        <%  
                }  
            }  
        }
        %>
                                           
    </table>
</body>
</html>