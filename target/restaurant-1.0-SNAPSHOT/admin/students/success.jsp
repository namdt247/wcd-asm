<%@ page import="entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Student student = (Student) request.getAttribute("student");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    RollNumber: <%= student.getRollNumber() %>
</div>
<div>
    FullName: <%= student.getFullName() %>
</div>
<div>
    Email: <%= student.getEmail() %>
</div>
</body>
</html>
