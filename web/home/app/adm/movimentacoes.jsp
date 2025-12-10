<%@page import="model.Movimentacoes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Movimentacoes> dados = new Movimentacoes().getAllTableEntities();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movimentações</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
</head>

<body>

<%@ include file="/home/app/modulos.jsp"%>

<h1>Movimentações</h1>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Produto</th>
            <th>Usuário</th>
            <th>Tipo</th>
            <th>Quantidade</th>
            <th>Observação</th>
            <th>Ações</th>
        </tr>
    </thead>

    <tbody>
        <% for (Movimentacoes m : dados) { %>
        <tr>
            <td><%= m.getId() %></td>
            <td><%= m.getProdutosId() %></td>
            <td><%= m.getUsuariosId() %></td>
            <td><%= m.getTipo() %></td>
            <td><%= m.getQtdd() %></td>
            <td><%= m.getObservacao() %></td>
            
            <td>
                <a 
                    class="btn"
                    href="<%= request.getContextPath() %>/home/app/adm/movimentacao_form.jsp?action=update&id=<%= m.getId() %>">
                    Alterar
                </a>

                <a
                   class="btn" 
                   style="background:#c0392b;"
                   href="<%= request.getContextPath() %>/home?action=delete&id=<%= m.getId() %>&task=movimentacoes"
                   onclick="return confirm('Deseja excluir a movimentação <%= m.getId() %>?')">
                    Excluir
                </a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

    <a class="btn"
       style="max-width:250px; margin:20px auto; display:block; text-align:center;"
       href="<%= request.getContextPath() %>/home/app/adm/movimentacao_form.jsp?action=create">
       Adicionar Movimentação
    </a>
</div>

</body>
</html>
