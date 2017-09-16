package main;

import database.Manejador;
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

        Manejador bd = new Manejador();
        bd.crearTablas();

        staticFiles.location("plantilla");

        Configuration configuration=new Configuration(Configuration.VERSION_2_3_23);
        configuration.setClassForTemplateLoading(Main.class, "/templates");
        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(configuration);

        get("/",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();


            return new ModelAndView(attributes,"inicio.ftl");
        },freeMarkerEngine);


        get("/perfil",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();

            attributes.put("registros",bd.listaRegistros());

            return new ModelAndView(attributes,"perfil.ftl");
        },freeMarkerEngine);


        post("/insertpostgres",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();

            String ubicacion = request.queryParams("ubicacion");
            String nombre = request.queryParams("nombre");
            String sector = request.queryParams("sector");
            String nivel = request.queryParams("nivel");
            String lat = request.queryParams("lat");
            String lon = request.queryParams("long");
            System.out.println(nombre + " " + sector + " " + nivel + " " + ubicacion);

            bd.insertarRegistro(new Registro(nombre,sector,nivel,ubicacion,Double.parseDouble(lat),Double.parseDouble(lon)));

            return "ok";
        });

        get("/prueba",(request,response)->{
            Map<String,Object> attributes = new HashMap<>();



            return new ModelAndView(attributes,"prueba.ftl");
        },freeMarkerEngine);

    }
}
