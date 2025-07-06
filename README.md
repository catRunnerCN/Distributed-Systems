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
