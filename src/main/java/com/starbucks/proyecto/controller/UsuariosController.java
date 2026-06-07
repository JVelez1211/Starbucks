package com.starbucks.proyecto.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/usuarios")
public class UsuariosController extends HttpServlet {

    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/starbucks";
    static final String DB_USER = "root";
    static final String DB_PASS = "juan1211";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?redir=usuarios");
            return;
        }

        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Usuarios</title>");
        out.println("<link href='css/styles.css' rel='stylesheet'/>");
        out.println("</head><body>");
        out.println("<div class='container' style='margin-top:100px'>");
        out.println("<h2>Usuarios Registrados</h2>");

        out.println("<table class='table table-striped'>");
        out.println("<thead><tr><th>Nombre de Usuario</th></tr></thead>");
        out.println("<tbody>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
 
                String sql = "SELECT usuario FROM usuarios";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("usuario") + "</td>");
                    out.println("</tr>");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("<tr><td>Error: " + e.getMessage() + "</td></tr>");
        }

        out.println("<div style='display:flex; gap:10px;'>");
        out.println("  <a href='index.jsp' class='btn btn-primary'>Volver al Menú Principal</a>");
        out.println("  <a href='principal?accion=logout' class='btn btn-danger'>Cerrar Sesión</a>"); // 🌟 Botón rojo directo al servlet
        out.println("</div>");
    }
}