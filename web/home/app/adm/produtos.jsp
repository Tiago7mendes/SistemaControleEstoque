<%@page import="model.Produtos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/home/app/modulos.jsp"%>

    <% ArrayList<Produtos> dados = new Produtos().getAllTableEntities(); %>

    <h1>Produtos</h1>
    <div class="container">

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Valor</th>
                <th>Qtdd Estoque</th>
                <th>Categoria</th>
                <th>Fornecedor</th>
                <th>Ações</th>
            </tr>
        </thead>

        <tbody>
            <% for(Produtos p : dados) { %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getDescricao() %></td>
                <td><%= p.getValor() %></td>
                <td><%= p.getQtdd_estoque() %></td>
                <td><%= p.getCategoriasId() %></td>
                <td><%= p.getFornecedoresId() %></td>

                <td>
                    <a href="<%= request.getContextPath() %>/home/app/adm/produto_form.jsp?action=update&id=<%= p.getId() %>">Alterar</a>
                    <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= p.getId() %>&task=produtos"
                       onclick="return confirm('Deseja excluir Produto <%= p.getId() %> (<%= p.getNome() %>) ?')">
                        Excluir
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>

    <a href="<%= request.getContextPath() %>/home/app/adm/produto_form.jsp?action=create">Adicionar</a>
</body>
</html>
