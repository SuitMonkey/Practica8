package main;

import freemarker.template.Configuration;
import modelo.Registro;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;
import static spark.Spark.get;
import static spark.Spark.post;

/**
 * Created by Francis Cáceres on 12/9/2017.
 */
public class Main {
    public static void main(String[] args) {
        ArrayList<Registro> registros = new ArrayList<>();

        staticFiles.location("plantilla");

        Configuration configuration=new Configuration(Configuration.VERSION_2_3_23);
        configuration.setClassForTemplateLoading(Main.class, "/templates");
        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(configuration);

        get("/",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();

            attributes.put("estudiantes",registros);

            return new ModelAndView(attributes,"inicio.ftl");
        },freeMarkerEngine);

        post("/",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();
            Registro reg = new Registro();
            reg.setNombre(request.queryParams("Nombre"));
            reg.setSector(request.queryParams("Sector"));
            reg.setNivel(request.queryParams("Nivel"));
            reg.setLocation(request.queryParams("ubicacion"));
            System.out.println("Nivel - "+request.queryParams("Nivel")+" "+"Ubicacion - "+request.queryParams("ubicacion"));

            registros.add(reg);
            response.redirect("/");


            return new ModelAndView(attributes,"inicio.ftl");
        },freeMarkerEngine);

        get("/borrar",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();
            String mat = request.queryParams("mat");
            System.out.println("Borroo");

            for(Registro s: registros){
                if(s.getNombre().equals(mat)){
                    registros.remove(s);
                    break;
                }
            }
            response.redirect("/");

            return new ModelAndView(attributes,"inicio.ftl");
        },freeMarkerEngine);

        get("/perfil",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();
            String mat = request.queryParams("mat");
            Registro elegido = null;

            for(Registro s: registros){
                if(s.getNombre().equals(mat)){
                    elegido = new Registro();
                    elegido.setNombre(s.getNombre());
                    elegido.setSector(s.getSector());
                    elegido.setNivel(s.getNivel());
                    elegido.setLocation(s.getLocation());
                }
            }

            attributes.put("ele",elegido);

            return new ModelAndView(attributes,"perfil.ftl");
        },freeMarkerEngine);

        post("/perfil",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();

            String mat = request.queryParams("Matricula");
            String nom = request.queryParams("Nombre");
            String ape = request.queryParams("Apellido");
            String tel = request.queryParams("Telefono");



            response.redirect("/");

            return new ModelAndView(attributes,"inicio.ftl");
        },freeMarkerEngine);

    }
}
