<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<title>写博客</title>
<script src="<%=contextPath%>/static/jquery-3.1.1.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=contextPath%>/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=contextPath%>/static/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="<%=contextPath%>/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<link rel="stylesheet"
	href="<%=contextPath%>/static/ueditor/themes/default/css/ueditor.css" />
<script src="<%=contextPath%>/static/bootstrap/js/bootstrap.js"></script>
<link href="<%=contextPath%>/static/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link href="<%=contextPath%>/static/bootstrap/css/bootstrap-theme.css"
	rel="stylesheet" />
<link rel="shortcut icon"
	href="https://pandao.github.io/editor.md/favicon.ico"
	type="image/x-icon" />
</head>
<body style="width: 100%; height: 100%">
	<div class="container" style="width: 100%; height: 100%">
		<form method="post" action="/Blog/lin/write">
			<br> <br>
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group">
						<div class="input-group-btn">
							<c:choose>
								<c:when test="${article==null}">
									<button type="button" class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" id="categoryBtn">分类</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" id="categoryBtn">${article.category}
									</button>
								</c:otherwise>
							</c:choose>
							<ul class="dropdown-menu">
								<c:forEach var="category" items="${categories}">
									<li><a
										onclick="selectCategory('${category.name}','${category.displayName}');">${category.displayName}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<input name="category" id="cateoryInput" type="hidden">
						<c:choose>
							<c:when test="${article==null}">
								<input type="text" class="form-control" placeholder="标题"
									name="title">
							</c:when>
							<c:otherwise>
								<input name="id" type="hidden" value="${article.id}">
								<input type="text" class="form-control" placeholder="标题"
									name="title" value="${article.title}">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<br>
			<div id="layout" style="width: 100%; height: 100%">
				<c:choose>
					<c:when test="${article==null}">
						<script id="editor" type="text/plain"
							style="width: 1024px; height: 560px;"></script>
					</c:when>
					<c:otherwise>
						<script id="editor" type="text/plain"
							style="width: 1024px; height: 560px;">${article.content}</script>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="row">
				<div class="col-md-6 col-md-offset-6">
					<p>
						<input type="submit" class="btn btn-primary btn-lg" role="button"
							value="发表">
					</p>
				</div>
			</div>
		</form>
	</div>

	<br>

	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，
		//直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor',{
			//关闭elementPath
			elementPathEnabled:false,
			//默认的编辑区域高度
			initialFrameHeight:480,
			autoHeightEnabled: false
		});
	</script>
	
	<script type="text/javascript">
		UE.Editor.prototype._bkGetActionUrl=UE.Editor.prototype.getActionUrl;
		UE.Editor.prototype.getActionUrl=function(action){
			if(action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo'){
				return 'http://localhost:8080/Blog/uploadImage';
			}else{
				return this._bkGetActionUrl.call(this,action);
			}
		}
	</script>

	<script>
		function selectCategory(name, displayName) {
			$("#categoryBtn").html(displayName);
			$("#cateoryInput").val(name);
		}
	</script>

</body>
</html>