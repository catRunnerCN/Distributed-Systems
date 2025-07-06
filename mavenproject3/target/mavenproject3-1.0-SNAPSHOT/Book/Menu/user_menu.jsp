<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Menu Page</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif; /* 现代字体 */
        }

        html, body {
            height: 100%;
            background-color: #f7f7f7; /* 柔和的灰色背景 */
            color: #444; /* 深灰色字体 */
        }

        .header {
            text-align: center;
            width: 100%;
            height: 75px;
            background-color: #3b3b3b; /* 深灰色 */
            color: #fff; /* 白色字体 */
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 头部阴影 */
        }

        .header h2 {
            font-size: 28px;
            margin: 0;
        }

        .header h3 {
            font-size: 18px;
            opacity: 0.8;
            margin: 0;
        }

        .main {
            display: flex;
            height: calc(100vh - 75px);
        }

        .daohang {
            width: 20%; /* 增加导航栏宽度 */
            background-color: #ffffff; /* 白色导航栏 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 柔和的阴影效果 */
            padding: 20px 0;
        }

        .menu-list {
            list-style: none;
            padding: 0;
            text-align: center;
        }

        .menu-item {
            margin-bottom: 20px; /* 增加间距 */
        }

        .menu-link {
            display: block;
            color: #333; /* 深灰色字体 */
            background-color: rgba(255, 255, 255, 0.9); /* 半透明白色背景 */
            padding: 12px 20px;
            text-decoration: none;
            border: 1px solid #ccc; /* 浅灰色边框 */
            border-radius: 5px; /* 圆角 */
            transition: all 0.3s;
        }

        .menu-link:hover {
            background-color: #e7e7e7; /* 悬停时的背景颜色 */
            color: #000; /* 悬停时的字体颜色 */
        }

        .content {
            width: 80%;
            background-color: #ffffff; /* 内容区白色背景 */
            padding: 30px; /* 增加内容区内边距 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 柔和的阴影效果 */
            overflow-y: auto; /* 允许内容区滚动 */
        }

        iframe {
            width: 100%;
            height: calc(100% - 60px); /* 适应内容区域 */
            border: none;
            background-color: #f7f7f7; /* 与页面背景一致 */
            border-radius: 5px; /* 圆角 */
        }

        @media (max-width: 768px) {
            .main {
                flex-direction: column; /* 小屏幕下垂直排列 */
            }

            .daohang {
                width: 100%;
                height: auto; /* 自适应高度 */
            }

            .content {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Books Management System</h2>
        <h3> </h3>
    </div>
    <div class="main">
        <div class="daohang">
            <ul class="menu-list">
                <li class="menu-item"><a class="menu-link" href="/mavenproject3/Book/Select/user_select_input.jsp" target="menuFrame">Find Book</a></li>
                <li class="menu-item"><a class="menu-link" href="/mavenproject3/Book/Select/viewBook.jsp" target="menuFrame">View Book</a></li>
                <li class="menu-item"><a class="menu-link" href="/mavenproject3/Book/Select/borrow_history.jsp" target="menuFrame">View History</a></li>
                <li class="menu-item"><a class="menu-link" href="/mavenproject3/Book/Import/export.jsp" target="menuFrame">Export History</a></li>
                <li class="menu-item"><a class="menu-link" href="/mavenproject3/Book/Login/user_login.jsp">Log out</a></li>
            </ul>
        </div>
        <div class="content">
            <iframe id="menuFrame" name="menuFrame"></iframe>
        </div>
    </div>
</body>
</html>
