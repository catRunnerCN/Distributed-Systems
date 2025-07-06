<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Elements.*"%>
<%@ page import="Functionalities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/node-forge@0.10.0/dist/forge.min.js"></script>
<style type="text/css">
	* {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Fira Code', monospace;
            letter-spacing: .05em;
        }
        html, body {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('/mavenproject3/Book/Login/reg.jpg') no-repeat center center fixed;
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
            width: 400px;
            height: 750px;
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
            font-size: 24px; /* 设置标题字体大小 */
            font-weight: bold;
            margin-bottom: 30px; /* 增加与内容的间距 */
        }

        .container input[type="text"], .container input[type="password"] {
            width: 85%;
            padding: 12px 20px;
            border: 2px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
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
            margin-top: 20px;
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
            margin-top: 20px;
            transition: color 0.3s;
        }
        .container a:hover {
            color: #6e8efb;
	}
</style>
<script type="text/javascript">
    const publicKey = `<%= UserOperation.getPublicKeyAsString() %>`;
    console.log("publicKey: " + publicKey); // Log to verify

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

        console.log("Original Account:", accountField.value);
        console.log("Original Password:", passwordField.value);

        var encryptedAccount = encryptPassword(accountField.value);
        var encryptedPassword = encryptPassword(passwordField.value);
        console.log("Encrypted Account:", encryptedAccount);
        console.log("Encrypted Password:", encryptedPassword);

        accountField.value = encryptedAccount;
        passwordField.value = encryptedPassword;
        
        console.log("Updated Account Field Value:", accountField.value);
        console.log("Updated Password Field Value:", passwordField.value);

        return true;
    }
</script>
</head>
<body>
	<div class="container">
		<div class="login">
			<br>
			<div class="input">
				<form action="/mavenproject3/UserRegister" method="post" onsubmit="return encryptForm();">
					<center>
					<br>
					<input name="loginjudge" value="null" type="hidden">
						<input type="text" name="id" 
							class="input-item" size="20" placeholder="Student ID" required><br>
						<br>
						<input type="text" name="user_name" 
							class="input-item" size="20" placeholder="Name" required><br>
						<br>
						<input type="text" name="sex" 
							class="input-item" size="20" placeholder="Sex" required><br>
						<br>
						<input type="text" name="major" 
							class="input-item" size="20" placeholder="Major" required><br>
						<br>
						<input type="text" name="account" 
							class="input-item" size="20" id="root01" placeholder="Account" required><br>
						<br> 
						<input type="password" name="password" 
							class="input-item" size="20" id="password01" placeholder="Password" required><br>
						<br>
						<br> <input type="submit" value="Register"  name="button" id="button">
					</center>
				</form>
				<br>
				<div class="other" align="center">
                <a href="/mavenproject3/Book/Login/admin_login.jsp">Admin Login</a><br>
                                            Already has accounts?<a href="/mavenproject3/Book/Login/user_login.jsp">Login</a>
                </div>
			</div>
		</div>
	</div>
</body>
</html>