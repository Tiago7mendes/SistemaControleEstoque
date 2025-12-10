<%@page import="model.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Categorias> dados = new Categorias().getAllTableEntities();
    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Categorias</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>

<%@ include file="/home/app/modulos.jsp"%>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Categorias</h1>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ações</th>
        </tr>
    </thead>

    <tbody>
        <% for (Categorias c : dados) { %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getNome() %></td>

            <td>
                <a class="btn"
                   href="<%= request.getContextPath()%>/home/app/adm/categoria_form.jsp?action=update&id=<%= c.getId() %>">
                   Editar
                </a>

                <a class="btn" style="background:#c0392b;"
                   href="<%= request.getContextPath()%>/home?task=categorias&action=delete&id=<%= c.getId() %>"
                   onclick="return confirm('Excluir categoria?')">
                   Excluir
                </a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

</div>

<a class="btn" style="max-width:200px; margin:20px auto; display:block; text-align:center;"
   href="<%= request.getContextPath() %>/home/app/adm/categoria_form.jsp?action=create">
    Adicionar Categoria
</a>

</body>
</html>
