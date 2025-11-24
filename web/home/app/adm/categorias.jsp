<%@page import="model.Categorias"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Categorias</title>
    <link rel="stylesheet" href="style.css"> <!-- Se você usar um CSS -->
</head>
<body>

<h1>Categorias</h1>

<a href="categoria_form.jsp">+ Nova Categoria</a>
<br><br>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Ações</th>
    </tr>

    <%
        List<Categorias> lista = (List<Categorias>) request.getAttribute("lista");
        if (lista != null) {
            for (Categorias c : lista) {
    %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getNome() %></td>
        <td>
            <a href="CategoriaController?action=editar&id=<%= c.getId() %>">Editar</a> |
            <a href="CategoriaController?action=excluir&id=<%= c.getId() %>"
               onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
        </td>
    </tr>
    <% } } %>
</table>

</body>
</html>
