package com.starbucks.proyecto.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productos")
public class ProductosController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ProductosController.class.getName());

    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/starbucks";
    static final String DB_USER = "root";
    static final String DB_PASS = "juan1211";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?redir=productos");
            return;
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='es'><head><title>Productos Starbucks</title>");
        out.println("<link href='css/styles.css' rel='stylesheet'/>");
        out.println("</head><body>");
        out.println("<div class='container' style='margin-top:100px'>");
        out.println("<h2>Productos Starbucks (Inventario Activo)</h2>");
        out.println("<table class='table table-striped'>");
        out.println("<thead><tr><th>ID</th><th>Nombre</th><th>Descripción</th></tr></thead>");
        out.println("<tbody>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                String sql = "SELECT id, nombre, descripcion FROM productos";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    String desc = rs.getString("descripcion");
                    if (desc == null) desc = "Sin descripción";

                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("id") + "</td>");
                    out.println("<td>" + rs.getString("nombre") + "</td>");
                    out.println("<td>" + desc + "</td>");
                    out.println("</tr>");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Error en la base de datos", e);
            out.println("<tr><td colspan='3'>Error al cargar productos.</td></tr>");
        }

        out.println("</tbody></table>");
        out.println("<div style='display:flex; gap:10px;'>");
        out.println("  <a href='index.jsp' class='btn btn-primary'>Volver al Menú Principal</a>");
        out.println("</div>");
        out.println("</div></body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        String idProductoStr = request.getParameter("idProducto");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                if (null != accion) switch (accion) {
                    case "añadir":{
                        String sql = "INSERT INTO productos (nombre, descripcion) VALUES (?, ?)";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setString(1, nombre);
                            stmt.setString(2, descripcion);
                            stmt.executeUpdate();
                        }   break;
                        }
                    case "actualizar":{
                        String sql = "UPDATE productos SET nombre = ?, descripcion = ? WHERE id = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setString(1, nombre);
                            stmt.setString(2, descripcion);
                            stmt.setInt(3, Integer.parseInt(idProductoStr));
                            stmt.executeUpdate();
                        }   break;
                        }
                    case "eliminar":{
                        String sql = "DELETE FROM productos WHERE id = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setInt(1, Integer.parseInt(idProductoStr));
                            stmt.executeUpdate();
                        }   break;
                        }
                    default:
                        break;
                }
            }
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Error al procesar acción: " + accion, e);
        }

        response.sendRedirect("productos");
    }
}