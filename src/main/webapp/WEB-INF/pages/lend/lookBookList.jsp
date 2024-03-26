<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Timeline query</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/public.css" media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>Book lending timeline</legend>
</fieldset>
<ul class="layui-timeline">
<c:forEach var="lend" items="${info}" varStatus="status">
    <li class="layui-timeline-item">
        <i class="layui-icon layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <div class="layui-timeline-title">
                <fmt:formatDate value="${lend.lendDate}" pattern="yyyy-MM-dd HH:mm:ss" /> <br/>
                <span style="color: red"> ${lend.reader.name}</span> borrowed< <span style="color: crimson">${lend.bookInfo.name}</span> ><br/>
                <c:if test="${lend.backDate == null}">
                    Not returned
                </c:if>
                <c:if test="${lend.backDate != null}">
                    <fmt:formatDate value="${lend.backDate}" pattern="yyyy-MM-dd HH:mm:ss" /> <span style="color: green">Returned</span>,
                </c:if>
            </div>
        </div>
    </li>
</c:forEach>

</ul>
<script src="<%=basePath%>lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
</body>
</html>
