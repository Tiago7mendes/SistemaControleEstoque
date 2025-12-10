<%@page import="model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%
ArrayList<Produtos> lista = (ArrayList<Produtos>) request.getAttribute("produtos");
String msg = (String) request.getAttribute("msg");
if (lista == null) lista = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Compras</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
            max-width: 1100px;
            margin: 0 auto;
        }

        .card {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 4px 15px var(--shadow);
            transition: 0.25s;
        }

        .card:hover {
            transform: translateY(-6px);
        }

        .card h3 {
            margin-bottom: 10px;
            color: var(--title);
        }

        .card p {
            margin: 4px 0;
            color: var(--text-light);
        }

        .comprar-btn {
            margin-top: 12px;
            width: 100%;
            padding: 10px;
            background: var(--primary);
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .comprar-btn:hover {
            background: var(--primary-hover);
        }
    </style>

</head>

<body>
<%@ include file="/home/app/modulos.jsp"%>

<% if (msg != null) { %>
<script>alert("<%= msg %>");</script>
<% } %>

<h1>Produtos para Compra</h1>

<div class="cards">

<% for (Produtos p : lista) { %>
    <div class="card">
        <h3><%= p.getNome() %></h3>
        <p><strong>Preço:</strong> R$ <%= p.getValor()%></p>
        <p><strong>Estoque:</strong> <%= p.getQtdd_estoque()%></p>
        <p><%= p.getDescricao() %></p>

        <form action="<%= request.getContextPath() %>/home?task=comprarProduto" method="post">
            <input type="hidden" name="id_produto" value="<%= p.getId() %>">

            <label>Quantidade:</label>
            <input type="number" name="quantidade" min="1" required>

            <button class="comprar-btn">Comprar</button>
        </form>
    </div>
<% } %>

</div>

</body>
</html>
