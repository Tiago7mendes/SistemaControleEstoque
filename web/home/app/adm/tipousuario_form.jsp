<%@page import="model.TipoUsuario"%>
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
        <%
            TipoUsuario tp = null;
            String action = request.getParameter("action");
            if (action == null) {
                action = "create";
            } else {
                if (action.equals("update")) {
                    int id = Integer.valueOf(request.getParameter("id"));
                    
                    tp = new TipoUsuario();
                    tp.setId(id);
                    tp.load();
                }
            }
        %>
        <h1>Tipo Usuario</h1>
        <form action="<%= request.getContextPath() %>/home?action=<%= action%>&task=tipousuario" method="post">
            
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" pattern="\d+" title="apenas dígitos" value="<%= (tp != null) ? tp.getId() : "" %>" <%= (tp != null) ? "readonly" : ""%> required>
            <br>
            
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= ((tp != null) && (tp.getNome() != null)) ? tp.getNome() : ""%>">
            <br>
            
            <input type="checkbox" id="modulo_admin" name="modulo_admin" value="S" <%= ((tp != null) && (tp.getModuloAdmin().equals("S"))) ? "checked" : ""%>>
            <label for="modulo_admin">Modulo Administrativo:</label>
            <br>
            
            <input type="checkbox" id="modulo_estoque" name="modulo_estoque" value="S" <%= ((tp != null) && (tp.getModuloEstoque().equals("S"))) ? "checked" : ""%>>
            <label for="modulo_estoque">Modulo Estoque:</label>
            <br>
            
            <input type="checkbox" id="modulo_fornecedores" name="modulo_fornecedores" value="S" <%= ((tp != null) && (tp.getModuloFornecedores().equals("S"))) ? "checked" : ""%>>
            <label for="modulo_fornecedores">Modulo Fornecedores:</label>
            <br>
            
            <input type="checkbox" id="modulo_movimentacoes" name="modulo_movimentacoes" value="S" <%= ((tp != null) && (tp.getModuloMovimentacoes().equals("S"))) ? "checked" : ""%>>
            <label for="modulo_movimentacoes">Modulo Movimentações:</label>
            <br>
            
            <input type="checkbox" id="modulo_compras" name="modulo_compras" value="S" <%= ((tp != null) && (tp.getModuloCompras().equals("S"))) ? "checked" : ""%>>
            <label for="modulo_compras">Modulo Compras:</label>
            <br>
            
            <input type="submit" name="Salvar" value="Salvar">
        </form>
    </body>
</html>