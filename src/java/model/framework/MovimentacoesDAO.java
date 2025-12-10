package model.framework;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovimentacoesDAO extends DataAccessObject {

    public MovimentacoesDAO() {
        super("movimentacoes");
    }

    public int getMaxId() {
        int max = 0;

        try {
            ResultSet rs = this.executeQuery("SELECT MAX(id) AS maxId FROM movimentacoes");

            if (rs.next()) {
                max = rs.getInt("maxId");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return max;
    }

    @Override
    protected String getWhereClauseForOneEntity() {
        throw new UnsupportedOperationException();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        throw new UnsupportedOperationException();
    }

    @Override
    protected DataAccessObject copy() {
        throw new UnsupportedOperationException();
    }

}
