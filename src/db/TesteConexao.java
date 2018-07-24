package db;

import Controller.Controller;
import Model.JogadorView;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.NavigableMap;
import java.util.TreeMap;

public class TesteConexao {

    public static void main(String[] args) {
        Controller con = Controller.getController();
        try {
            NavigableMap<Integer, JogadorView> jogadores = con.getJogadorFiltrado("Convocado = 1");
            for (Integer key: jogadores.keySet()){
                System.out.println("Chave: "+ key + " Nome Jogador: "+ jogadores.get(key).getNameJogador());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }




        /*
        JogadorView jogador = new JogadorView();
        try {
            jogador.selectAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        */
    }
}
