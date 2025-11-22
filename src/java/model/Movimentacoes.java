package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Movimentacoes extends DataAccessObject{
    
    private int id;
    private Enum tipo;
    private int qtdd;
    private String observacao;
    private int usuariosId;
    private int produtosId;
    
    public Movimentacoes() {
        super("categorias");
    }

    public int getId() {
        return id;
    }

    public Enum getTipo() {
        return tipo;
    }

    public int getQtdd() {
        return qtdd;
    }

    public String getObservacao() {
        return observacao;
    }

    public int getUsuariosId() {
        return usuariosId;
    }

    public int getProdutosId() {
        return produtosId;
    }

    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setTipo(Enum tipo) {
        this.tipo = tipo;
        addChange("tipo", this.tipo);
    }

    public void setQtdd(int qtdd) {
        this.qtdd = qtdd;
        addChange("qttd", this.qtdd);
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
        addChange("observacao", this.observacao);
    }

    public void setUsuariosId(int usuariosId) {
        if (this.usuariosId != usuariosId) {
            this.usuariosId = usuariosId;
            addChange("usuarios_id", this.usuariosId);
        }
    }

    public void setProdutosId(int produtosId) {
        if (this.produtosId != produtosId) {
            this.produtosId = produtosId;
            addChange("produtos_id", this.produtosId);
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
        tipo = (Enum) data.get(1);
        qtdd = (int) data.get(2);
        observacao = (String) data.get(3);
        usuariosId = (int) data.get(4);
        produtosId = (int) data.get(5);
        
        return this;
    }

    @Override
    protected Movimentacoes copy() {
        Movimentacoes mv = new Movimentacoes();
        
        mv.setId(getId());
        mv.setTipo(getTipo());
        mv.setQtdd(getQtdd());
        mv.setObservacao(getObservacao());
        mv.setUsuariosId(getUsuariosId());
        mv.setProdutosId(getProdutosId());
        
        mv.setNovelEntity(false); // copiou um existente
        
        return mv;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + ", " + getTipo() + ", " + getQtdd() + ")";
    }
    
}
