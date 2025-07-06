<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Regular User Renewal Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <style>
        .swal-overlay {
            background-color: rgba(0, 0, 0, 0.5); /* 半透明背景 */
        }
    </style>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String bid = (String)request.getParameter("id");
        String account = (String)session.getAttribute("account");
        String sid = (String)session.getAttribute("sid");
        BookOperation op = new BookOperation();
        
        if (!op.borrowedBefore(sid, bid)) {
    %>
            <script type="text/javascript">
                swal("Error!", "You have not borrowed this book before!", "error").then(() => {
                    window.history.back();
                });
            </script>
    <%
        } else {
            if (op.calculatePeriod(op.getBorrowTime(sid, bid)) < 30) {
    %>
                <script type="text/javascript">
                    swal("Success!", "Extend borrow time successfully!", "success").then(() => {
                        window.history.back();
                    });
                </script>
    <%
            } else {
    %>
                <script type="text/javascript">
                    swal("Overdue!", "You have already been overdue! Please pay the fee first!", "warning").then(() => {
                        window.history.back();
                    });
                </script>
    <%
            }
        }
    %>
</body>
</html>
