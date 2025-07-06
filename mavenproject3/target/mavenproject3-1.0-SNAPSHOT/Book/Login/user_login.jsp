<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login Page</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/node-forge@0.10.0/dist/forge.min.js"></script>
<style type="text/css">
* {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Fira Code', monospace;
        }
        html, body {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('/mavenproject3/Book/Login/libuser.jpg')no-repeat center center fixed;
            overflow: visible;
        }

        .container {
            position: relative;
            z-index: 2;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 350px;
            height: 550px;
            padding: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: visible;
            transition: transform 0.3s ease;
            animation: fadeIn 1.2s ease;
        }
        .container:hover {
            transform: scale(1.03);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .title {
            font-size: 26px;
            color: #444;
            margin-bottom: 35px;
        }

        .container input[type="text"], .container input[type="password"] {
            width: 85%;
            padding: 12px 20px;
            border: 2px solid #ddd;
            border-radius: 5px;
            margin-bottom: 35px;
            transition: border-color 0.3s;
        }
        .container input[type="text"]:focus, .container input[type="password"]:focus {
            border-color: #6e8efb;
            box-shadow: 0 4px 8px rgba(110, 142, 251, 0.3);
            outline: none;
        }

        #button {
            width: 85%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(45deg, #6e8efb, #a777e3);
            color: #fff;
            font-weight: bold;
            letter-spacing: 1px;
            cursor: pointer;
            margin-bottom: 35px;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        #button:hover {
            background: linear-gradient(45deg, #a777e3, #6e8efb);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(110, 142, 251, 0.3);
        }

        .container a {
            color: #a777e3;
            text-decoration: none;
            font-size: 14px;
            margin-top: 35px;
            transition: color 0.3s;
        }
        .container a:hover {
            color: #6e8efb;
        }
    
</style>
<script type="text/javascript">
    const publicKey = `<%= UserOperation.getPublicKeyAsString() %>`;
//    console.log("publicKey: " + publicKey); // Log to verify

    const publicKeyPem = `<%= UserOperation.getPublicKeyAsString() %>`;

    function encryptPassword(password) {
        const forge = window.forge;
        const publicKey = forge.pki.publicKeyFromPem(publicKeyPem);
        const encrypted = publicKey.encrypt(password, 'RSA-OAEP');
        return forge.util.encode64(encrypted);
    }

    function encryptForm() {
        var accountField = document.getElementById("root01");
        var passwordField = document.getElementById("password01");

        var encryptedAccount = encryptPassword(accountField.value);
        var encryptedPassword = encryptPassword(passwordField.value);

        accountField.value = encryptedAccount;
        passwordField.value = encryptedPassword;
        
        console.log("Updated Account Field Value:", accountField.value);
        console.log("Updated Password Field Value:", passwordField.value);
        
        return true;
    }
</script>
</head>
    <script type="text/javascript">
        function deleteCookieIfExists(name) {
            const cookieValue = getCookie(name);
            if (cookieValue) {
                document.cookie = name + '=; Max-Age=-99999999; path=/;';
                console.log(`${name} cookie deleted`);
            } else {
                console.log(`${name} cookie does not exist`);
            }
        }

        function getCookie(name) {
            const nameEQ = name + "=";
            const ca = document.cookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }
         deleteCookieIfExists("account");
    </script>
<body>
    <div class="container">
        <div class="login">
            <br>
            <div class="title" align="center">
                <b>User Login</b>
            </div>
            <div class="input">
                <form action="/mavenproject3/UserValidation" method="post" onsubmit="return encryptForm();">
                    <center>
                    <br>
                    <table>
                    <input name="loginjudge" value="null" type="hidden">
                        <tr><td><input type="text" name="account" 
                            class="input-item" size="22" id="root01" placeholder="Account" required></td></tr>
                        <tr><td><input type="password" name="password" 
                            class="input-item" size="22" id="password01" placeholder="Password" required></td></tr>
                        <tr><td><input type="submit" value="Log in" name="button" id="button"></td><tr>
                    </table>
                    </center>
                </form>
                <br>
                <div class="other" align="center">
                    <a href="/mavenproject3/Book/Login/admin_login.jsp ">Admin Login</a><br>
                    No account?<a href="/mavenproject3/Book/Login/user_register.jsp">Register</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>