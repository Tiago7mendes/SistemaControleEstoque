<%@page import="model.Produtos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ArrayList<Produtos> lista = (ArrayList<Produtos>) request.getAttribute("produtos");
if (lista == null) lista = new Produtos().getAllTableEntities();

String msg = (String) request.getAttribute("msg");
%>

<%@ include file="/home/app/modulos.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Compras</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Produtos disponíveis</h1>

<div class="cards">

<% for (Produtos p : lista) { %>

    <div class="card">
        <h3><%= p.getNome() %></h3>
        <p><strong>Preço:</strong> R$ <%= p.getValor()%></p>
        <p><strong>Estoque:</strong> <%= p.getQtdd_estoque()%></p>
        <p><%= p.getDescricao() %></p>

        <form action="<%= request.getContextPath() %>/home?task=comprarProduto" method="post">
            <input type="hidden" name="id_produto" value="<%= p.getId() %>">

            <label>Quantidade</label>
            <input type="number" name="quantidade" min="1" required>

            <input type="submit" value="Comprar">
        </form>
    </div>

<% } %>

</div>

</body>
</html>
