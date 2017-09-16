package modelo;

import lombok.Data;

/**
 * Created by Francis Cáceres on 31/5/2017.
 */
@Data
public class Registro {
    String nombre;
    String sector;
    String nivel;
    String location;
    Double latitud;
    Double longitud;

    public Registro(String nombre, String sector, String nivel, String location, Double latitud, Double longitud) {
        this.nombre = nombre;
        this.sector = sector;
        this.nivel = nivel;
        this.location = location;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public Registro() {

    }
}
