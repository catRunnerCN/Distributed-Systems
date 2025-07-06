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
    <title>View All of Your Records</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif; /* 使用现代字体 */
            background-color: #f0f0f0; /* 背景颜色 */
            color: #444; /* 字体颜色 */
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333; /* 深色标题 */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff; /* 表格背景颜色 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 柔和的阴影 */
        }
        th, td {
            text-align: center;
            padding: 12px;
            border: 1px solid #ccc; /* 边框颜色 */
        }
        th {
            background-color: #ccc; /* 深灰色 */ /* 表头背景颜色 */
            color: #333; /* 表头字体颜色 */
        }
        tr:nth-child(even) {
            background-color: #f9f9f9; /* 交替行背景颜色 */
        }
        a {
            text-decoration: none;
            color: #0000CD;
            display: block;
            text-align: center;
            padding: 10px;
            background-color: #D4F2E7;
            border-radius: 5px; /* 圆角 */
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #00CED1; /* 悬停颜色 */
            color: #fff; /* 悬停时的字体颜色 */
        }
        .borrow-count {
            text-align: center;
            font-size: 1.5em;
            color: red; /* 借书数量颜色 */
        }
    </style>

</head>
<body>
    <h2>   </h2>
    <% 
        BookOperation op = new BookOperation();
        String sid = (String)session.getAttribute("sid");
        List<BorrowRecord> records = op.getBorrowRecord(sid);
    %>
    <center>
        You have borrowed <span class="borrow-count"><%=records.size() %></span> Books
    </center>
    <table>
        <tr>
            <th>Book Name</th>
            <th>Author</th>
            <th>Book Remark</th>
            <th>Time</th>
            <th>State</th>
        </tr>
        <%
            for (BorrowRecord record : records) {
                String stateStr = (record.getState() == 1 ? "Returned" : "Not Returned");
        %>
        <tr>
            <td><%=record.getBookName() %></td>
            <td><%=record.getAuthor() %></td>
            <td><%=record.getRemark() %></td>
            <td><%=record.getTimeStamp() %></td>
            <td><%=stateStr %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
