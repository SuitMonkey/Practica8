package database;

import modelo.Registro;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Francis Cáceres on 13/9/2017.
 */
public class Manejador {

    public Connection connect()
    {
        Connection c = null;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/practica8db",
                    "cabral", "1234");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }
        System.out.println("Opened database successfully");

        return c;
    }

    public void crearTablas()
    {
        Connection con = connect();
        System.out.println("crearTablas");
        try {
            Statement stmt = con.createStatement();

            String sql;

            sql = "CREATE TABLE IF NOT EXISTS Registro (" +
                    "  RegistroCode serial PRIMARY KEY," +
                    "  nombre text," +
                    "  sector text," +
                    "  nivel text," +
                    "  ubicacion text," +
                    "  latitud NUMERIC," +
                    "  longitud NUMERIC)";
            stmt.executeUpdate(sql);

            stmt.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void insertarRegistro(Registro registro){
        Connection con = connect();
        System.out.println("insertarRegistro");
        String sql = null;


        try {
            sql = "INSERT INTO REGISTRO (NOMBRE,SECTOR,NIVEL,UBICACION,LATITUD,LONGITUD) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setString(1,registro.getNombre());
            ps1.setString(2,registro.getSector());
            ps1.setString(3,registro.getNivel());
            ps1.setString(4,registro.getLocation());
            ps1.setDouble(5,registro.getLatitud());
            ps1.setDouble(6,registro.getLongitud());

            ps1.executeUpdate();


            System.out.println("Registro_insertado!");

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Registro> listaRegistros()
    {
        Connection con = connect();
        System.out.println("listar");
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Registro> listPer = new ArrayList<>();

        try {
            stmt = con.createStatement();
            String sql = "SELECT NOMBRE,SECTOR,NIVEL,UBICACION,LATITUD,LONGITUD FROM REGISTRO";
            rs = stmt.executeQuery(sql);

            while(rs.next()){
                String NOMBRE = rs.getString("NOMBRE");
                String SECTOR = rs.getString("SECTOR");
                String NIVEL = rs.getString("NIVEL");
                String UBICACION = rs.getString("UBICACION");
                Double LATITUD = rs.getDouble("LATITUD");
                Double LONGITUD = rs.getDouble("LONGITUD");

                listPer.add(new Registro(NOMBRE,SECTOR,NIVEL,UBICACION,LATITUD,LONGITUD));

            }

            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPer;

    }



}
