<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>Login-page</title>
    <script src="<%=contextPath%>/static/assets/js/jquery-1.8.2.min.js"></script>
    <script src="<%=contextPath%>/static/assets/js/supersized.3.2.7.min.js"></script>
    <script src="<%=contextPath%>/static/assets/js/scripts.js"></script>
    <script src="<%=contextPath%>/static/assets/js/supersized-init.js"></script>
    <link href="<%=contextPath%>/static/assets/css/reset.css" rel="stylesheet"/>
    <link href="<%=contextPath%>/static/assets/css/supersized.css" rel="stylesheet"/>
    <link href="<%=contextPath%>/static/assets/css/style.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <div class="page-container">
        <h1>Login</h1>
        <form action="/Blog/lin/dologin" method="post">
            <input type="text" name="username" class="username" placeholder="Username">
            <input type="password" name="password" class="password" placeholder="Password">
            <button type="submit">Sign in</button>
            <div class="error"><span>+</span></div>
        </form>
        <%--<div class="connect">
            <p>Or connect with:</p>
            <p>
                <a class="facebook" href=""></a>
                <a class="twitter" href=""></a>
            </p>
        </div>--%>
    </div>
    
</div>

</body>
</html>