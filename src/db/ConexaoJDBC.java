package db;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;

public enum ConexaoJDBC {
    INSTANCE;


    public static ConexaoJDBC getConexaoJDBC(){ return INSTANCE;}

    public Connection getConexao() throws  SQLException{
        String url = "jdbc:mysql://localhost:3306/BD_Jogadores?useTimezone=true&serverTimezone=UTC&useSSL=false";
        String user = "root";
        String  password = "";

        return DriverManager.getConnection(url, user, password);
    }

    public void close (Connection conn, Statement stmt) throws SQLException {
        conn.close();
        if(stmt != null)
           stmt.close();
    }

    public void close (Connection conn, Statement stmt, ResultSet result) throws  SQLException{
        close(conn,stmt);
        if(result != null)
          result.close();
    }
}
