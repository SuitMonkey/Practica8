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

    public Registro(String nombre, String sector, String nivel, String location) {
        this.nombre = nombre;
        this.sector = sector;
        this.nivel = nivel;
        this.location = location;
    }

    public Registro() {

    }
}
