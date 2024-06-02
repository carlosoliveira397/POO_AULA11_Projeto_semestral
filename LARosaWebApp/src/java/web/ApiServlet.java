package web;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import model.Imovel;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "ApiServlet", urlPatterns = {"/api/*"})
public class ApiServlet extends HttpServlet {
    
    private JSONObject getJSONBody(BufferedReader reader) throws IOException{
        StringBuilder buffer = new StringBuilder();
        String line = null;
        while((line = reader.readLine()) != null){
            buffer.append(line);
        }
        return new JSONObject(buffer.toString());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        JSONObject file = new JSONObject();
        try{
            if(request.getRequestURI().endsWith("/api/imovel")){
                processImovel(file, request, response);
            }else{
                response.sendError(400, "Invalid URL");
                file.put("error", "Invalid URL");
            }
        }catch(Exception ex){
            response.sendError(500, "Internal error: "+ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processImovel(JSONObject file, HttpServletRequest request, HttpServletResponse response) throws Exception{
        if(request.getMethod().toLowerCase().equals("get")){
            file.put("list", new JSONArray(Imovel.getImovel()));
        }else if(request.getMethod().toLowerCase().equals("post")){
            JSONObject body = getJSONBody(request.getReader());
            String cd_imovel = body.getString("cd_imovel");
            int qt_sala_imovel = body.getInt("qt_sala_imovel");
            int qt_dormitorio_imovel = body.getInt("qt_dormitorio_imovel");
            int qt_banheiro_imovel = body.getInt("qt_banheiro_imovel");
            int qt_cozinha_imovel = body.getInt("qt_cozinha_imovel");
            int qt_suite_imovel = body.getInt("qt_suite_imovel");
            int qt_quintal_imovel = body.getInt("qt_quintal_imovel");
            double vl_imovel = body.getDouble("vl_imovel");
            Imovel.addImovel(cd_imovel, qt_sala_imovel, qt_dormitorio_imovel, qt_banheiro_imovel, qt_cozinha_imovel, qt_suite_imovel, qt_quintal_imovel, vl_imovel);
        }else if(request.getMethod().toLowerCase().equals("put")){
            JSONObject body = getJSONBody(request.getReader());
            String cd_imovel = body.getString("cd_imovel");
            int qt_sala_imovel = body.getInt("qt_sala_imovel");
            int qt_dormitorio_imovel = body.getInt("qt_dormitorio_imovel");
            int qt_banheiro_imovel = body.getInt("qt_banheiro_imovel");
            int qt_cozinha_imovel = body.getInt("qt_cozinha_imovel");
            int qt_suite_imovel = body.getInt("qt_suite_imovel");
            int qt_quintal_imovel = body.getInt("qt_quintal_imovel");
            double vl_imovel = body.getDouble("vl_imovel");
            Imovel.updateImovel(cd_imovel, qt_sala_imovel, qt_dormitorio_imovel, qt_banheiro_imovel, qt_cozinha_imovel, qt_suite_imovel, qt_quintal_imovel, vl_imovel);
        }else if(request.getMethod().toLowerCase().equals("delete")){
            Long id = Long.parseLong(request.getParameter("id"));
            Imovel.deleteImovel(id);
        }else{
            response.sendError(405, "Method not allowed");
            
        }
    }

}
