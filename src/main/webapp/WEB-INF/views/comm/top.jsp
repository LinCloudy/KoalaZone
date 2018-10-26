<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<script src="<%=contextPath%>/static/jquery-3.1.1.js"></script>
<script src="<%=contextPath%>/static/bootstrap/js/bootstrap.js"></script>
<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<link href="<%=contextPath%>/static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>

<div class="row">

    <nav class="navbar navbar-default">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=contextPath%>/">Lin</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="nv1">
                    <li class="active" id="firstPage"><a href="<%=contextPath%>/">首页</a></li>
                    <li id="readPage"><a href="<%=contextPath%>/column/摘录/readPage">摘录</a></li>
                    <li id="writePage"><a href="<%=contextPath%>/column/随笔/writePage">随笔</a>
                    </li>
                    <li id="footPage"><a href="<%=contextPath%>/column/足迹/footPage">足迹</a>
                    </li>
                    <li id="jutoPage"><a href="<%=contextPath%>/column/JuTo/jutoPage">JuTo</a>
                    </li>
                </ul>
                <form class="navbar-form navbar-right">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="搜索">
                        <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>

<!-- 通过判断点击事件，确认是否为ids内的category块添加或移除样式 -->

<script>
    var href = location.href;
    var id = href.substring(href.lastIndexOf("/") + 1, href.length);
    if (id=="") {
        id = "firstPage";
    }
    
    var ids = ["firstPage", "readPage", "writePage", "footPage", "jutoPage"];

    for (var i = 0; i < ids.length; i++) {
    	//alert(id+(id == ids[i])+ids[i]);
        if (id != ids[i]) {
            $("#" + id).attr("class", "active");
        } else {
            $("#" + ids[i]).removeAttr("class");
        }
    }
    
</script>
 