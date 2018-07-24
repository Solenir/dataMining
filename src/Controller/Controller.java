package Controller;

import Model.JogadorView;
import db.ConexaoJDBC;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.HashMap;
import java.util.NavigableMap;
import java.util.TreeMap;


public enum Controller {
    INSTANCE;

    public static Controller getController(){ return INSTANCE; }

    public NavigableMap<Integer,JogadorView> getJogadorFiltrado(String comparacao) throws SQLException{
        NavigableMap<Integer, JogadorView>  jogadores = new TreeMap<>();
        Connection conn = ConexaoJDBC.getConexaoJDBC().getConexao();
        Statement stmt = conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT * FROM jogador WHERE "+ comparacao);

        while(result.next()){
            jogadores.put(result.getInt(1), new JogadorView(result.getInt(1),result.getString(2),result.getInt(3),
                    result.getInt(4),result.getInt(5),result.getString(6),result.getString(7),result.getInt(8),
                    result.getInt(9),result.getInt(10),result.getInt(11)));
        }
        ConexaoJDBC.getConexaoJDBC().close(conn, stmt, result);

        return jogadores;

    }




}
