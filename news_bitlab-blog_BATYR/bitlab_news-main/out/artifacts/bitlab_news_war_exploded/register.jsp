<%--
  Created by IntelliJ IDEA.
  User: omyrz
  Date: 24.04.2023
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <%@include file="components/head.jsp"%>
</head>
<body>
<%@include file="components/header.jsp"%>

<div class="container" style="min-height: 500px;">
    <div class="row mt-3">
        <div class="col-6 mx-auto">
            <%

                String emailError = request.getParameter("email_error");

                if(emailError!=null){

            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Email is busy!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%

                }

            %>
            <%
                String passwordError = request.getParameter("password_error");
                if(passwordError!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Passwords are not same!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                User added successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <form action="/register" method="post" >
                <div class="row">
                    <div class="col-12">
                        <label>EMAIL</label>
                    </div>

                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="email" class="form-control" required placeholder="Email" name="email">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>PASSWORD</label>
                        <div class="col-12" style="color: red">
                        <label id="emailMes"></label>
                    </div>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="password" class="form-control" required placeholder="Password" name="password" id="password">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>REPEAT PASSWORD</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="password" class="form-control" required placeholder="Repeat password" name="re_password">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>FULL NAME</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" required placeholder="Full name" name="full_name">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Role</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" required placeholder="Your role" name="role">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-success" id="sign" onclick="validate()" type="button">SIGN UP</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%@include file="components/footer.jsp"%>
    <script src="upload.js">
    </script>
</body>
</html>
