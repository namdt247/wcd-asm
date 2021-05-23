<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Student> listStudents = (ArrayList<Student>) request.getAttribute("list"); %>
<% int total = (int) request.getAttribute("total"); %>
<% int pages = (int) request.getAttribute("pages"); %>

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
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <% if (listStudents != null && listStudents.size() > 0) {
                for (int i = 0; i < listStudents.size(); i++) {
            %>
            <tr>
                <th scope="row"><%= listStudents.get(i).getRollNumber() %>
                </th>
                <td><%= listStudents.get(i).getFullName() %>
                </td>
                <td><%= listStudents.get(i).getEmail() %>
                </td>
                <td><a href="/admin/students/detail?rollNumber=<%=listStudents.get(i).getRollNumber()%>" class="badge badge-primary">Detail</a> |
                    <a href="/admin/students/edit?rollNumber=<%=listStudents.get(i).getRollNumber()%>"
                       class="badge badge-success">Edit</a> |
                    <a href="/admin/students/delete?rollNumber=<%=listStudents.get(i).getRollNumber()%>"
                       class="badge badge-danger">Delete</a>
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
            <%                //Button Previous
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
                if ((total / 4) % 2 == 0) {
                    num = total / 4;
                } else {
                    num = (total + 1) / 4;
                }
                //Nếu total lẻ thêm 1
                if (total % 2 != 0) {
                    loop = (total / 4) + 1;

                } else {
                    //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                    if (total < (num * 4) + 4 && total != num * 4) {
                        loop = (total / 4) + 1;
                    } else {
                        //Nếu bằng fullPage thì không thêm
                        loop = (total / 4);
                    }
                }
                //Lap so pages
                for (int i = 1; i <= loop; i++) {%>
            <% if (pages == i) {%>
            <li class="page-item active">
                <a class="page-link" href="list?pages=<%=i%>"><%=i%> <span class="sr-only">(current)</span></a>
            </li>
            <%} else {%>
            <li class="page-item"><a class="page-link" href="list?pages=<%=i%>"><%=i%></a></li>

            <%}
            }%>
            <%
                //Button Next
                int next = 0;
                //Nếu total lẻ
                if (total % 2 != 0) {
                    if (pages == (total / 4) + 1) {
                        next = pages;//Khong next
                    } else {
                        next = pages + 1;//Co next
                    }
                } else {
                    //Nếu total chẵn nhỏ hơn fullpage
                    //Và không fullPage thì thêm 1
                    if (total < (num * 4) + 4 && total != num * 4) {
                        if (pages == (total / 4) + 1) {
                            next = pages;//Khong next
                        } else {
                            next = pages + 1;//Co next
                        }
                    } else {
                        //Nếu fullPage đến trang cuối dừng
                        //Chưa tới trang cuối thì được next
                        if (pages == (total / 4)) {
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
        <div>
            <a href="/admin/students/create" class="badge badge-primary">Create</a>
        </div>
    </div>
</div>
</body>
</html>
