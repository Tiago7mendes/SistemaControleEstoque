<%@page import="model.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Categorias</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/home/app/modulos.jsp"%>

    <% ArrayList<Categorias> dados = new Categorias().getAllTableEntities(); %>

    <h1>Categorias</h1>
    <div class="container">

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
        </thead>

        <tbody>
            <% for(Categorias ct : dados) { %>
            <tr>
                <td><%= ct.getId() %></td>
                <td><%= ct.getNome() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/home/app/adm/categoria_form.jsp?action=update&id=<%= ct.getId() %>">Alterar</a>
                    <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= ct.getId() %>&task=categorias"
                       onclick="return confirm('Deseja excluir Categoria <%= ct.getId() %> (<%= ct.getNome() %>) ?')">
                        Excluir
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>

    <a href="<%= request.getContextPath() %>/home/app/adm/categoria_form.jsp?action=create">Adicionar</a>
</body>
</html>
