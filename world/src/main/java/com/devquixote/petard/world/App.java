package com.devquixote.petard.world;

import static spark.Spark.get;
import static spark.Spark.port;

public class App {
    public static void main(String[] args) {
        port(10002);
        get("/world", (req, resp) -> "World");
    }
}
