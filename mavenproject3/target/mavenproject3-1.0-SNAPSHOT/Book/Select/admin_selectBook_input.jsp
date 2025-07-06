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
<title>Search By Book Name</title>
</head>
<body>
<center >
    <form action="/mavenproject3/Book/Select/admin_selectBook_output.jsp?action=null">
    <table>
        <tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr>
        <tr><td>Book Name:</td> <td><input type="text" name="bookName" size="30"></td></tr> 
        <tr><td></td><td></td></tr>
            <tr><td></td><td><input type="submit" value="Search">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="Cancel"></td></tr>
    </table>
    </form>
</center>
</body>
</html>