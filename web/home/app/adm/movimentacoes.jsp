<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Movimentacoes" %>

<!DOCTYPE html>
<html>
<head>
    <title>Movimentações</title>
</head>
<body>

<h1>Movimentações de Estoque</h1>

<a href="MovimentacaoController?action=formNova">+ Registrar Movimentação</a>
<br><br>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Tipo</th>
        <th>Produto</th>
        <th>Quantidade</th>
        <th>Usuário</th>
    </tr>

    <%
        List<Movimentacoes> lista = (List<Movimentacoes>) request.getAttribute("lista");
        if (lista != null) {
            for (Movimentacoes m : lista) {
    %>
    <tr>
        <td><%= m.getId() %></td>
        <td><%= m.getTipo() %></td>
        <td><%= m.getProdutosId() %></td>
        <td><%= m.getQtdd() %></td>
        <td><%= m.getUsuariosId() %></td>
    </tr>
    <%  } } %>
</table>

</body>
</html>
