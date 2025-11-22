package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Produtos extends DataAccessObject{
    
    private int id;
    private String nome;
    private String descricao;
    private float valor;
    private int qtdd_estoque;
    private int categoriasId;
    private int fornecedoresId;
    
    public Produtos() {
        super("categorias");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public float getValor() {
        return valor;
    }

    public int getQtdd_estoque() {
        return qtdd_estoque;
    }

    public int getCategoriasId() {
        return categoriasId;
    }

    public int getFornecedoresId() {
        return fornecedoresId;
    }

    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
        addChange("descricao", this.descricao);
    }

    public void setValor(float valor) {
        this.valor = valor;
        addChange("valor", this.valor);
    }

    public void setQtdd_estoque(int qtdd_estoque) {
        this.qtdd_estoque = qtdd_estoque;
        addChange("qtdd_estoque", this.qtdd_estoque);
    }

    public void setCategoriasId(int categoriasId) {
        if (this.categoriasId != categoriasId) {
            this.categoriasId = categoriasId;
            addChange("categorias_id", this.categoriasId);
        }
    }

    public void setFornecedoresId(int fornecedoresId) {
        if (this.fornecedoresId != fornecedoresId) {
            this.fornecedoresId = fornecedoresId;
            addChange("fornecedores_id", this.fornecedoresId);
        }
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
        descricao = (String) data.get(2);
        valor = (float) data.get(3);
        qtdd_estoque = (int) data.get(4);
        categoriasId = (int) data.get(5);
        fornecedoresId = (int) data.get(6);
        
        return this;
    }

    @Override
    protected Produtos copy() {
        Produtos pd = new Produtos();
        
        pd.setId(getId());
        pd.setNome(getNome());
        pd.setDescricao(getDescricao());
        pd.setValor(getValor());
        pd.setQtdd_estoque(getQtdd_estoque());
        pd.setCategoriasId(getCategoriasId());
        pd.setFornecedoresId(getFornecedoresId());
        
        pd.setNovelEntity(false); // copiou um existente
        
        return pd;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ", " + getValor() + ")";
    }
    
}
