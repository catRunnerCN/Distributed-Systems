<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Functionalities.*"%>
<%@ page import="Elements.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search User</title>
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
			<th>Student ID</th>
			<th>Name</th>
			<th>Sex</th>
			<th>Major</th>
			<th>Number of Borrow</th>
			<th>Account</th>
			<th>Password</th>
			<th>Operation</th>
			<th></th>
		</tr>
		<%
			String account= request.getParameter("account");
                        UserOperation op = new UserOperation();
                        User nc = op.findOneUser(account);
                        if(nc != null){
		%>
		<tr>
		<td style="text-align: center;"><%=nc.getSid() %></td>
		<td style="text-align: center;"><%=nc.getName() %></td>
		<td style="text-align: center;"><%=nc.getSex() %></td>
		<td style="text-align: center;"><%=nc.getMajor() %></td>
		<td style="text-align: center;"><%=nc.getNumberOfBorrow() %></td>
		<td style="text-align: center;"><%=nc.getAccount() %></td>
		<td style="text-align: center;"><%=nc.getPassword() %></td>
		<td><a href="/mavenproject3/AdminUserDelete?bookdelete=null&from=out&operation=delete&account=<%=nc.getAccount()%>">Delete</a></td>
		</tr>
                <%
                    }else{
                    %>
                        <script type="text/javascript">
                          alert("User doest not exist！");
                          window.history.back(-1);
                        </script>
                    <%
                    }
		%>
	</table>
</body>
</html>