package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Fornecedores extends DataAccessObject{
    
    private int id;
    private String nome;
    private String cnpj;
    private String telefone;
    private String endereco;
    
    public Fornecedores() {
        super("fornecedores");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCnpj() {
        return cnpj;
    }

    public String getTelefone() {
        return telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
        addChange("cnpj", this.cnpj);
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
        addChange("telefone", this.telefone);
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
        addChange("endereco", this.endereco);
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
        cnpj = (String) data.get(2);
        telefone = (String) data.get(3);
        endereco = (String) data.get(4);
        
        return this;
    }

    @Override
    protected Fornecedores copy() {
        Fornecedores fn = new Fornecedores();
        
        fn.setId(getId());
        fn.setNome(getNome());
        fn.setCnpj(getCnpj());
        fn.setTelefone(getTelefone());
        fn.setEndereco(getEndereco());
        
        fn.setNovelEntity(false); // copiou um existente
        
        return fn;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + ", " + getNome() + ")";
    }
}
