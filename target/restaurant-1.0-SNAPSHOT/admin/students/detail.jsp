<%@ page import="entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:28
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
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">RollNumber</th>
                <th scope="col">FullName</th>
                <th scope="col">Email</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row"><%= student.getRollNumber() %>
                </th>
                <td><%= student.getFullName() %>
                </td>
                <td><%= student.getEmail() %>
                </td>
            </tr>
            </tbody>
        </table>
        <div>
            <a href="/admin/students/list" class="badge badge-primary">Back</a>
        </div>
    </div>
</div>
</body>
</html>
