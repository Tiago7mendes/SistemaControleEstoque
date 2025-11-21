<%@page import="model.TipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo Usuario</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <%@ include file="/home/app/modulos.jsp"%>
        <% ArrayList<TipoUsuario> dados = new TipoUsuario().getAllTableEntities(); %>
        <h1>Tipo Usuario</h1>
        <div class="container">
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Administrativo</th>
                    <th>Estoque</th>
                    <th>Fornecedores</th>
                    <th>Movimentações</th>
                    <th>Compras</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for(TipoUsuario tp : dados) { %>
                <tr>
                    <td><%= tp.getId() %></td>
                    <td><%= tp.getNome() %></td>
                    <td><%= tp.getModuloAdmin() %></td>
                    <td><%= tp.getModuloEstoque() %></td>
                    <td><%= tp.getModuloFornecedores() %></td>
                    <td><%= tp.getModuloMovimentacoes() %></td>
                    <td><%= tp.getModuloCompras() %></td>
                    <td> 
                        <a href="<%= request.getContextPath() %>/home/app/adm/tipousuario_form.jsp?action=update&id=<%= tp.getId() %>">Alterar</a>
                        <a href="<%= request.getContextPath() %>/home?action=delete&id=<%= tp.getId() %>&task=tipousuario" onclick="return confirm('Deseja excluir TipoUsuario <%= tp.getId()%> (<%= tp.getNome() %>) ?')" >Excluir</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
        </div>
        <a href="<%= request.getContextPath() %>/home/app/adm/tipousuario_form.jsp?action=create">Adicionar</a>
    </body>
</html>
