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
    <title>Search</title>

    
</head>

<!-- Start Header -->
<header>
    <!--Navigation-->
    <nav class="navbar navbar-top-default navbar-expand-lg navbar-simple nav-line">
        <div class="container">
            <a href="/mavenproject3/index-web-hosting.html#slider-area" title="Logo" class="logo scroll">
                <!--Logo Default-->
                <img src="/mavenproject3/web-hosting/img/logo.png" title="logo" alt="logo" class="logo-default">
            </a>

            <!--Nav Links-->
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
    <div class="container text-center">
        <h1>Find by bookname</h1>
        <form action="/mavenproject3/Book/Select/user_select_output1.jsp" method="GET">
            <div class="form-group">
                <label for="bookname" class="sr-only">Bookname:</label>
                <input type="text" class="form-control" id="bookname" name="bookname" placeholder="Please input bookname:" required>
            </div>
                <button type="submit" class="scroll btn btn-medium btn-rounded btn-primary">Search</button>
                <button type="reset" class="scroll btn btn-medium btn-rounded btn-primary">Cancel</button>
        </form>
    </div>
    
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
<!-- JavaScript -->

<script src="/mavenproject3/vendor/js/bundle.min.js"></script>
<!-- Plugin Js -->
<script src="/mavenproject3/vendor/js/jquery.appear.js"></script>
<script src="/mavenproject3/vendor/js/owl.carousel.min.js"></script>
<script src="/mavenproject3/vendor/js/wow.min.js"></script>
<script src="/mavenproject3/vendor/js/jquery.fancybox.min.js"></script>
<script src="/mavenproject3/web-hosting/js/particles.min.js"></script>

<!-- CUSTOM JS -->
<script src="/mavenproject3/vendor/js/contact_us.js"></script>
<script src="/mavenproject3/web-hosting/js/circle-progress.min.js"></script>

</body>
</html>

