<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">

    <!-- Author -->
    <meta name="author" content="GROUP 1 EVERYONE"> 
    <!-- description -->
    <meta name="description" content="STUCK is a highly creative, modern, visually stunning and Bootstrap responsive multipurpose studio and portfolio book management.">
    <!-- keywords -->
    <meta name="keywords" content="Creative, modern, clean, bootstrap responsive, html5, css3, portfolio, blog, studio, templates, multipurpose, one page, corporate, start-up, studio, branding, designer, freelancer, carousel, parallax, photography, studio, masonry, grid, faq">
    <!-- Favicon -->
    <link href="/mavenproject3/vendor/img/favicon.ico" rel="icon">
    <!-- Bundle -->
    <link href="/mavenproject3/vendor/css/bundle.min.css" rel="stylesheet">
    <!-- Plugin Css -->
    <link href="/mavenproject3/vendor/css/owl.carousel.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/mavenproject3/vendor/css/LineIcons.min.css">
    <link rel="stylesheet" href="/mavenproject3/vendor/css/jquery.fancybox.min.css">

    <!-- Style Sheet -->
    <link href="/mavenproject3/web-hosting/css/line-awesome.min.css" rel="stylesheet">
    <link href="/mavenproject3/web-hosting/css/style.css" rel="stylesheet">
    <link href="/mavenproject3/web-hosting/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Page Title -->
    <title>Search Result</title>
    
    <style type="text/css">
        body {
            background-color: #f8f9fa;
        }
        table {
            margin-top: 20px;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
        .container-custom {
            margin-top: 40px;
        }
    </style>
</head>

<!-- Start Header -->
<header>
    <!-- Navigation -->
    <nav class="navbar navbar-top-default navbar-expand-lg navbar-simple nav-line">
        <div class="container">
            <a href="/mavenproject3/index-web-hosting.html#slider-area" title="Logo" class="logo scroll">
                <!-- Logo Default -->
                <img src="/mavenproject3/web-hosting/img/logo.png" title="logo" alt="logo" class="logo-default">
            </a>

            <!-- Nav Links -->
            <div class="collapse navbar-collapse" id="megaone">
                <div class="navbar-nav ml-auto">
                    <a class="nav-link" href="/mavenproject3/index-web-hosting.html">Home</a>
                    <a class="nav-link" href="/mavenproject3/Book/Login/user_login.jsp">Log Out</a>
                    <a class="nav-link" href="/mavenproject3/index-web-hosting.html#contact">Contact Us</a>
                </div>
            </div>
        </div>
    </nav>
</header>
<!-- End Header -->

<body>
    <div class="container container-custom">
        <h1 class="text-center">Find by Bookname</h1>
        <table class="table table-bordered table-hover">
            <thead>
                <tr align="center">
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Remark</th>
                    <th>Number Left</th>
                    <th>Borrow</th>
                    <th>Return</th>
                    <th>Extend Time</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookOperation op = new BookOperation();
                    String bookName = request.getParameter("bookname");
                    List<Book> list = new ArrayList<>();
                    try {
                        list = op.getBookList(bookName);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (Book book : list) {
                %>
                <tr>
                    <td style="text-align: center;"><%=book.getBid() %></td>
                    <td style="text-align: center;"><%=book.getBookname() %></td>
                    <td style="text-align: center;"><%=book.getAuthor() %></td>
                    <td style="text-align: center;"><%=book.getPrice() %></td>
                    <td style="text-align: center;"><%=book.getRemark() %></td>
                    <td style="text-align: center;"><%=book.getNumber() %></td>
                    <td style="text-align: center;"><a href="borrow.jsp?id=<%=book.getBid() %>" class="btn btn-primary btn-rounded">Borrow</a></td>
                    <td style="text-align: center;"><a href="return.jsp?id=<%=book.getBid() %>" class="btn btn-danger btn-rounded">Return</a></td>
                    <td style="text-align: center;"><a href="extend.jsp?id=<%=book.getBid() %>" class="btn btn-warning btn-rounded">Extend Time</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Custom Scripts -->
    <script src="/mavenproject3/vendor/js/bundle.min.js"></script>
    <script src="/mavenproject3/vendor/js/jquery.appear.js"></script>
    <script src="/mavenproject3/vendor/js/owl.carousel.min.js"></script>
    <script src="/mavenproject3/vendor/js/wow.min.js"></script>
    <script src="/mavenproject3/vendor/js/jquery.fancybox.min.js"></script>
    <script src="/mavenproject3/web-hosting/js/particles.min.js"></script>
    <script src="/mavenproject3/vendor/js/contact_us.js"></script>
    <script src="/mavenproject3/web-hosting/js/circle-progress.min.js"></script>
</body>
</html>
