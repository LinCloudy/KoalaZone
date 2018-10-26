<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>${displayName}</title>
</head>
<body>
<jsp:include page="comm/top.jsp"/>
<div class="container">
    <c:forEach var="article" items="${articles}">
        <div class="panel panel-info">

            <div class="panel-heading">
                <h3 class="panel-title">${article.title}</h3>
            </div>

            <div class="panel-body">
            	<span class="summary">${article.summary}</span><br><br>
                <p><a class="btn btn-info" href="/Blog/detail/${article.id}/${article.category}" role="button">阅读全文</a></p>
            </div>
            
            <!-- <div class="panel-footer">author</div> -->
        </div>
    </c:forEach>
</div>

</body>
</html>