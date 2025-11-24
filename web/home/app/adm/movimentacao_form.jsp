<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Produtos" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Movimentação</title>
</head>
<body>

<%
    List<Produtos> produtos = (List<Produtos>) request.getAttribute("produtos");
%>

<h1>Nova Movimentação</h1>

<form action="MovimentacaoController" method="post">

    <input type="hidden" name="action" value="inserir">

    Tipo:<br>
    <select name="tipo" required>
        <option value="">Selecione</option>
        <option value="entrada">Entrada</option>
        <option value="saida">Saída</option>
    </select><br><br>

    Produto:<br>
    <select name="produto_id" required>
        <option value="">Selecione</option>
        <% for (Produtos p : produtos) { %>
            <option value="<%= p.getId() %>"><%= p.getNome() %></option>
        <% } %>
    </select><br><br>

    Quantidade:<br>
    <input type="number" name="quantidade" required><br><br>

    Observação:<br>
    <input type="text" name="observacao"><br><br>

    <button type="submit">Salvar</button>
</form>

</body>
</html>