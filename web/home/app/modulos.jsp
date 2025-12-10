<%@page import="model.TipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String usuarioLogado = (String) session.getAttribute("usuario");
    TipoUsuario tipoUsuarioLogado = (TipoUsuario) session.getAttribute("tipo_usuario");
    
    if (usuarioLogado == null || tipoUsuarioLogado == null) {
        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css">

    <style>

        body {
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
        }

        /* Container principal dos módulos */
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 18px;
            max-width: 850px;
            margin: 0 auto;
        }

        /* Cards menores e mais compactos */
        .module-card {
            width: 220px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            padding: 16px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 3px 12px var(--shadow);
            transition: 0.2s;
        }

        .module-card:hover {
            transform: translateY(-4px);
        }

        .module-card h3 {
            margin-bottom: 6px;
            font-size: 1.1rem;
        }

        .module-card p {
            font-size: 0.85rem;
            margin-bottom: 10px;
            color: var(--text-light);
        }

        .module-card a {
            display: inline-block;
            padding: 8px 12px;
            background: var(--primary);
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .module-card a:hover {
            background: var(--primary-hover);
        }

        .logout-box {
            text-align: center;
            margin-top: 25px;
        }

        .logout-box a {
            color: var(--primary);
            font-weight: bold;
            text-decoration: none;
        }

        .logout-box a:hover {
            text-decoration: underline;
        }

    </style>
</head>

<body>

<h1>Bem-vindo, <%= usuarioLogado %></h1>

<div class="menu-container">

    <% 
    boolean admin = tipoUsuarioLogado.getModuloAdmin().equals("S");
    boolean compras = tipoUsuarioLogado.getModuloCompras().equals("S");
    %>

    <% if (admin) { %>

        <div class="module-card">
            <h3>Usuários</h3>
            <p>Gerenciar contas cadastradas.</p>
            <a href="<%= request.getContextPath()%>/home/app/adm/usuario.jsp">Acessar</a>
        </div>

        <div class="module-card">
            <h3>Tipo Usuário</h3>
            <p>Perfis e permissões.</p>
            <a href="<%= request.getContextPath()%>/home/app/adm/tipousuario.jsp">Acessar</a>
        </div>

        <div class="module-card">
            <h3>Categorias</h3>
            <p>Grupos de produtos.</p>
            <a href="<%= request.getContextPath()%>/home/app/adm/categorias.jsp">Acessar</a>
        </div>

        <div class="module-card">
            <h3>Fornecedores</h3>
            <p>Cadastro de fornecedores.</p>
            <a href="<%= request.getContextPath()%>/home/app/adm/fornecedores.jsp">Acessar</a>
        </div>

        <div class="module-card">
            <h3>Movimentações</h3>
            <p>Entradas e saídas.</p>
            <a href="<%= request.getContextPath()%>/home/app/adm/movimentacoes.jsp">Acessar</a>
        </div>

        <div class="module-card">
            <h3>Produtos</h3>
            <p>Gerenciamento de produtos.</p>
            <a href="<%= request.getContextPath()%>/home/app/adm/produtos.jsp">Acessar</a>
        </div>

    <% } %>

    <% if (compras) { %>
        <div class="module-card">
            <h3>Compras</h3>
            <p>Comprar produtos disponíveis.</p>
            <a href="<%= request.getContextPath()%>/home?task=listarCompras">Acessar</a>
        </div>
    <% } %>

</div>

<div class="logout-box">
    <a href="<%= request.getContextPath()%>/home?task=logout">
        Sair <%= usuarioLogado %>
    </a>
</div>
    <br><br>
</body>
</html>
