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

    // ============================================================
    //                       MÉTODO GET
    // ============================================================

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



    // ============================================================
    //                       MÉTODO POST
    // ============================================================

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

                case "login": doPostLogin(request, response); break;

                default: doDefault(request, response);
            }

        } catch (Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
    }



    // ============================================================
    //                     GET — DELETE
    // ============================================================

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

        response.sendRedirect(request.getContextPath() + "/home/app/estoque/produtos.jsp");
    }


    private void doGetFornecedor(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if ("delete".equals(request.getParameter("action"))) {
            Fornecedores f = new Fornecedores();
            f.setId(Integer.parseInt(request.getParameter("id")));
            f.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/fornecedores/fornecedores.jsp");
    }


    private void doGetMovimentacao(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        if ("delete".equals(request.getParameter("action"))) {
            Movimentacoes m = new Movimentacoes();
            m.setId(Integer.parseInt(request.getParameter("id")));
            m.delete();
        }

        response.sendRedirect(request.getContextPath() + "/home/app/estoque/movimentacoes.jsp");
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



    // ============================================================
    //                     POST — CREATE / UPDATE
    // ============================================================

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

        response.sendRedirect(request.getContextPath() + "/home/app/fornecedores/fornecedores.jsp");
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

        response.sendRedirect(request.getContextPath() + "/home/app/estoque/produtos.jsp");
    }



    private void doPostMovimentacao(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String action = request.getParameter("action");

        Movimentacoes m = new Movimentacoes();
        m.setId(Integer.parseInt(request.getParameter("id")));

        if ("update".equals(action)) m.load();

        String tipo = request.getParameter("tipo");
        int qtdd = Integer.parseInt(request.getParameter("qtdd"));
        int produtoId = Integer.parseInt(request.getParameter("produtoId"));

        // Usuário logado
        HttpSession sessao = request.getSession();
        TipoUsuario tu = (TipoUsuario) sessao.getAttribute("tipo_usuario");

        m.setTipo(tipo);
        m.setQtdd(qtdd);
        m.setProdutosId(produtoId);
        m.setUsuariosId(tu.getId());
        m.setObservacao(request.getParameter("observacao"));

        m.save();

        // Atualiza o estoque corretamente
        Produtos p = new Produtos();
        p.setId(produtoId);
        p.load();

        if ("ENTRADA".equals(tipo)) {
            p.setQtdd_estoque(p.getQtdd_estoque() + qtdd);
        } else {
            p.setQtdd_estoque(p.getQtdd_estoque() - qtdd);
        }

        p.save();

        response.sendRedirect(request.getContextPath() + "/home/app/estoque/movimentacoes.jsp");
    }



    private void doPostLogin(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        String senha = request.getParameter("senha");

        Usuario temp = new Usuario();
        temp.setId(id);

        if (!temp.load()) {
            request.setAttribute("msg", "id ou senha incorretos");
            request.getRequestDispatcher("/home/login.jsp").forward(request, response);
            return;
        }

        if (!temp.getSenha().equals(senha)) {
            request.setAttribute("msg", "id ou senha incorretos");
            request.getRequestDispatcher("/home/login.jsp").forward(request, response);
            return;
        }

        HttpSession sessao = request.getSession(true);
        sessao.setAttribute("usuario", temp);

        TipoUsuario t = new TipoUsuario();
        t.setId(temp.getTipoUsuarioId());
        t.load();
        sessao.setAttribute("tipo_usuario", t);

        Cookie ck = new Cookie("id", String.valueOf(id));
        ck.setMaxAge(600);
        response.addCookie(ck);

        response.sendRedirect(request.getContextPath() + "/home/app/menu.jsp");
    }



    private void doDefault(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
    }
}
