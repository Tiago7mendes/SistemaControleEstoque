package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class TipoUsuario extends DataAccessObject {
    
    private int id;
    private String nome;
    private String moduloAdmin;
    private String moduloEstoque;
    private String moduloFornecedores;
    private String moduloMovimentacoes;
    private String moduloCompras;

    public TipoUsuario() {
        super("tipo_usuario");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getModuloAdmin() {
        return moduloAdmin;
    }

    public String getModuloEstoque() {
        return moduloEstoque;
    }

    public String getModuloFornecedores() {
        return moduloFornecedores;
    }

    public String getModuloMovimentacoes() {
        return moduloMovimentacoes;
    }

    public String getModuloCompras() {
        return moduloCompras;
    }

    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }

    public void setModuloAdmin(String moduloAdmin) {
        this.moduloAdmin = moduloAdmin;
        addChange("modulo_administrativo", this.moduloAdmin);
    }

    public void setModuloEstoque(String moduloEstoque) {
        this.moduloEstoque = moduloEstoque;
        addChange("modulo_estoque", this.moduloEstoque);
    }

    public void setModuloFornecedores(String moduloFornecedores) {
        this.moduloFornecedores = moduloFornecedores;
        addChange("modulo_fornecedores", this.moduloFornecedores);
    }

    public void setModuloMovimentacoes(String moduloMovimentacoes) {
        this.moduloMovimentacoes = moduloMovimentacoes;
        addChange("modulo_movimentacoes", this.moduloMovimentacoes);
    }

    public void setModuloCompras(String moduloCompras) {
        this.moduloCompras = moduloCompras;
        addChange("modulo_compras", this.moduloCompras);
    }

    @Override
    protected String getWhereClauseForOneEntity() {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        // segue a ordem das colunas da tabela no banco de dados
        id = (int) data.get(0);
        nome = (String) data.get(1);
        moduloAdmin = (String) data.get(2);
        moduloEstoque = (String) data.get(3);
        moduloFornecedores = (String) data.get(4);
        moduloMovimentacoes = (String) data.get(5);
        moduloCompras = (String) data.get(6);
                
        return this;
    }

    @Override
    protected TipoUsuario copy() {
        TipoUsuario cp = new TipoUsuario();
        
        cp.setId(getId());
        cp.setNome(getNome());
        cp.setModuloAdmin(getModuloAdmin());
        cp.setModuloEstoque(getModuloEstoque());
        cp.setModuloFornecedores(getModuloFornecedores());
        cp.setModuloMovimentacoes(getModuloMovimentacoes());
        cp.setModuloCompras(getModuloCompras());
        
        cp.setNovelEntity(false); // copiou um existente
        
        return cp;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ", " + getModuloAdmin() + ", " + getModuloEstoque() + ", " + getModuloFornecedores() + ", " + getModuloMovimentacoes() + ", " + getModuloCompras() + ")";
    }
}
