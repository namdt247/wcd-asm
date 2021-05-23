
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
    List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
%>

<html>
<head>
    <title>Tạo mới món ăn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="../../asset/logo-restaurant.png" height="80" width="80" class="rounded-circle" />
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Trang chủ<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Danh sách món ăn</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container mt-3">
    <h3>Tạo mới món ăn</h3>
    <div class="">
        <form action="/admin/foods/create" method="post">
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label>Tên món ăn</label>
                        <input type="text" class="form-control" name="name"
                               placeholder="Tên món ăn" />
                    </div>

                    <div class="form-group">
                        <label>Danh mục</label>
                        <select name="categoryId" class="form-select form-control" aria-label="Default select example">
                            <c:forEach items="${categoryList}" var="cate">
                                <option value="${cate.getId()}">${cate.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Mô tả chi tiết món ăn</label>
                        <input type="text" name="description" class="form-control"
                               placeholder="Nhập mô tả chi tiết món ăn" />
                    </div>
                    <div class="form-group">
                        <label>Ảnh món ăn</label>
                        <input type="text" name="thumbnail" class="form-control"
                               placeholder="Hình ảnh món ăn" />
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <input type="text" name="price" class="form-control"
                               placeholder="Nhập giá món ăn" />
                    </div>
                    <c:forEach items="${errors}" var="item">
                        <div class="text-danger">
                            ${item.value}
                        </div>
                    </c:forEach>
                    <div class="mt-2">
                        <button type="submit" class="btn btn-primary">Tạo mới</button>
                        <button type="reset" class="btn btn-warning ml-2">Làm mới</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
