<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Categorias" %>

<!DOCTYPE html>
<html>
<head>
    <title>Categoria</title>
</head>
<body>

<%
    Categorias c = (Categorias) request.getAttribute("categoria");
    boolean editando = (c != null);
%>

<h1><%= editando ? "Editar Categoria" : "Nova Categoria" %></h1>

<form action="CategoriaController" method="post">

    <input type="hidden" name="action" value="<%= editando ? "atualizar" : "inserir" %>">

    <% if (editando) { %>
    <input type="hidden" name="id" value="<%= c.getId() %>">
    <% } %>

    Nome: <br>
    <input type="text" name="nome" value="<%= editando ? c.getNome() : "" %>" required>
    <br><br>

    <button type="submit">Salvar</button>
    <a href="categorias.jsp">Cancelar</a>
</form>

</body>
</html>
