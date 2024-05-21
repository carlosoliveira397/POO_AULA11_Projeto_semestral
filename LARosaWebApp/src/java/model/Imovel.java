package model;

import java.util.ArrayList;
import java.sql.*;
import web.AppListener;

public class Imovel {
    private String cd_imovel;
    private String nm_logradouro_imovel;
    private int cd_numero_imovel;
    private String nm_bairro_imovel;
    private String nm_cidade_imovel;
    private char sg_uf_imovel;
    private String cd_cep_imovel;
    private int qt_sala_imovel;
    private int qt_dormitorio_imovel;
    private int qt_banheiro_imovel;
    private int qt_cozinha_imovel;
    private int qt_suite_imovel;
    private int qt_quintal_imovel;
    private double vl_imovel;
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXIST imovel("
                + "cd_imovel INTEGER UNIQUE NOT NULL,"
                + "nm_logradouro_imovel VARCHAR(240) NOT NULL,"
                + "cd_numero_imovel NUMERIC(16) NOT NULL,"
                + "nm_bairro_imovel VARCHAR(240) NOT NULL,"
                + "nm_cidade_imovel VARCHAR(240) NOT NULL,"
                + "sg_uf_imovel CHAR(2) NOT NULL,"
                + "cd_cep_imovel VARCHAR(8) NOT NULL," 
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
            long rowid = rs.getLong("rowid");
            String nm_logradouro_imovel = rs.getString("nm_logradouro_imovel");
            String cd_cep_imovel = rs.getString("cd_cep_imovel");
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public Imovel(String cd_imovel, String nm_logradouro_imovel, int cd_numero_imovel, String nm_bairro_imovel, String nm_cidade_imovel, char sg_uf_imovel, String cd_cep_imovel, int qt_sala_imovel, int qt_dormitorio_imovel, int qt_banheiro_imovel, int qt_cozinha_imovel, int qt_suite_imovel, int qt_quintal_imovel, double vl_imovel) {
        this.cd_imovel = cd_imovel;
        this.nm_logradouro_imovel = nm_logradouro_imovel;
        this.cd_numero_imovel = cd_numero_imovel;
        this.nm_bairro_imovel = nm_bairro_imovel;
        this.nm_cidade_imovel = nm_cidade_imovel;
        this.sg_uf_imovel = sg_uf_imovel;
        this.cd_cep_imovel = cd_cep_imovel;
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

    public String getNm_logradouro_imovel() {
        return nm_logradouro_imovel;
    }

    public void setNm_logradouro_imovel(String nm_logradouro_imovel) {
        this.nm_logradouro_imovel = nm_logradouro_imovel;
    }

    public int getCd_numero_imovel() {
        return cd_numero_imovel;
    }

    public void setCd_numero_imovel(int cd_numero_imovel) {
        this.cd_numero_imovel = cd_numero_imovel;
    }

    public String getNm_bairro_imovel() {
        return nm_bairro_imovel;
    }

    public void setNm_bairro_imovel(String nm_bairro_imovel) {
        this.nm_bairro_imovel = nm_bairro_imovel;
    }

    public String getNm_cidade_imovel() {
        return nm_cidade_imovel;
    }

    public void setNm_cidade_imovel(String nm_cidade_imovel) {
        this.nm_cidade_imovel = nm_cidade_imovel;
    }

    public char getSg_uf_imovel() {
        return sg_uf_imovel;
    }

    public void setSg_uf_imovel(char sg_uf_imovel) {
        this.sg_uf_imovel = sg_uf_imovel;
    }

    public String getCd_cep_imovel() {
        return cd_cep_imovel;
    }

    public void setCd_cep_imovel(String cd_cep_imovel) {
        this.cd_cep_imovel = cd_cep_imovel;
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
