<%@page import="model.Categorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Categorias</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">
    </head>
    <body>

        <%@ include file="/home/app/modulos.jsp"%>

        <%
            Categorias cat = null;
            String action = request.getParameter("action");

            if (action == null) {
                action = "create";
            } else if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("id"));

                cat = new Categorias();
                cat.setId(id);
                cat.load();
            }
        %>

        <h1><%= (action.equals("create")) ? "Cadastrando Categoria" : "Editando Categoria" %></h1>

        <form action="<%= request.getContextPath()%>/home?action=<%= action %>&task=categorias" method="post">

            <label for="id">ID:</label>
            <input type="text" id="id" name="id" pattern="\d+" 
                   value="<%= (cat != null) ? cat.getId() : "" %>"
                   <%= (cat != null) ? "readonly" : "" %> required>
            <br>

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome"
                   value="<%= (cat != null && cat.getNome() != null) ? cat.getNome() : "" %>">
            <br>

            <input type="submit" value="Salvar">
        </form>
    </body>
</html>
