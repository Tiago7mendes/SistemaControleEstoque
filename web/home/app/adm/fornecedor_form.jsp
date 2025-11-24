<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Fornecedores" %>

<!DOCTYPE html>
<html>
<head>
    <title>Fornecedor</title>
</head>
<body>

<%
    Fornecedores f = (Fornecedores) request.getAttribute("fornecedor");
    boolean editando = (f != null);
%>

<h1><%= editando ? "Editar Fornecedor" : "Novo Fornecedor" %></h1>

<form action="FornecedorController" method="post">

    <input type="hidden" name="action" value="<%= editando ? "atualizar" : "inserir" %>">

    <% if (editando) { %>
    <input type="hidden" name="id" value="<%= f.getId() %>">
    <% } %>

    Nome: <br>
    <input type="text" name="nome" value="<%= editando ? f.getNome() : "" %>" required>
    <br><br>

    CNPJ: <br>
    <input type="text" name="cnpj" value="<%= editando ? f.getCnpj() : "" %>">
    <br><br>

    Telefone: <br>
    <input type="text" name="telefone" value="<%= editando ? f.getTelefone() : "" %>">
    <br><br>

    Endereço: <br>
    <input type="text" name="endereco" value="<%= editando ? f.getEndereco() : "" %>">
    <br><br>

    <button type="submit">Salvar</button>
    <a href="fornecedores.jsp">Cancelar</a>
</form>

</body>
</html>
