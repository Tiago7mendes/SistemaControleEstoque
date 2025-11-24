<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Produtos" %>
<%@ page import="model.Categorias" %>
<%@ page import="model.Fornecedores" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Produto</title>
</head>
<body>

<%
    Produtos p = (Produtos) request.getAttribute("produto");
    boolean editando = (p != null);

    List<Categorias> categorias = (List<Categorias>) request.getAttribute("categorias");
    List<Fornecedores> fornecedores = (List<Fornecedores>) request.getAttribute("fornecedores");
%>

<h1><%= editando ? "Editar Produto" : "Novo Produto" %></h1>

<form action="ProdutoController" method="post">

    <input type="hidden" name="action" value="<%= editando ? "atualizar" : "inserir" %>">

    <% if (editando) { %>
    <input type="hidden" name="id" value="<%= p.getId() %>">
    <% } %>

    Nome:<br>
    <input type="text" name="nome" value="<%= editando ? p.getNome() : "" %>" required><br><br>

    Descrição:<br>
    <textarea name="descricao" required><%= editando ? p.getDescricao() : "" %></textarea><br><br>

    Valor:<br>
    <input type="number" step="0.01" name="valor" value="<%= editando ? p.getValor() : "" %>" required><br><br>

    Quantidade em Estoque:<br>
    <input type="number" name="qtdd" value="<%= editando ? p.getQtdd_estoque() : "" %>" required><br><br>

    Categoria:<br>
    <select name="categoria_id" required>
        <option value="">Selecione</option>
        <% for (Categorias c : categorias) { %>
            <option value="<%= c.getId() %>" <%= editando && p.getCategoriasId() == c.getId() ? "selected" : "" %>>
                <%= c.getNome() %>
            </option>
        <% } %>
    </select><br><br>

    Fornecedor:<br>
    <select name="fornecedor_id" required>
        <option value="">Selecione</option>
        <% for (Fornecedores f : fornecedores) { %>
            <option value="<%= f.getId() %>" <%= editando && p.getFornecedoresId() == f.getId() ? "selected" : "" %>>
                <%= f.getNome() %>
            </option>
        <% } %>
    </select><br><br>

    <button type="submit">Salvar</button>
    <a href="ProdutosController">Cancelar</a>
</form>

</body>
</html>
