<%@page import="model.TipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<TipoUsuario> dados = new TipoUsuario().getAllTableEntities();
    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Tipos de Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>
<%@ include file="/home/app/modulos.jsp" %>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Tipos de Usuário</h1>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Módulo Admin</th>
            <th>Módulo Compras</th>
            <th>Ações</th>
        </tr>
    </thead>

    <tbody>
        <% for (TipoUsuario tp : dados) { %>
        <tr>
            <td><%= tp.getId() %></td>
            <td><%= tp.getNome() %></td>
            <td><%= tp.getModuloAdmin() %></td>
            <td><%= tp.getModuloCompras() %></td>

            <td>
                <a class="btn"
                   href="<%= request.getContextPath()%>/home/app/adm/tipousuario_form.jsp?action=update&id=<%= tp.getId() %>">
                   Editar
                </a>
                <a class="btn" style="background:#c0392b;"
                   href="<%= request.getContextPath()%>/home?task=tipousuario&action=delete&id=<%= tp.getId() %>"
                   onclick="return confirm('Excluir este tipo de usuário?')">
                   Excluir
                </a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

</div>

<a class="btn" style="max-width:200px; margin:20px auto; display:block; text-align:center;"
   href="<%= request.getContextPath() %>/home/app/adm/tipousuario_form.jsp?action=create">Adicionar Tipo</a>

</body>
</html>
