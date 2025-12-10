<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Usuario> dados = new Usuario().getAllTableEntities();
    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Usuários</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>

<%@ include file="/home/app/modulos.jsp"%>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Usuários</h1>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>Email</th>
            <th>Tipo Usuário</th>
            <th>Ações</th>
        </tr>
    </thead>

    <tbody>
        <% for (Usuario us : dados) { %>
        <tr>
            <td><%= us.getId() %></td>
            <td><%= us.getNome() %></td>
            <td><%= us.getCpf() %></td>
            <td><%= us.getEmail() %></td>
            <td><%= us.getTipoUsuarioId() %></td>

            <td>
                <a class="btn" 
                   href="<%= request.getContextPath() %>/home/app/adm/usuario_form.jsp?action=update&id=<%= us.getId() %>">
                    Editar
                </a>

                <a class="btn" 
                   style="background:#c0392b;" 
                   href="<%= request.getContextPath() %>/home?task=usuario&action=delete&id=<%= us.getId() %>"
                   onclick="return confirm('Deseja excluir o usuário <%= us.getNome() %>?')">
                    Excluir
                </a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

</div>

<a class="btn" 
   style="max-width:200px; margin:20px auto; display:block; text-align:center;" 
   href="<%= request.getContextPath() %>/home/app/adm/usuario_form.jsp?action=create">
    Adicionar Usuário
</a>

</body>
</html>
