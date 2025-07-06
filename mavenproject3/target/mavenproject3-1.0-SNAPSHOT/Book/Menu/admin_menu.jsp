<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Menu</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.header {
	text-align: center;
	width: 100%;
	height: 75px;
	background-color: #609CCE;
}

.main {
	width: 100%;
	height: 1000px;
}

.daohang {
	width: 15%;
	height: 100%;
	float: left;
	background-color: #B0D8D8;
}

ul {
	white-space: nowrap;
	overflow: hidden;
	text-align: center;
}

li {
	overflow: hidden;
	margin-bottom: 10px;
	position: relative;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 3px;
	overflow: hidden;
	text-decoration: none;
}

li a:hover {
	background-color: #111;
}

.content {
	height: 100%;
	background-color: #B0D8D8;
}

.daohang ul li ul li{
    float:none;
}
.daohang ul li ul{
    display:none;
}
.daohang ul li:hover{
    background-color:#48D1CC;
    display: block;
}
.daohang ul li:hover ul{
    display: block;
}
</style>
</head>
<body>
    <div class="header">
        <h2>Book Management System</h2>
        <h3>Administrator Menu</h3>
    </div>
    <div class="main">
        <div class="daohang">
            <ul>
                <li><a href="/mavenproject3/Book/Select/admin_selectUser_input.jsp" target="menuFrame">Find User</a></li>
                <li><a href="/mavenproject3/Book/Select/admin_selectUser_all.jsp" target="menuFrame">View User</a></li>
                <li><a href="/mavenproject3/Book/Add/admin_book_add.jsp" target="menuFrame">Add Book</a></li>
                <li><a href="/mavenproject3/Book/Select/admin_selectBook_input.jsp" target="menuFrame">Find Book</a></li>
                <li><a href="/mavenproject3/Book/Select/admin_selectBook_all.jsp" target="menuFrame">View Book</a></li>
                <li><a href="/mavenproject3/Book/Add/admin_user_add.jsp" target="menuFrame">Add Student</a></li>
                <li><a href="/mavenproject3/Book/Import/import.jsp" target="menuFrame">Excel Import</a></li>
                <li><a href="/mavenproject3/Book/Login/admin_login.jsp">Log out</a></li>
            </ul>
        </div>
        <div class="content">
            <iframe id="menuFrame" name="menuFrame"	
            style="background:url(http://localhost:8080/BookManagement/Book/Image/bg1.jpg); 
            background-size:cover;    
            width: 84%; height: 1000px; 
            float: right; frameborder: 0">
            </iframe>
        </div>
    </div>
</body>
</html>