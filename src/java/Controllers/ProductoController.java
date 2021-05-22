/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Model.Producto;
import Model.ProductoDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class ProductoController extends HttpServlet {

    String listar = "View/IndexProducto.jsp";
    String add = "View/CreateProducto.jsp";
    String edit = "View/EditProducto.jsp";
    ProductoDAO dao = new ProductoDAO();
    Producto p = new Producto();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductoController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "Editar":
                request.setAttribute("id", request.getParameter("id"));
                request.getRequestDispatcher(edit).forward(request, response);
                break;
            case "Eliminar":
                int id2 = Integer.parseInt(request.getParameter("id"));
                p.setId(id2);
                dao.eliminar(id2);
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
                break;

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                List<Producto> lista = dao.Listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher(listar).forward(request, response);
                break;
            case "Agregar":
                request.getRequestDispatcher(add).forward(request, response);
                break;
            case "guardar":
                String nombre = request.getParameter("nombre");
                String Descripcion = request.getParameter("Descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                String talla = request.getParameter("talla");
                String categoria = request.getParameter("categoria");
                int catidad = Integer.parseInt(request.getParameter("cantidad"));
                String color = request.getParameter("color");
                Part part = request.getPart("imagen");
                InputStream inputStream = part.getInputStream();
                p.setNombre(nombre);
                p.setDescripcion(Descripcion);
                p.setPrecio(precio);
                p.setTalla(talla);
                p.setCategoria(categoria);
                p.setCatidad(catidad);
                p.setColor(color);
                p.setImagen(inputStream);
                dao.Agregar(p);
                request.getRequestDispatcher("ProductoController?accion=listar").forward(request, response);
                break;
            case "Actualizar":
                int id1 = Integer.parseInt(request.getParameter("idPer"));
                String nombre1 = request.getParameter("nombre");
                String Descripcion1 = request.getParameter("Descripcion");
                double precio1 = Double.parseDouble(request.getParameter("precio"));
                String talla1 = request.getParameter("talla");
                String categoria1 = request.getParameter("categoria");
                int catidad1 = Integer.parseInt(request.getParameter("cantidad"));
                String color1 = request.getParameter("color");
                Part part1 = request.getPart("imagen");
                InputStream inputStream1 = part1.getInputStream();
                p.setId(id1);
                p.setNombre(nombre1);
                p.setDescripcion(Descripcion1);
                p.setPrecio(precio1);
                p.setTalla(talla1);
                p.setCategoria(categoria1);
                p.setCatidad(catidad1);
                p.setColor(color1);
                p.setImagen(inputStream1);
                System.out.println(p);
                dao.editSinImg(p);
                request.getRequestDispatcher("ProductoController?accion=listar").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("ProductoController?accion=listar").forward(request, response);
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
