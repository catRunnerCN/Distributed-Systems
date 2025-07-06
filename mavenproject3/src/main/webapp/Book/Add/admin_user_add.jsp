<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Student</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!--<style type="text/css">
.add{
    position:relative;
	top:60%;
}
</style>-->
</head>
<body>
<center>
<div class="add">
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String id = request.getParameter("id");
            String user_name = request.getParameter("user_name");
            String sex = request.getParameter("sex");
            String major = request.getParameter("major");
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            int numberOfBorrow = Integer.parseInt(request.getParameter("lend"));
            
            User u = new User(id, user_name, sex, major, account, password, numberOfBorrow);
            UserOperation op = new UserOperation();
            
            boolean success = op.insert(u);
            if (success) {
                %>
                <script type="text/javascript">
                swal("User Add Successful!").then(() => {
                    window.location.href = '/mavenproject3/Book/Add/admin_user_add.jsp';
                });
                </script>
                <%
            }
            else {
                %>
                    <script type="text/javascript">
                        swal("User Add Unsuccessful!","Please Try Again").then(() => {
                            window.location.href = '/mavenproject3/Book/Add/admin_user_add.jsp';
                        });
                    </script>
                <%
            }
        }    
    %>
    <form action="/mavenproject3/Book/Add/admin_user_add.jsp" method="post">
        <table  border="0" >
            <tr><td ></td><td><input type="hidden" name="nameuserAdd" value="null"/></td></tr><tr><td></td><td></td></tr>
            <tr><td >Student ID</td><td><input type="text" name="id" size="40" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td >Name</td><td><input type="text" name="user_name" size="40" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td >Sex</td><td><input type="text" name="sex" size="40"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td >Major</td><td><input type="text" name="major" size="40"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td >Book Borrowed</td><td><input type="text" name="lend" size="40"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td >Account</td><td><input type="text" name="account" size="40"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td >Password</td><td><input type="text" name="password" size="40"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr align="center">
                <td colspan="5">
                    <input type="submit" value="Add">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Cancel">
                </td>
            </tr>
        </table>
    </form>
</div>
</center>
</body>
</html>