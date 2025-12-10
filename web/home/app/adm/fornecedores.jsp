<%@page import="model.Fornecedores"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Fornecedores</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/home/app/modulos.jsp"%>

    <% ArrayList<Fornecedores> dados = new Fornecedores().getAllTableEntities(); %>

    <h1>Fornecedores</h1>
    <div class="container">

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>CNPJ</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Ações</th>
            </tr>
        </thead>

        <tbody>
            <% for(Fornecedores f : dados) { %>
            <tr>
                <td><%= f.getId() %></td>
                <td><%= f.getNome() %></td>
                <td><%= f.getCnpj() %></td>
                <td><%= f.getTelefone() %></td>
                <td><%= f.getEndereco() %></td>

                <td>
                    <a href="<%= request.getContextPath() %>/home/app/adm/fornecedor_form.jsp?action=update&id=<%= f.getId() %>">Alterar</a>
                    <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= f.getId() %>&task=fornecedores"
                       onclick="return confirm('Deseja excluir Fornecedor <%= f.getId() %> (<%= f.getNome() %>) ?')">
                        Excluir
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>

    <a href="<%= request.getContextPath() %>/home/app/adm/fornecedor_form.jsp?action=create">Adicionar</a>
</body>
</html>
