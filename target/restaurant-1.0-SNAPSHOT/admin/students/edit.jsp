<%@ page import="entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Student student = (Student) request.getAttribute("list"); %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="">
        <form action="/admin/students/edit" method="post">
            <div class="form-group">
                <label>RollNumber</label>
                <input type="text" class="form-control" name="rollNumber" placeholder="RollNumber" value="<%= student.getRollNumber() %>">
            </div>
            <div class="form-group">
                <label>FullName</label>
                <input type="text" class="form-control" name="fullName" placeholder="FullName" value="<%= student.getFullName() %>">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                       aria-describedby="emailHelp" placeholder="Enter email" value="<%= student.getEmail() %>">
            </div>
<%--            <div class="form-group">--%>
<%--                <label >Status</label>--%>
<%--                <select name="status" class="form-select" aria-label="Default select example">--%>
<%--                    <option value="<%= student.getStatus() %>" selected><%= student.getStatus() %></option>--%>
<%--                    <option value="1">One</option>--%>
<%--                    <option value="2">Two</option>--%>
<%--                    <option value="3">Three</option>--%>
<%--                </select>--%>
<%--            </div>--%>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
