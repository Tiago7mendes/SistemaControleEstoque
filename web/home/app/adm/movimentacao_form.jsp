<%@page import="model.Movimentacoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movimentações</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="/home/app/modulos.jsp"%>

<%
    String erro = (String) session.getAttribute("erroEstoque");
    if (erro != null) {
%>
    <div style="color:red; font-weight:bold"><%= erro %></div>
<%
        session.removeAttribute("erroEstoque");
    }
%>

<%
    Movimentacoes mv = null;
    String action = request.getParameter("action");

    if (action == null) action = "create";
    else if (action.equals("update")) {
        int id = Integer.valueOf(request.getParameter("id"));
        mv = new Movimentacoes();
        mv.setId(id);
        mv.load();
    }
%>

<h1><%= action.equals("create") ? "Cadastrando Movimentação" : "Editando Movimentação" %></h1>

<form action="<%= request.getContextPath() %>/home?action=<%= action %>&task=movimentacoes" method="post">

    <label for="id">ID:</label>
    <input type="text" id="id" name="id" pattern="\d+"
           value="<%= (mv != null) ? mv.getId() : "" %>"
           <%= (mv != null) ? "readonly" : "" %> required>
    <br>

    <label for="tipo">Tipo:</label>
    <select id="tipo" name="tipo" required>
        <option value="entrada">Entrada</option>
        <option value="saida">Saida</option>
    </select>
    <br>

    <label for="qtdd">Quantidade:</label>
    <input type="text" id="qtdd" name="qtdd" pattern="\d+"
           value="<%= (mv != null) ? mv.getQtdd() : "" %>">
    <br>

    <label for="observacao">Observação:</label>
    <input type="text" id="observacao" name="observacao"
           value="<%= (mv != null) ? mv.getObservacao() : "" %>">
    <br>

    <label for="usuariosId">Usuário ID:</label>
    <input type="text" id="usuariosId" name="usuariosId" pattern="\d+"
           value="<%= (mv != null) ? mv.getUsuariosId() : "" %>">
    <br>

    <label for="produtosId">Produto ID:</label>
    <input type="text" id="produtosId" name="produtosId" pattern="\d+"
           value="<%= (mv != null) ? mv.getProdutosId() : "" %>">
    <br>

    <input type="submit" value="Salvar">
</form>

</body>
</html>
