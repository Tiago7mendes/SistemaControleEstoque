<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Produtos" %>
<%@ page import="model.Categorias" %>
<%@ page import="model.Fornecedores" %>

<!DOCTYPE html>
<html>
<head>
    <title>Produtos</title>
</head>
<body>

<h1>Produtos</h1>

<a href="ProdutoController?action=formNovo">+ Novo Produto</a>
<br><br>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Categoria</th>
        <th>Fornecedor</th>
        <th>Valor</th>
        <th>Quantidade</th>
        <th>Ações</th>
    </tr>

    <%
        List<Produtos> lista = (List<Produtos>) request.getAttribute("lista");
        if (lista != null) {
            for (Produtos p : lista) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getNome() %></td>
        <td><%= p.getCategoriasId() %></td>
        <td><%= p.getFornecedoresId() %></td>
        <td>R$ <%= p.getValor() %></td>
        <td><%= p.getQtdd_estoque() %></td>
        <td>
            <a href="ProdutoController?action=editar&id=<%= p.getId() %>">Editar</a> |
            <a href="ProdutoController?action=excluir&id=<%= p.getId() %>"
               onclick="return confirm('Confirmar exclusão?')">Excluir</a>
        </td>
    </tr>
    <%  } } %>
</table>

</body>
</html>
