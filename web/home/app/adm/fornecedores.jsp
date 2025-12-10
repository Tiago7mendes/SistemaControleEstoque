<%@page import="model.Fornecedores"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Fornecedores> dados = new Fornecedores().getAllTableEntities();
    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Fornecedores</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>

<%@ include file="/home/app/modulos.jsp"%>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Fornecedores</h1>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CNPJ</th>
            <th>Telefone</th>
            <th>Endereço</th>
            <th>Ações</th>
        </tr>
    </thead>

    <tbody>
        <% for (Fornecedores f : dados) { %>
        <tr>
            <td><%= f.getId() %></td>
            <td><%= f.getNome() %></td>
            <td><%= f.getCnpj() %></td>
            <td><%= f.getTelefone() %></td>
            <td><%= f.getEndereco() %></td>

            <td>
                <a class="btn"
                   href="<%= request.getContextPath()%>/home/app/adm/fornecedor_form.jsp?action=update&id=<%= f.getId() %>">
                   Editar
                </a>

                <a class="btn" style="background:#c0392b;"
                   href="<%= request.getContextPath()%>/home?task=fornecedores&action=delete&id=<%= f.getId() %>"
                   onclick="return confirm('Excluir fornecedor?')">
                   Excluir
                </a>
            </td>
        </tr>

        <% } %>
    </tbody>
</table>

</div>

<a class="btn" style="max-width:200px; margin:20px auto; display:block; text-align:center;"
   href="<%= request.getContextPath() %>/home/app/adm/fornecedor_form.jsp?action=create">
    Adicionar Fornecedor
</a>

</body>
</html>
