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
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">

    <!-- Author -->
    <meta name="author" content="GROUP 1 EVERYONE"> 
    <!-- Description -->
    <meta name="description" content="STUCK is a highly creative, modern, visually stunning and Bootstrap responsive multipurpose studio and portfolio book management.">
    <!-- Keywords -->
    <meta name="keywords" content="Creative, modern, clean, bootstrap responsive, html5, css3, portfolio, blog, studio, templates, multipurpose, one page, corporate, start-up, studio, branding, designer, freelancer, carousel, parallax, photography, studio, masonry, grid, faq">
    <!-- Favicon -->
    <link href="/mavenproject3/vendor/img/favicon.ico" rel="icon">
    <!-- Bundle -->
    <link href="/mavenproject3/vendor/css/bundle.min.css" rel="stylesheet">
    <!-- Plugin CSS -->
    <link href="/mavenproject3/vendor/css/owl.carousel.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/mavenproject3/vendor/css/LineIcons.min.css">
    <link rel="stylesheet" href="/mavenproject3/vendor/css/jquery.fancybox.min.css">

    <!-- Custom Stylesheets -->
    <link href="/mavenproject3/web-hosting/css/line-awesome.min.css" rel="stylesheet">
    <link href="/mavenproject3/web-hosting/css/style.css" rel="stylesheet">
    <link href="/mavenproject3/web-hosting/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Page Title -->
    <title>Available Books</title>

    <style type="text/css">
        body {
            background-color: #f8f9fa;
        }
        .card {
            transition: transform 0.2s, box-shadow 0.3s;
            margin: 20px auto;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            border-radius: 8px;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .btn {
            margin: 5px;
            width: 120px;
            height: 45px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s, color 0.3s;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <!-- Navigation -->
    <header>
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

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row text-center padding-bottom-half">
            <div class="col-12 col-md-10 col-lg-8 offset-md-1 offset-lg-2 wow zoomIn heading-area" data-wow-duration="1s" data-wow-delay=".1s">
                <h1>Available Books in Our Collection</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <%
                BookOperation op = new BookOperation();
                List<Book> books = op.getAllBookList();
                for (Book book : books) {
            %>
            <div class="col-12 col-md-10 col-lg-8 d-flex align-items-stretch">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=book.getBookname() %></h5>
                        <p class="card-text">Author: <%=book.getAuthor() %></p>
                        <p class="card-text">Price: <%=book.getPrice() %> CNY</p>
                        <p class="card-text">Remark: <%=book.getRemark() %></p>
                        <p class="card-text">Available: <%=book.getNumber() %></p>
                        <div class="d-flex justify-content-center flex-wrap">
                            <a href="borrow.jsp?id=<%=book.getBid() %>" class="btn btn-primary">Borrow</a>
                            <a href="return.jsp?id=<%=book.getBid() %>" class="btn btn-danger">Return</a>
                            <a href="extend.jsp?id=<%=book.getBid() %>" class="btn btn-warning">Renew</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Plugin Js -->
    <script src="/mavenproject3/vendor/js/bundle.min.js"></script>
    <script src="/mavenproject3/vendor/js/jquery.appear.js"></script>
    <script src="/mavenproject3/vendor/js/owl.carousel.min.js"></script>
    <script src="/mavenproject3/vendor/js/wow.min.js"></script>
    <script src="/mavenproject3/vendor/js/jquery.fancybox.min.js"></script>
    <script src="/mavenproject3/web-hosting/js/particles.min.js"></script>

    <!-- Custom JS -->
    <script src="/mavenproject3/vendor/js/contact_us.js"></script>
    <script src="/mavenproject3/web-hosting/js/circle-progress.min.js"></script>
</body>
</html>
