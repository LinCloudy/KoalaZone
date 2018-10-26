<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
			${page.pageNow} 页</font> <a href="/Blog?pageNow=1">首页</a>
		<c:choose>
			<c:when test="${page.pageNow - 1 > 0}">
				<a href="/Blog?pageNow=${page.pageNow - 1}">上一页</a>
			</c:when>
			<c:when test="${page.pageNow - 1 <= 0}">
				<a href="/Blog?pageNow=1">上一页</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a href="/Blog?pageNow=${page.pageNow}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 < page.totalPageCount}">
				<a href="/Blog?pageNow=${page.pageNow + 1}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
				<a href="/Blog?pageNow=${page.totalPageCount}">下一页</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a href="/Blog?pageNow=${page.pageNow}">尾页</a>
			</c:when>
			<c:otherwise>
				<a href="/Blog?pageNow=${page.totalPageCount}">尾页</a>
			</c:otherwise>
		</c:choose>
		<form action="/Blog?pageNow=${page.pageNow}" method="get">
			转到第:<input type="text" name="searchNum" size="2" style="width:32px; height:16px;">页
				 <input type="submit" value="GO" name="pagetg" style="width:32px; height:24px;">
		</form>
	</div>
	

</body>
</html>