package web;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.Date;

import java.sql.*;
import model.Imovel;

@WebListener
public class AppListener implements ServletContextListener{
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:laroraapp.db";
    public static String initializeLog = "";
    public static Exception exception = null;
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Connection c = AppListener.getConnection();
            Statement s = c.createStatement();
            initializeLog += new Date() + ": Initializing database creation; ";
            initializeLog += "Creating Users table if not exist...";
            s.execute(Imovel.getCreateStatement());
            initializeLog += "done. ";
            s.close();
            c.close();
        }catch(Exception ex){
            initializeLog += "Erro: " + ex.getMessage();
            exception = ex;
        }
    }
    
    public static Connection getConnection() throws Exception{
        Class.forName(CLASS_NAME);
        return DriverManager.getConnection(URL);
    }
}
