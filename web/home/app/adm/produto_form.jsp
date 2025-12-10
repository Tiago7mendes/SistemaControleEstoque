<%@page import="model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>
<body>

<%@ include file="/home/app/modulos.jsp"%>

<%
    Produtos p = null;
    String action = request.getParameter("action");

    if (action == null) action = "create";
    else if (action.equals("update")) {
        int id = Integer.valueOf(request.getParameter("id"));
        p = new Produtos();
        p.setId(id);
        p.load();
    }
%>

<h1><%= action.equals("create") ? "Cadastrando Produto" : "Editando Produto" %></h1>

<form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=produtos" method="post">

    <label for="id">ID:</label>
    <input type="text" id="id" name="id" pattern="\d+"
           value="<%= (p != null) ? p.getId() : "" %>"
           <%= (p != null) ? "readonly" : "" %> required>
    <br>

    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome"
           value="<%= (p != null) ? p.getNome() : "" %>">
    <br>

    <label for="descricao">Descrição:</label>
    <input type="text" id="descricao" name="descricao"
           value="<%= (p != null) ? p.getDescricao() : "" %>">
    <br>

    <label for="valor">Valor:</label>
    <input type="text" id="valor" name="valor" pattern="\d+(\.\d+)?"
           value="<%= (p != null) ? p.getValor() : "" %>">
    <br>

    <label for="qtdd_estoque">Quantidade em Estoque:</label>
    <input type="text" id="qtdd_estoque" name="qtdd_estoque"
           value="<%= (p != null) ? p.getQtdd_estoque() : "" %>">
    <br>

    <label for="categoriasId">Categoria ID:</label>
    <input type="text" id="categoriasId" name="categoriasId" pattern="\d+"
           value="<%= (p != null) ? p.getCategoriasId() : "" %>">
    <br>

    <label for="fornecedoresId">Fornecedor ID:</label>
    <input type="text" id="fornecedoresId" name="fornecedoresId" pattern="\d+"
           value="<%= (p != null) ? p.getFornecedoresId() : "" %>">
    <br>

    <input type="submit" value="Salvar">
</form>

</body>
</html>
