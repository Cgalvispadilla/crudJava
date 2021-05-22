<%-- 
    Document   : IndexProducto
    Created on : 3/11/2020, 09:08:45 PM
    Author     : ASUS
--%>

<%@page import="Model.ProductoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.Producto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>

    </head>

    <body class="bg-gray-100">

        <%@include file = "../Plantillas/navbar.jsp" %>

        <!-- strat wrapper -->
        <div class="h-screen flex flex-row flex-wrap">

            <%@include file = "../Plantillas/SideBar.jsp" %>

            <!-- strat content -->
            <div class="bg-gray-100 flex-1 p-6 md:mt-16">


                <div class="grid grid-cols-1 lg:grid-cols-1 gap-5 mt-5">
                    <div class="card">
                        <%
                            ProductoDAO dao = new ProductoDAO();
                            int id = Integer.parseInt(request.getParameter("id").toString());
                            Producto p = dao.list(id);
                        %>
                        <form class="w-full max-w-none" method="post" action="ProductoController" enctype="multipart/form-data">
                            <input  name="idPer" type="hidden" value="<%=p.getId()%>">
                            <div class="flex flex-wrap -mx-3 mb-6">
                                <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="nombre">
                                        Nombre
                                    </label>
                                    <input class="appearance-none block w-full bg-gray-200 text-gray-700 border b rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="nombre" name="nombre" type="text" placeholder="Blusa" value="<%=p.getNombre()%>">

                                </div>
                                <div class="w-full md:w-1/2 px-3">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="descripcion">
                                        Descripción
                                    </label>
                                    <textarea class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="Descripcion" name="Descripcion" type="text" placeholder="Descripción del producto"><%=p.getDescripcion()%></textarea>   
                                </div>
                            </div>
                            <div class="flex flex-wrap -mx-3 mb-6">
                                <div class="w-full px-3">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="precio">
                                        precio
                                    </label>
                                    <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="precio" name="precio" type="text" placeholder="$9999" value="<%=p.getPrecio()%>">

                                </div>
                                <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="talla">
                                        Talla
                                    </label>
                                    <div class="relative">
                                        <select class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="talla" name="talla">
                                            <% if (p.getTalla().equalsIgnoreCase("XS")) { %>
                                            <option selected>XS</option>
                                            <option>S</option>
                                            <option>M</option>
                                            <option>L</option>
                                            <option>XL</option>
                                            <option>XXL</option>
                                            <% } else if (p.getTalla().equalsIgnoreCase("S")) {%>         
                                            <option>XS</option>
                                            <option selected>S</option>
                                            <option>M</option>
                                            <option>L</option>
                                            <option>XL</option>
                                            <option>XXL</option>
                                            <% } else if (p.getTalla().equalsIgnoreCase("M")) {%>   
                                            <option>XS</option>
                                            <option>S</option>
                                            <option selected>M</option>
                                            <option>L</option>
                                            <option>XL</option>
                                            <option>XXL</option>
                                            <% } else if (p.getTalla().equalsIgnoreCase("L")) {%>   
                                            <option>XS</option>
                                            <option>S</option>
                                            <option>M</option>
                                            <option selected>L</option>
                                            <option>XL</option>
                                            <option>XXL</option>
                                            <% } else if (p.getTalla().equalsIgnoreCase("XL")) {%>   
                                            <option>XS</option>
                                            <option>S</option>
                                            <option>M</option>
                                            <option>L</option>
                                            <option selected>XL</option>
                                            <option>XXL</option>
                                            <% } else {%>   
                                            <option>XS</option>
                                            <option>S</option>
                                            <option>M</option>
                                            <option>L</option>
                                            <option>XL</option>
                                            <option selected>XXL</option>
                                            <% }%>
                                        </select>
                                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2       text-gray-700">
                                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="categoria">
                                        Categoría
                                    </label>
                                    <div class="relative">
                                        <select class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="categoria" name="categoria" >
                                            <% if (p.getCategoria().equalsIgnoreCase("Hombre")) { %>
                                            <option selected>Hombre</option>
                                            <option>Mujer</option>
                                            <option>Niño</option>
                                            <option>Unisex</option>
                                            <%} else if (p.getCategoria().equalsIgnoreCase("Mujer")) { %>

                                            <option>Hombre</option>
                                            <option selected>Mujer</option>
                                            <option>Niño</option>
                                            <option>Unisex</option>
                                            <% } else if (p.getCategoria().equalsIgnoreCase("Niño")) { %>

                                            <option>Hombre</option>
                                            <option>Mujer</option>
                                            <option selected>Niño</option>
                                            <option>Unisex</option>
                                            <%} else { %>
                                            <option>Hombre</option>
                                            <option>Mujer</option>
                                            <option>Niño</option>
                                            <option selected>Unisex</option>
                                            <% }%>


                                        </select>
                                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2       text-gray-700">
                                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="cantidad">
                                        Cantidad existente
                                    </label>
                                    <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="cantidad" name="cantidad" type="text" placeholder="1,2,3..." value="<%=p.getCatidad()%>">
                                </div>
                                <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="color">
                                        Color
                                    </label>
                                    <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="color" name="color" type="text" placeholder="Negro, rojo, etc..." value="<%=p.getColor()%>">
                                </div>
                                <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="image">
                                        Imagen
                                    </label>
                                    <img src="ImagenController?id=<%=p.getId()%>" >
                                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="imagen">
                                        Cargar Nueva Imagen
                                    </label>
                                    <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="image"  name="imagen" type="file">
                                </div>
                            </div>
                                    <input type="submit" name="accion"  value="Actualizar" class="bg-blue-500 hover:bg-blue-300 text-white font-bold py-2 px-4 border-b-4  border-blue-700 hover:border-blue-500 rounded">

                        </form>
                    </div>
                </div>    


                </html>