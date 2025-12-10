<%@page import="model.Movimentacoes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Movimentações</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/home/app/modulos.jsp"%>

    <% ArrayList<Movimentacoes> dados = new Movimentacoes().getAllTableEntities(); %>

    <h1>Movimentações</h1>
    <div class="container">

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tipo</th>
                <th>Quantidade</th>
                <th>Observação</th>
                <th>Usuário ID</th>
                <th>Produto ID</th>
                <th>Ações</th>
            </tr>
        </thead>

        <tbody>
            <% for(Movimentacoes m : dados) { %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getTipo() %></td>
                <td><%= m.getQtdd() %></td>
                <td><%= m.getObservacao() %></td>
                <td><%= m.getUsuariosId() %></td>
                <td><%= m.getProdutosId() %></td>

                <td>
                    <a href="<%= request.getContextPath() %>/home/app/adm/movimentacao_form.jsp?action=update&id=<%= m.getId() %>">Alterar</a>
                    <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= m.getId() %>&task=movimentacoes"
                       onclick="return confirm('Deseja excluir Movimentação <%= m.getId() %> (<%= m.getTipo() %>) ?')">
                        Excluir
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>

    <a href="<%= request.getContextPath() %>/home/app/adm/movimentacao_form.jsp?action=create">Adicionar</a>
</body>
</html>
