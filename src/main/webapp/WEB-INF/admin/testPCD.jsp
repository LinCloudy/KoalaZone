<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="Generator" content="ECSHOP v2.7.3" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <title>提交订单</title>
</head>
<body>
<div class="block clearfix"><div class="AreaR">
    <div class="block box"><div class="blank"></div>
    </div><div class="blank"></div><div class="box"><div class="box_1">
    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
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

    </div></div></div></div></div>


</body>
<script src="<%=contextPath%>/static/assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
    $(function(){
        $.ajax({
            type:"POST",
            url:"/Blog/lin/test",
            data:{"pid":0},
            dataType:"json",
            success:function(data){
                console.log(data[0]);
                for(var i=0;i<data[0].length;i++){
                    var $option = $("<option value='"+data[0][i].id+"'>"+data[0][i].name+"</option>");
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