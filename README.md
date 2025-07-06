# Distributed-System
Online BookManagement System

## 如果你下载下来无法运行，可能有以下几点原因：
- 在`DBUtil.java` 中的第45 - 47行，需要将这三行改为你自己对应的信息（注意默认的database名称叫做`authentication`，若名字不一样需要更改）
- 如果数据库一直没法连接，用管理员启动cmd输入`net start mysql80`
- 如果`viewBook` 页面的css无法刷新，打开梯子
- 如果在某一次修改后页面一直空白或404，大概率是出了bug，此时可以将代码移植到某个空白java里测试一下，或打开浏览器的控制台看是否有报错

## 待解决
- Admin操作中的`addStudent`无法插入`account`重复的user
- Admin操作中的`import Excel`无法重复插入
- Admin输入错一次密码后，跳回到userLogin会寄掉
- 添加注册不成功的原因和登录不成功的原因（例如密码错误还是用户不存在）(X)
- user_info数据库中目前应该存入账号和密码的Hash值 (X)
- 两个不同ip同时登录网站时应有一个ip无法登录或有一个ip被挤掉回到登录界面 (X)
- 数据库同步问题 (X)

## FLow
现在可以利用`Nginx`实现解决服务器挂掉的问题，需要多台电脑连接同一个局域网，然后将ip地址代理服务器即可 (X)
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
