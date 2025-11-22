package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Categorias extends DataAccessObject{
    
    private int id;
    private String nome;
    
    public Categorias() {
        super("categorias");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
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
        
        return this;
    }

    @Override
    protected Categorias copy() {
        Categorias ct = new Categorias();
        
        ct.setId(getId());
        ct.setNome(getNome());
        
        ct.setNovelEntity(false); // copiou um existente
        
        return ct;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ")";
    }
    
}
