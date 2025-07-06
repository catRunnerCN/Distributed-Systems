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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<title>Return Book Page</title>
</head>
<body>
      <%
        request.setCharacterEncoding("UTF-8");
        String bid=(String)request.getParameter("id");
        String account = (String)session.getAttribute("account");
        String sid = (String)session.getAttribute("sid");
        BookOperation op = new BookOperation();
        int res = op.returnBook(sid, bid);
        if(res == -1){
            %>
            <script type="text/javascript">
                swal("Error!", "You did not borrow this book before!", "error").then(() => {
                    window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
                });
            </script>
            <%
        }else{
            if(res >= 30){
//                if(UserOperation.getMoney(sid) < BookOperation.getPrice(bid)){
//                }else{
//    //                out.print("You are overdue, please pay the fine first\n" + "\n" + String.valueOf(res-25) + "CNY！");
//                    %>
//                    <script type="text/javascript">
//                        swal("Overdue", "You are overdue, please pay the fine first\n" + "\n" + String.valueOf(res-25) + "CNY!", "error");
//                    </script>
//                    <%
//                    op.changeState(sid, bid);
//                    %>
//                    <script type="text/javascript">
//                        swal("Successfully", "You have returned this book Successfully!", "success").then(() => {
//                            window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
//                        });
//                    </script>
//                    <%
//                }
            }else{
                op.changeState(sid, bid);
                %>
                <script type="text/javascript">
                    swal("Successfully", "You have returned this book Successfully!", "success").then(() => {
//                        window.history.back(-1);
//                        location.reload();
                        window.location.href = '/mavenproject3/Book/Select/viewBook.jsp';
                    });
                </script>
                <%
            }
        }
      %>
</body>
</html>