<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
    <meta http-equiv="refresh" content="3;url=user_login.jsp">
    <script type="text/javascript">
        function getCookie(name) {
            var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
            if (match) return match[2];
        }

        window.onload = function() {
            var usernameCookie = getCookie("account");

            if (usernameCookie) {
                window.location.href = "/mavenproject3/UserLogin?loginjudge=right&account=" + encodeURIComponent(usernameCookie);
            } else {
                window.location.href = "/mavenproject3/Book/Login/user_login.jsp";
            }
        }
    </script>
</head>
<body>
    <h2>Redirecting...</h2>
    <p>If you are not redirected automatically, click <a href="user_login.jsp">here</a>.</p>
</body>
</html>
