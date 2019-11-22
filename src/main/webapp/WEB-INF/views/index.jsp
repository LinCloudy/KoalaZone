<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
<title>首页</title>
	<link href="<%=contextPath%>/static/mycss.css" rel="stylesheet"/>
    <script src="<%=contextPath%>/static/assets/js/jquery-1.8.2.min.js"></script>
</head>
<body>
<%--<%@include file="comm/top.jsp" %>--%>
<jsp:include page="comm/top.jsp"/>
<c:forEach var="article" items="${articles}" begin="0" step="1">
    <div class="row">
        <div class="container">
            <div class="jumbotron">
                <h3>${article.title}</h3>
                <span class="summary">${article.summary}</span><br><br>
                <p><a class="btn btn-info btn-lg" href="/Blog/detail/${article.id}/${article.category}"
                      role="button">阅读全文</a></p>
            </div>
        </div>
    </div>
</c:forEach>
<div style="align-items: center">
<table width="100%" align="center" border="0" cellpadding="5"
       cellspacing="1" bgcolor="#dddddd">
    <tr>
        <td bgcolor="#ffffff" align="right" width="120px">区域信息：</td>
        <td bgcolor="#ffffff">
            <!-- 省 -->
            <select id="province"name="province" onchange="changeCity()">
                <option value="">-- 请选择省 --</option>
            </select>&nbsp;&nbsp;&nbsp;
            <!-- 市 -->
            <select id="city" name="city" onchange="changeDistrict()">
                <option value="">-- 请选择市 --</option>
            </select>&nbsp;&nbsp;&nbsp;
            <!-- 县(区) -->
            <select id="district" name="district" onchange="changeDhiddenValue()">
                <option value="">-- 请选择县(区) --</option>
            </select>
            <!-- 添加隐藏域，用来提交给后台省市区对应的中文名 -->
            <input type="hidden" name="phidden" id="phidden">
            <input type="hidden" name="chidden" id="chidden">
            <input type="hidden" name="dhidden" id="dhidden">
        </td>
    </tr>
</table>
</div>
<jsp:include page="pagination.jsp"/>
</body>
<script type="text/javascript">
    $(function(){
        $.ajax({
            type:"POST",
            url:"/Blog/lin/testPCD",
            data:{"pid":0},
            dataType:"json",
            success:function(data){
                console.log('success'+data);
                for(var i=0;i<data.length;i++){
                    var $option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    $("#province").append($option);
                }
            },
            fail:function () {
                alert("fail");
            }
        });
    });

    function changeCity(){
        //当省的内容发生变化的时候，响应的改变省的隐藏域的值
        $("#phidden").val($("#province option:selected").html());
        //页面加载完成，将省的信息加载完成
        //下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
        var pid = $("#province").val();
        $.ajax({
            url:"/Blog/lin/testPCD",
            data:{"pid":pid},
            dataType:"json",
            success:function(data){
                //清空城市下拉列表框的内容
                $("#city").html("<option value=''>-- 请选择市 --</option>");
                $("#district").html("<option value=''>-- 请选择区/县 --</option>");
                //遍历json，json数组中每一个json，都对应一个省的信息，都应该在省的下拉列表框下面添加一个<option>
                for(var i=0;i<data.length;i++){
                    var $option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    $("#city").append($option);
                }
            }
        });
    }

    function changeDistrict(){
        //当城市的内容发生变化的时候，相应的改变城市的隐藏域的值
        $("#chidden").val($("#city option:selected").html());
        //页面加载完成，将省的信息加载完成
        //下拉列表框标签对象的val()方法就是选中的option标签的value的属性值
        var pid = $("#city").val();
        $.ajax({
            url:"/Blog/lin/testPCD",
            data:{"pid":pid},
            dataType:"json",
            success:function(data){
                //清空城市下拉列表框的内容
                $("#district").html("<option value=''>-- 请选择区/县 --</option>");
                for(var i=0;i<data.length;i++){
                    var $option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    $("#district").append($option);
                }
            }
        });
    }

    function changeDhiddenValue(){
        //当城市的内容发生变化的时候，相应的改变城市的隐藏域的值
        $("#dhidden").val($("#district option:selected").html());
    }
</script>
</html>