package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import logtrack.ExceptionLogTrack;
import model.*;

public class FrontController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String task = request.getParameter("task");
        if (task == null) task = "";

        try {
            switch (task) {

                case "tipousuario": doGetTipoUsuario(request, response); break;
                case "usuario": doGetUsuario(request, response); break;

                case "categorias": doGetCategoria(request, response); break;
                case "produtos": doGetProduto(request, response); break;
                case "fornecedores": doGetFornecedor(request, response); break;
                case "movimentacoes": doGetMovimentacao(request, response); break;

                case "logout": doGetLogout(request, response); break;

                default: doDefault(request, response);
            }

        } catch (Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String task = request.getParameter("task");
        if (task == null) task = "";

        try {
            switch (task) {

                case "tipousuario": doPostTipoUsuario(request, response); break;
                case "usuario": doPostUsuario(request, response); break;

                case "categorias": doPostCategoria(request, response); break;
                case "produtos": doPostProduto(request, response); break;
                case "fornecedores": doPostFornecedor(request, response); break;
                case "movimentacoes": doPostMovimentacao(request, response); break;
                case "create_public_user": doPostCreatePublicUser(request, response); break;

                case "login": doPostLogin(request, response); break;

                default: doDefault(request, response);
            }

        } catch (Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
    }

    private void doGetTipoUsuario(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            TipoUsuario tp = new TipoUsuario();
            tp.setId(Integer.parseInt(request.getParameter("id")));
            tp.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/adm/tipousuario.jsp");
    }


    private void doGetUsuario(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            Usuario us = new Usuario();
            us.setId(Integer.parseInt(request.getParameter("id")));
            us.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/adm/usuario.jsp");
    }


    private void doGetCategoria(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if ("delete".equals(request.getParameter("action"))) {
            Categorias c = new Categorias();
            c.setId(Integer.parseInt(request.getParameter("id")));
            c.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/adm/categorias.jsp");
    }


    private void doGetProduto(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if ("delete".equals(request.getParameter("action"))) {
            Produtos p = new Produtos();
            p.setId(Integer.parseInt(request.getParameter("id")));
            p.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/adm/produtos.jsp");
    }


    private void doGetFornecedor(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if ("delete".equals(request.getParameter("action"))) {
            Fornecedores f = new Fornecedores();
            f.setId(Integer.parseInt(request.getParameter("id")));
            f.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/adm/fornecedores.jsp");
    }


    private void doGetMovimentacao(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if ("delete".equals(request.getParameter("action"))) {
            Movimentacoes m = new Movimentacoes();
            m.setId(Integer.parseInt(request.getParameter("id")));
            m.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/adm/movimentacoes.jsp");
    }


    private void doGetLogout(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession sessao = request.getSession(false);

        if (sessao != null) {
            sessao.removeAttribute("usuario");
            sessao.removeAttribute("tipo_usuario");
            sessao.invalidate();
        }

        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
    }

    private void doPostTipoUsuario(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        TipoUsuario tp = new TipoUsuario();
        tp.setId(Integer.parseInt(request.getParameter("id")));

        if ("update".equals(action)) tp.load();

        tp.setNome(request.getParameter("nome"));
        tp.setModuloAdmin(request.getParameter("modulo_admin") == null ? "N" : "S");
        tp.setModuloEstoque(request.getParameter("modulo_estoque") == null ? "N" : "S");
        tp.setModuloFornecedores(request.getParameter("modulo_fornecedores") == null ? "N" : "S");
        tp.setModuloMovimentacoes(request.getParameter("modulo_movimentacoes") == null ? "N" : "S");
        tp.setModuloCompras(request.getParameter("modulo_compras") == null ? "N" : "S");

        tp.save();

        response.sendRedirect(request.getContextPath() + "/home/app/adm/tipousuario.jsp");
    }



    private void doPostUsuario(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        Usuario us = new Usuario();
        us.setId(Integer.parseInt(request.getParameter("id")));

        if ("update".equals(action)) us.load();

        us.setNome(request.getParameter("nome"));
        us.setSenha(request.getParameter("senha"));
        us.setCpf(request.getParameter("cpf"));
        us.setEmail(request.getParameter("email"));
        us.setTipoUsuarioId(Integer.parseInt(request.getParameter("tipoUsuario")));

        us.save();

        response.sendRedirect(request.getContextPath() + "/home/app/adm/usuario.jsp");
    }



    private void doPostCategoria(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        Categorias c = new Categorias();
        c.setId(Integer.parseInt(request.getParameter("id")));

        if ("update".equals(action)) c.load();

        c.setNome(request.getParameter("nome"));
        c.save();

        response.sendRedirect(request.getContextPath() + "/home/app/adm/categorias.jsp");
    }



    private void doPostFornecedor(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        Fornecedores f = new Fornecedores();
        f.setId(Integer.parseInt(request.getParameter("id")));

        if ("update".equals(action)) f.load();

        f.setNome(request.getParameter("nome"));
        f.setCnpj(request.getParameter("cnpj"));
        f.setTelefone(request.getParameter("telefone"));
        f.setEndereco(request.getParameter("endereco"));

        f.save();

        response.sendRedirect(request.getContextPath() + "/home/app/adm/fornecedores.jsp");
    }



    private void doPostProduto(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        Produtos p = new Produtos();
        p.setId(Integer.parseInt(request.getParameter("id")));

        if ("update".equals(action)) p.load();

        p.setNome(request.getParameter("nome"));
        p.setDescricao(request.getParameter("descricao"));
        p.setValor(Float.parseFloat(request.getParameter("valor")));
        p.setQtdd_estoque(Integer.parseInt(request.getParameter("qtdd_estoque")));
        p.setCategoriasId(Integer.parseInt(request.getParameter("categoriasId")));
        p.setFornecedoresId(Integer.parseInt(request.getParameter("fornecedoresId")));

        p.save();

        response.sendRedirect(request.getContextPath() + "/home/app/adm/produtos.jsp");
    }

    private void doPostMovimentacao(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

    String action = request.getParameter("action");

    Movimentacoes m = new Movimentacoes();
    m.setId(Integer.parseInt(request.getParameter("id")));

    if ("update".equals(action)) m.load();

    String tipo = request.getParameter("tipo");
    int qtdd = Integer.parseInt(request.getParameter("qtdd"));
    int produtoId = Integer.parseInt(request.getParameter("produtosId"));

    // Usuário logado
    HttpSession sessao = request.getSession();
    TipoUsuario tu = (TipoUsuario) sessao.getAttribute("tipo_usuario");

    m.setTipo(tipo);
    m.setQtdd(qtdd);
    m.setProdutosId(produtoId);
    m.setUsuariosId(tu.getId());
    m.setObservacao(request.getParameter("observacao"));

    // Carrega o produto antes de salvar
    Produtos p = new Produtos();
    p.setId(produtoId);
    p.load();

    if ("SAIDA".equalsIgnoreCase(tipo)) {
        if (qtdd > p.getQtdd_estoque()) {
            // Não pode retirar mais do que tem
            request.getSession().setAttribute("erroEstoque", 
                "Não é possível retirar " + qtdd + 
                " itens. Estoque disponível: " + p.getQtdd_estoque());

            response.sendRedirect(request.getContextPath() + "/home/app/adm/movimentacao_form.jsp?action=create");
            return; // *** importantíssimo! para parar o fluxo ***
        }
        // baixa no estoque
        p.setQtdd_estoque(p.getQtdd_estoque() - qtdd);
    } 
    else if ("ENTRADA".equalsIgnoreCase(tipo)) {
        // adiciona no estoque
        p.setQtdd_estoque(p.getQtdd_estoque() + qtdd);
    }

    // se passou pela validação, salva movimentação + produto
    m.save();
    p.save();

    response.sendRedirect(request.getContextPath() + "/home/app/adm/movimentacoes.jsp");
}

    private void doPostCreatePublicUser(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

    int id = Integer.parseInt(request.getParameter("id"));

    // 1. Verificar se o ID já existe
    Usuario check = new Usuario();
    check.setId(id);
    boolean existe = check.load(); // retorna true se encontrou

    if (existe) {
        request.setAttribute("msg", "O ID " + id + " já está em uso. Escolha outro.");
        request.getRequestDispatcher("/home/cadastro.jsp").forward(request, response);
        return;
    }

    // 2. Criar o TipoUsuario padrão do cliente
    TipoUsuario tipo = new TipoUsuario();
    tipo.setId(id);
    tipo.setNome("ClienteCadastro");

    // libera apenas compras
    tipo.setModuloAdmin("N");
    tipo.setModuloEstoque("N");
    tipo.setModuloFornecedores("N");
    tipo.setModuloMovimentacoes("N");
    tipo.setModuloCompras("S");

    tipo.save();

    // 3. Criar o Usuario
    Usuario u = new Usuario();
    u.setId(id);
    u.setNome(request.getParameter("nome"));
    u.setCpf(request.getParameter("cpf"));
    u.setEmail(request.getParameter("email"));
    u.setSenha(request.getParameter("senha"));
    u.setTipoUsuarioId(id); // tipo criado acima

    u.save();

    // 4. Após cadastrar, voltar para login com mensagem
    request.setAttribute("msg", "Cadastro realizado com sucesso! Faça login.");
    request.getRequestDispatcher("/home/login.jsp").forward(request, response);
}

    private void doPostLogin(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int id = Integer.valueOf( request.getParameter("id") );        
        String senha = request.getParameter("senha");
        
        Usuario usuarioTry = new Usuario();
        usuarioTry.setId(id);
        usuarioTry.setSenha(senha);
        
        Usuario usuario = new Usuario();
        usuario.setId(id);        
        boolean status = usuario.load();
        
        if( ( status == true ) &&
              ( usuario.getSenha().equals( usuarioTry.getSenha() ) ) ) {
            
            // true crie um sessão se não houver alguma, false do contrário
            // informações amarmazenadas no servidor
            HttpSession sessao = request.getSession(false);
            if( sessao != null ) {
                sessao.removeAttribute("usuario");
                sessao.removeAttribute("tipo_usuario");
           
                sessao.invalidate();
            }
            
            sessao = request.getSession(true);
            
            sessao.setAttribute( "usuario", "(" + usuario.getNome() + ", " + usuario.getId() + ")" );
            
            TipoUsuario tipoUsuario = new TipoUsuario();
            tipoUsuario.setId( usuario.getTipoUsuarioId() );
            tipoUsuario.load();
            
            sessao.setAttribute( "tipo_usuario", tipoUsuario );
            
            sessao.setMaxInactiveInterval( 60 * 60 ); // em segundos
            
            // criado e armazenado no cliente
            Cookie cookie = new Cookie( "id", String.valueOf(id) );
            cookie.setMaxAge( 60 * 10 ); // em segundos
            response.addCookie(cookie);
            
            // faz com que o cliente acesse o recurso
            response.sendRedirect( request.getContextPath() +  "/home/app/menu.jsp" );
            
        } else {
            
            // faz com que o servidor acesso o recurso
            request.setAttribute("msg", "id e/ou senha incorreto(s)");
            request.getRequestDispatcher( "/home/login.jsp" ).forward(request, response);
        }

    }



    private void doDefault(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
    }
}
