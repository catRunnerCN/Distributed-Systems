# Distributed-System Online Book Management System

## If you can't get it to run after downloading, there may be the following reasons:
- In lines 45 - 47 of `DBUtil.java`, you need to change these three lines to your own corresponding information. (Note that the default database name is `authentication`. If the name is different, you need to change it.)
- If you can't connect to the database all the time, start cmd as an administrator and enter `net start mysql80`.
- If the css of the `viewBook` page can't be refreshed, turn on a VPN.
- If the page remains blank or shows a 404 error after a certain modification, it's very likely that there's a bug. In this case, you can transplant the code to a blank Java project for testing, or open the browser console to check for error messages.

## Issues to be resolved:
- In the Admin operation, `addStudent` can't insert a user with a duplicate `account`.
- In the Admin operation, `import Excel` can't be inserted repeatedly.
- After the Admin enters the wrong password once, when redirected to the userLogin page, something goes wrong.
- Reasons for unsuccessful registration and login (such as wrong password or non-existent user) (X)
- The `user_info` database should currently store the account and the hash value of the password (X)
- When two different IPs log in to the website simultaneously, one IP should be unable to log in or one IP should be kicked back to the login page (X)
- Database synchronization issue (X)

## FLow
Now, the problem of the server going down can be solved by using `Nginx`. Multiple computers need to be connected to the same local area network, and then set the IP address as the proxy server. (X)
