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
    <link href="<%=contextPath%>/static/assets/css/validationModule.css" rel="stylesheet"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1503607_v3gvpo6hhx.css">
</head>
<body>
<div class="container">
    <div class="page-container">
        <h1>Login</h1>
        <form name="form" action="/Blog/lin/dologin" method="post" >
            <input type="text" name="username" class="username" placeholder="Username">
            <input type="password" name="password" class="password" placeholder="Password">
            <div id="box" onselectstart="return false;">
                <div class="bgColor"></div>
                <div class="txt" >请按住滑块，拖动到最右边</div>
                <!--给i标签添加上相应字体图标的类名即可-->
                <div class="slider"><i class="iconfont iconhuadong"></i></div>
            </div>
            <button type="button" onClick="validate();">Sign in</button>
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

    <script src="<%=contextPath%>/static/assets/js/validationModule.js"></script>
    <script>
        initVM();
        console.log("login start"+isSuccess);
        function validate() {
            if (isSuccess) {
                document.forms["form"].submit();
            } else {
                $(".error").html("请拖动滑块完成验证！");
                console.log("请拖动滑块完成验证！")
                return false;

            }
        }
    </script>
    
</div>

</body>
</html>