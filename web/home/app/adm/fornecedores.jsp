<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Fornecedores" %>

<!DOCTYPE html>
<html>
<head>
    <title>Fornecedores</title>
</head>
<body>

<h1>Fornecedores</h1>

<a href="fornecedor_form.jsp">+ Novo Fornecedor</a>
<br><br>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>CNPJ</th>
        <th>Telefone</th>
        <th>Endereço</th>
        <th>Ações</th>
    </tr>

    <%
        List<Fornecedores> lista = (List<Fornecedores>) request.getAttribute("lista");
        if (lista != null) {
            for (Fornecedores f : lista) {
    %>
    <tr>
        <td><%= f.getId() %></td>
        <td><%= f.getNome() %></td>
        <td><%= f.getCnpj() %></td>
        <td><%= f.getTelefone() %></td>
        <td><%= f.getEndereco() %></td>
        <td>
            <a href="FornecedorController?action=editar&id=<%= f.getId() %>">Editar</a> |
            <a href="FornecedorController?action=excluir&id=<%= f.getId() %>" 
               onclick="return confirm('Confirmar exclusão?')">Excluir</a>
        </td>
    </tr>
    <%  } } %>
</table>

</body>
</html>
