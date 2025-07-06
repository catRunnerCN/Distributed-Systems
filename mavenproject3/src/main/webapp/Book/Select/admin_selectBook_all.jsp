<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Books</title>
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
                    alert("Book Delted");  
                    </script>
                <%
            }
            BookOperation op = new BookOperation();
            List<Book> list = new ArrayList<Book>();
            try{
                list = op.getAllBookList();
            }catch(Exception e){
                e.printStackTrace();
            }
            for (Book nc : list) {
        %>
        <tr>
        <td style="text-align: center;"><%=nc.getBid() %></td>
        <td style="text-align: center;"><%=nc.getBookname() %></td>
        <td style="text-align: center;"><%=nc.getAuthor() %></td>
        <td style="text-align: center;"><%=nc.getPrice() %></td>
        <td style="text-align: center;"><%=nc.getRemark() %></td>
        <td style="text-align: center;"><%=nc.getNumber() %></td>
        <td><a href="/mavenproject3/Book/Select/admin_selectBook_all.jsp?action=delete&bid=<%=nc.getBid()%>">Delete</a></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>