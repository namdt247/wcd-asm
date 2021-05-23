<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Food" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Food> listFoods = (ArrayList<Food>) request.getAttribute("list"); %>
<% int total = (int) request.getAttribute("total"); %>
<% int pages = (int) request.getAttribute("pages"); %>
<% String errors = (String) request.getAttribute("errors"); %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
            integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
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
                <a class="nav-link" href="/admin/foods/list">Danh sách món ăn</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container mt-3">
    <h3>Danh sách món ăn</h3>
    <div class="text-right my-2">
        <a href="/admin/foods/create" class="btn btn-danger">Tạo mới</a>
    </div>
    <div class="text-danger">
        <% if (errors != null) {%>
            <%=errors%>
        <%}%>
        <%=errors%>
    </div>
    <div>
        <div class="">
            <table class="table">
                <thead class="thead-info">
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên món ăn</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Mô tả</th>
                    <th scope="col">Danh mục</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <% if (listFoods != null && listFoods.size() > 0) {
                    for (int i = 0; i < listFoods.size(); i++) {
                %>
                <tr>
                    <th scope="row"><%= listFoods.get(i).getId() %></th>
                    <td><%= listFoods.get(i).getName() %></td>
                    <td><%= listFoods.get(i).getPrice() %></td>
                    <td>
                        <img src="<%= listFoods.get(i).getThumbnail() %>" alt="thumbnail" width="80" height="80"/>
                    </td>
                    <td><%= listFoods.get(i).getDescription() %></td>
                    <td><%= listFoods.get(i).getCategoryName(listFoods.get(i).getCategoryId()).getName() %></td>
                    <td class="text-danger">
                        <%= listFoods.get(i).getStatus() == 1 ? "Đang bán" : "Dừng bán" %>
                    </td>
                    <td>
                        <a href="/admin/foods/edit?foodId=<%=listFoods.get(i).getId()%>"
                           class="badge badge-primary">Chi tiết</a> |
                        <a href="/admin/foods/delete?id=<%=listFoods.get(i).getId()%>"
                           class="badge badge-danger" id="btn-delete-food">Xoá</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination" style="align-content: center">
                    <% //Button Previous
                        int back = 0;
                        if (pages == 0 || pages == 1) {
                            back = 1;//Luon la page 1
                        } else {
                            back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                        }
                    %>
                    <li class="page-item"><a class="page-link" href="list?pages=<%=back%>">Previous</a></li>
                    <%
                        //Button Number pages
                        int loop = 0, num = 0;
                        if ((total / 5) % 2 == 0) {
                            num = total / 5;
                        } else {
                            num = (total + 1) / 5;
                        }
                        //Nếu total lẻ thêm 1
                        if (total % 5 == 1) {
                            loop = (total / 5) + 1;

                        } else {
                            //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                            if (total < (num * 5) + 5 && total != num * 5) {
                                loop = (total / 5) + 1;
                            } else {
                                //Nếu bằng fullPage thì không thêm
                                loop = (total / 5);
                            }
                        }
                        //Lap so pages
                        for (int i = 1; i <= loop; i++) {%>
                    <% if (pages == i) {%>
                    <li class="page-item active">
                        <a class="page-link" href="list?pages=<%=i%>"><%=i%> <span class="sr-only">(current)</span></a>
                    </li>
                    <%} else {%>
                    <li class="page-item"><a class="page-link" href="list?pages=<%=i%>"><%=i%>
                    </a></li>

                    <%
                            }
                        }
                    %>
                    <%
                        //Button Next
                        int next = 0;
                        //Nếu total lẻ
                        if (total % 2 != 1) {
                            if (pages == (total / 5) + 1) {
                                next = pages;//Khong next
                            } else {
                                next = pages + 1;//Co next
                            }
                        } else {
                            //Nếu total chẵn nhỏ hơn fullpage
                            //Và không fullPage thì thêm 1
                            if (total < (num * 5) + 5 && total != num * 5) {
                                if (pages == (total / 5) + 1) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            } else {
                                //Nếu fullPage đến trang cuối dừng
                                //Chưa tới trang cuối thì được next
                                if (pages == (total / 5)) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            }
                        }
                    %>
                    <li class="page-item"><a class="page-link" href="list?pages=<%=next%>">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#btn-delete-food").click(function (e) {
            e.preventDefault();
            if (confirm("Bạn có chắc chắn muốn xoá?")) {
                window.location = e.target.href;
            }
        })
    })
</script>
</body>
</html>
