<%@page import="model.Produtos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Produtos> dados = new Produtos().getAllTableEntities();
    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>

<%@ include file="/home/app/modulos.jsp"%>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Produtos</h1>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Categoria</th>
            <th>Fornecedor</th>
            <th>Estoque</th>
            <th>Valor</th>
            <th>Ações</th>
        </tr>
    </thead>

    <tbody>
        <% for (Produtos p : dados) { %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNome() %></td>
            <td><%= p.getCategoriasId() %></td>
            <td><%= p.getFornecedoresId() %></td>
            <td><%= p.getQtdd_estoque() %></td>
            <td>R$ <%= p.getValor()%></td>

            <td>
                <a class="btn"
                   href="<%= request.getContextPath()%>/home/app/adm/produto_form.jsp?action=update&id=<%= p.getId() %>">
                   Editar
                </a>

                <a class="btn" style="background:#c0392b;"
                   href="<%= request.getContextPath()%>/home?task=produtos&action=delete&id=<%= p.getId() %>"
                   onclick="return confirm('Excluir produto?')">
                   Excluir
                </a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

</div>

<a class="btn" style="max-width:200px; margin:20px auto; display:block; text-align:center;"
   href="<%= request.getContextPath() %>/home/app/adm/produto_form.jsp?action=create">
    Adicionar Produto
</a>

</body>
</html>
