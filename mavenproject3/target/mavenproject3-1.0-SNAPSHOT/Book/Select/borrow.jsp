<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Borrow Book Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <style>
    .swal-overlay {
        background-color: rgba(0, 0, 0, 0.2); /* 透明黑色背景 */
    }
</style>

</head>
<body>
      <%
        request.setCharacterEncoding("UTF-8");
        String bid=(String)request.getParameter("id");
        String account = (String)session.getAttribute("account");
        String sid = (String)session.getAttribute("sid");
        BookOperation op = new BookOperation();
        
        if(Borrow.count(sid) >= 10){
            %>
            <script type="text/javascript">
                swal("Limit Exceeded!", "You have exceeded the maximum borrowing limit, please return at least one book first!", "error").then(() => {
                    window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
                });
            </script>
            <%
        }else{
            int res = op.borrowBook(sid, bid);
            if(res == -1){
                %>
                <script type="text/javascript">
                    swal("Error!", "The book is empty, please borrow other books!", "error").then(() => {
                        window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
                    });
                </script>
                <%
            }else if(res == -2){
                  %>
                    <script type="text/javascript">
                        swal("Duplicate Borrow!", "You have borrowed this book before!", "warning").then(() => {
                            window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
                        });
                    </script>
                <%
            }else{
                String borrowTimeStr = BookOperation.getTime();
                %>
                <script type="text/javascript">
                    var borrowTime = "<%= borrowTimeStr %>";
                    swal("Congratulations!", "You have borrowed this book at " + borrowTime, "success").then(() => {
                        window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
                    });
                </script>
                <%
            }
        }
        
        
        // out.println("<h2>Sid " + sid + "</h2>");
      %>

</body>
</html>