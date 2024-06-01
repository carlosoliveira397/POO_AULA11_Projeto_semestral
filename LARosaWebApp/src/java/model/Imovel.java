package model;

import java.util.ArrayList;
import java.sql.*;
import web.AppListener;

public class Imovel {
    private String cd_imovel;
    private int qt_sala_imovel;
    private int qt_dormitorio_imovel;
    private int qt_banheiro_imovel;
    private int qt_cozinha_imovel;
    private int qt_suite_imovel;
    private int qt_quintal_imovel;
    private double vl_imovel;
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS imovel("
                + "cd_imovel INTEGER UNIQUE NOT NULL,"
                + "qt_sala_imovel NUMERIC(2),"
                + "qt_dormitorio_imovel NUMERIC(2),"
                + "qt_banheiro_imovel NUMERIC(2),"
                + "qt_cozinha_imovel NUMERIC(2),"
                + "qt_suite_imovel NUMERIC(2),"
                + "qt_quintal_imovel NUMERIC(2),"
                + "vl_imovel NUMERIC(6)"
                + ")";
    }

    public static ArrayList<Imovel> getImovel()throws Exception{
        ArrayList<Imovel> list = new ArrayList<>();
        Connection con = AppListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT rowid, * FROM imovel");
        while(rs.next()){
            Imovel imv = new Imovel(
                rs.getString("cd_imovel"),
                rs.getInt("qt_sala_imovel"),
                rs.getInt("qt_dormitorio_imovel"),
                rs.getInt("qt_banheiro_imovel"),
                rs.getInt("qt_cozinha_imovel"),
                rs.getInt("qt_suite"),
                rs.getInt("qt_quintal_imovel"),
                rs.getDouble("vl_imovel")
                );
            list.add(imv);
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addImovel(String cd_imovel, int qt_sala_imovel, int qt_dormitorio_imovel, int qt_banheiro_imovel, int qt_cozinha_imovel, int qt_suite_imovel, int qt_quintal_imovel, double vl_imovel)
            throws Exception{
        String SQL = "INSERT INTO imovel VALUES("
                + "?" //cd_imovel
                + ", ?" //qt_sala_imovel
                + ", ?" //qt_dormitorio_imovel
                + ", ?" //qt_banheiro_imovel
                + ", ?" //qt_cozinha_imovel
                + ", ?" //qt_suite_imovel
                + ", ?" //qt_quintal_imovel
                + ", ?" //vl_imovel
                + ")";
        Connection con = AppListener.getConnection();
        PreparedStatement s = con.prepareStatement(SQL);
        s.setString(1, cd_imovel); 
        s.setInt(2, qt_sala_imovel);
        s.setInt(3, qt_dormitorio_imovel);
        s.setInt(4, qt_banheiro_imovel); 
        s.setInt(5, qt_cozinha_imovel);
        s.setInt(6, qt_suite_imovel);
        s.setInt(7, qt_quintal_imovel);
        s.setDouble(8, vl_imovel);
        s.execute();
        s.close();
        con.close();
    }
    
    public static void updateImovel(String cd_imovel, int qt_sala_imovel, int qt_dormitorio_imovel, int qt_banheiro_imovel, int qt_cozinha_imovel, int qt_suite_imovel, int qt_quintal_imovel, double vl_imovel) throws Exception{
        Connection con = AppListener.getConnection();
        String sql = "UPDATE imovel SET"
                + "cd_imovel = ?,"
                + "qt_sala_imovel = ?,"
                + "qt_dormitorio_imovel = ?,"
                + "qt_banheiro_imovel = ?,"
                + "qt_cozinha_imovel = ?,"
                + "qt_suite_imovel = ?,"
                + "qt_quintal_imovel = ?,"
                + "vl_imovel = ? WHERE cd_imovel = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, cd_imovel);
                stmt.setInt(2, qt_sala_imovel);
                stmt.setInt(3, qt_dormitorio_imovel);
                stmt.setInt(4, qt_banheiro_imovel);
                stmt.setInt(5, qt_cozinha_imovel);
                stmt.setInt(6, qt_suite_imovel);
                stmt.setInt(7, qt_quintal_imovel);
                stmt.setDouble(8, vl_imovel);
                stmt.execute();
                stmt.close();
                con.close();
    }
    
    public Imovel(String cd_imovel, int qt_sala_imovel, int qt_dormitorio_imovel, int qt_banheiro_imovel, int qt_cozinha_imovel, int qt_suite_imovel, int qt_quintal_imovel, double vl_imovel) {
        this.cd_imovel = cd_imovel;
        this.qt_sala_imovel = qt_sala_imovel;
        this.qt_dormitorio_imovel = qt_dormitorio_imovel;
        this.qt_banheiro_imovel = qt_banheiro_imovel;
        this.qt_cozinha_imovel = qt_cozinha_imovel;
        this.qt_suite_imovel = qt_suite_imovel;
        this.qt_quintal_imovel = qt_quintal_imovel;
        this.vl_imovel = vl_imovel;
    }

    public String getCd_imovel() {
        return cd_imovel;
    }

    public void setCd_imovel(String cd_imovel) {
        this.cd_imovel = cd_imovel;
    }
  
    public int getQt_sala_imovel() {
        return qt_sala_imovel;
    }

    public void setQt_sala_imovel(int qt_sala_imovel) {
        this.qt_sala_imovel = qt_sala_imovel;
    }

    public int getQt_dormitorio_imovel() {
        return qt_dormitorio_imovel;
    }

    public void setQt_dormitorio_imovel(int qt_dormitorio_imovel) {
        this.qt_dormitorio_imovel = qt_dormitorio_imovel;
    }

    public int getQt_banheiro_imovel() {
        return qt_banheiro_imovel;
    }

    public void setQt_banheiro_imovel(int qt_banheiro_imovel) {
        this.qt_banheiro_imovel = qt_banheiro_imovel;
    }

    public int getQt_cozinha_imovel() {
        return qt_cozinha_imovel;
    }

    public void setQt_cozinha_imovel(int qt_cozinha_imovel) {
        this.qt_cozinha_imovel = qt_cozinha_imovel;
    }

    public int getQt_suite_imovel() {
        return qt_suite_imovel;
    }

    public void setQt_suite_imovel(int qt_suite_imovel) {
        this.qt_suite_imovel = qt_suite_imovel;
    }

    public int getQt_quintal_imovel() {
        return qt_quintal_imovel;
    }

    public void setQt_quintal_imovel(int qt_quintal_imovel) {
        this.qt_quintal_imovel = qt_quintal_imovel;
    }

    public double getVl_imovel() {
        return vl_imovel;
    }

    public void setVl_imovel(double vl_imovel) {
        this.vl_imovel = vl_imovel;
    }    
    
}
