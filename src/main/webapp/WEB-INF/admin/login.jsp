<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>请登录</title>
    <script src="<%=contextPath%>/static/jquery-3.1.1.js"></script>
    <script src="<%=contextPath%>/static/bootstrap/js/bootstrap.js"></script>
    <link href="<%=contextPath%>/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=contextPath%>/static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="<%=contextPath%>/static/signin.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
	<form class="form-signin" action="/Blog/lin/dologin" method="post">
        <h2 class="form-signin-heading">请登录</h2>
        <c:if test="${error!=null}">
        <div><%=request.getAttribute("error") %></div>
        </c:if>
        <div class="form-group">
        <label for="inputUsername" class="sr-only">用户名</label>
        <input type="text" id="inputUsername" name="username" value="123" class="form-control" placeholder="请输入您的用户名" required autofocus>
        </div>
        <div class="form-group">
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword"  name="password" value="123"  class="form-control" placeholder="请输入您的密码" required>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form> 
    
</div>

</body>
</html>