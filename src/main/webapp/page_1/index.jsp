<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html;charset=utf-8"%>
    <style><%@include file="/page_1/style.css"%></style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>123-IAIT-22</title>
</head>
<body>
    <div>
        <form id="upload-container" method="POST" action="import_references" enctype = "multipart/form-data">
            <div class="text-upload">
                <input id="file-input" type="file" name="file">
                <label for="file-input">Оцениваемые объекты...</label>
            </div>
            <button id="upload-button">Загрузить</button>
        </form>
        <div class="out">
        <%
        String inc = request.getParameter("incorrect");
        String mes = "";
        if (inc != null && inc.equals("1")) {
           mes = "Некорректный файл!";
        }
        %>
        <%= mes %>
        </div>
    </div>
</body>
</html>