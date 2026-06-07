package com.starbucks.proyecto.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/principal")
public class AutenticacionController extends HttpServlet {

    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/starbucks";
    static final String DB_USER = "root";
    static final String DB_PASS = "juan1211";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarSolicitud(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarSolicitud(request, response);
    }

    private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String accion = request.getParameter("accion");
        if (accion == null && request.getQueryString() != null) {
            if (request.getQueryString().contains("accion=registrar")) {
                accion = "registrar";
            } else if (request.getQueryString().contains("accion=logout")) {
                accion = "logout";
            } else if (request.getQueryString().contains("accion=login")) {
                accion = "login";
            }
        }

        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String redir = request.getParameter("redir");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                if ("logout".equals(accion)) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.invalidate(); // Destruye los datos del usuario en memoria
                    }
                    response.sendRedirect("index.jsp"); // Expulsa al usuario a la página de bienvenida
                    return; // Detiene la ejecución aquí para que no salte el error de campos vacíos
                }

                if (usuario == null || contrasena == null || usuario.trim().isEmpty() || contrasena.trim().isEmpty()) {
                    out.println("<h1>Error: Los campos no pueden estar vacíos.</h1>");
                    out.println("<a href='login.jsp'>Volver</a>");
                    return;
                }

                if ("login".equals(accion)) {
                    String sql = "SELECT * FROM usuarios WHERE usuario=? AND contrasena=?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, usuario);
                        stmt.setString(2, contrasena);

                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                HttpSession session = request.getSession();
                                session.setAttribute("user", usuario);
                                
                                // Manejo inteligente del redireccionamiento dinámico
                                if ("usuarios".equals(redir)) {
                                    response.sendRedirect("usuarios");
                                } else if ("productos".equals(redir)) {
                                    response.sendRedirect("productos");
                                } else {
                                    response.sendRedirect("pedido.jsp");
                                }
                            } else {
                                out.println("<h1>Error: Usuario o contraseña incorrectos.</h1>");
                                out.println("<a href='login.jsp'>Volver</a>");
                            }
                        }
                    }
                } 

                else if ("registrar".equals(accion)) {
                    String verificarSql = "SELECT * FROM usuarios WHERE usuario=?";
                    try (PreparedStatement verificarStmt = conn.prepareStatement(verificarSql)) {
                        verificarStmt.setString(1, usuario);

                        try (ResultSet rsVerificar = verificarStmt.executeQuery()) {
                            if (rsVerificar.next()) {
                                out.println("<h1>Error: El nombre de usuario ya está registrado</h1>");
                                out.println("<a href='login.jsp'>Elegir otro nombre</a>");
                            } else {
                                String insertarSql = "INSERT INTO usuarios (usuario, contrasena) VALUES (?, ?)";
                                try (PreparedStatement insertarStmt = conn.prepareStatement(insertarSql)) {
                                    insertarStmt.setString(1, usuario);
                                    insertarStmt.setString(2, contrasena);

                                    int filasInsertadas = insertarStmt.executeUpdate();

                                    if (filasInsertadas > 0) {
                                        HttpSession session = request.getSession();
                                        session.setAttribute("user", usuario);
                                        response.sendRedirect("pedido.jsp");
                                    } else {
                                        out.println("<h1>Error al registrar el usuario.</h1>");
                                        out.println("<a href='login.jsp'>Volver</a>");
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(out);
            out.println("<h1>Error interno del servidor.</h1>");
        }
    }
}
