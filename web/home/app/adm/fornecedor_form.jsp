<%@page import="model.Fornecedores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fornecedores</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/home/app/modulos.jsp"%>

<%
    Fornecedores f = null;
    String action = request.getParameter("action");

    if (action == null) action = "create";
    else if (action.equals("update")) {
        int id = Integer.valueOf(request.getParameter("id"));
        f = new Fornecedores();
        f.setId(id);
        f.load();
    }
%>

<h1><%= action.equals("create") ? "Cadastrando Fornecedor" : "Editando Fornecedor" %></h1>

<form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=fornecedores" method="post">

    <label for="id">ID:</label>
    <input type="text" id="id" name="id" pattern="\d+"
           value="<%= (f != null) ? f.getId() : "" %>"
           <%= (f != null) ? "readonly" : "" %> required>
    <br>

    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome"
           value="<%= (f != null) ? f.getNome() : "" %>">
    <br>

    <label for="cnpj">CNPJ:</label>
    <input type="text" id="cnpj" name="cnpj"
           value="<%= (f != null) ? f.getCnpj() : "" %>">
    <br>

    <label for="telefone">Telefone:</label>
    <input type="text" id="telefone" name="telefone"
           value="<%= (f != null) ? f.getTelefone() : "" %>">
    <br>

    <label for="endereco">Endereço:</label>
    <input type="text" id="endereco" name="endereco"
           value="<%= (f != null) ? f.getEndereco() : "" %>">
    <br>

    <input type="submit" value="Salvar">
</form>

</body>
</html>
