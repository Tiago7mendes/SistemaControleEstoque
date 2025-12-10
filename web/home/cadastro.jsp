<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <h1>Cadastro</h1>

    <%
        String erro = (String) request.getAttribute("msg");
        if (erro != null) {
    %>
        <div style="color:red; font-weight:bold;"><%= erro %></div>
    <%
        }
    %>

    <form action="<%= request.getContextPath() %>/home?task=create_public_user" method="post">

        <label>ID:</label>
        <input type="text" name="id" pattern="\d+" title="apenas digitos" required>
        <br>

        <label>Nome:</label>
        <input type="text" name="nome" required>
        <br>

        <label>CPF:</label>
        <input type="text" name="cpf">
        <br>

        <label>Email:</label>
        <input type="email" name="email" required>
        <br>

        <label>Senha:</label>
        <input type="password" name="senha" required>
        <br><br>

        <input type="submit" value="Cadastrar">
    </form>

    <br>
    <a href="<%= request.getContextPath() %>/home/login.jsp">Voltar</a>
</body>
</html>
