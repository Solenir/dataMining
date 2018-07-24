package db.CriacaoScriptSql;

import java.io.*;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class montaScript {


    public static ArrayList<String> ler(File file){
        ArrayList<String> atributos = new ArrayList<>();
        try {

            FileReader arq1 = new FileReader(file);
            BufferedReader lerArq1 = new BufferedReader(arq1);
            String linha1 = lerArq1.readLine(); // lê a primeira linha

            while (linha1 != null) {
                String atr [] = linha1.split(",");
                for(int i = 0; i < atr.length; i++){
                    atributos.add(atr[i]);
                }
                linha1 = lerArq1.readLine(); // lê da segunda até a última linha

            }
            arq1.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n",
                    e.getMessage());
        }

        return atributos;
    }


    private static void escrever(File file,ArrayList<String> atributos, String tipoDados){

        try{

            BufferedWriter bw = new BufferedWriter(new FileWriter(file, false));



            bw.write("CREATE TABLE IF NOT EXISTS JOGADOR_BINARIO(");
            bw.newLine();
            bw.write("ID INT NOT NULL,");
            bw.newLine();
            for(int i = 1; i < atributos.size()-1; i++){
                bw.write(atributos.get(i)+tipoDados+" NOT NULL,");
                bw.newLine();

            }
            bw.write(atributos.get(atributos.size()-1)+tipoDados +" NOT NULL");
            bw.newLine();
            bw.write(")ENGINE = INNODB;");

            bw.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }


    public static void main(String[] args) {
        ArrayList<String> atributos = new ArrayList<>();
        atributos =  ler(new File("C:\\Users\\solenir\\Desktop\\8ºSemestre\\EXA864 MINERAÇÃO DE DADOS\\ProjetoPratico2\\Codes\\dataMining\\src\\db\\CriacaoScriptSql\\binario.txt"));
        escrever(new File("C:\\Users\\solenir\\Desktop\\8ºSemestre\\EXA864 MINERAÇÃO DE DADOS\\ProjetoPratico2\\Codes\\dataMining\\src\\db\\CriacaoScriptSql\\binarioSQL.txt"),atributos," TINYINT");

        //atributos =  ler(new File("C:\\Users\\solenir\\Desktop\\8ºSemestre\\EXA864 MINERAÇÃO DE DADOS\\ProjetoPratico2\\Codes\\dataMining\\src\\db\\CriacaoScriptSql\\continuo.txt"));
        //escrever(new File("C:\\Users\\solenir\\Desktop\\8ºSemestre\\EXA864 MINERAÇÃO DE DADOS\\ProjetoPratico2\\Codes\\dataMining\\src\\db\\CriacaoScriptSql\\continuoSQL.txt"),atributos," FLOAT ");
    }
}
