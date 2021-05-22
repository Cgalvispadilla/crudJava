<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.Producto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

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

                        <div class="card-body">
                            <div class="flex flex-row justify-between items-center">
                                <h1 class="font-extrabold text-lg">Productos</h1>
                                <form action="ProductoController" method="POST">
                                    <input type="submit" name="accion" value="Agregar" class="btn-gray text-sm">
                                </form>
                            </div>    
                        </div>


                        <table class="table-auto w-full mt-5 text-right">

                            <thead>
                                <tr>
                                    <td class="py-4 font-extrabold text-sm text-left">Producto</td>
                                    <td class="py-4 font-extrabold text-sm text-left">Descripción</td>
                                    <td class="py-4 font-extrabold text-sm">Precio</td>
                                    <td class="py-4 font-extrabold text-sm">Categoria</td>
                                    <td class="py-4 font-extrabold text-sm">Talla</td>
                                    <td class="py-4 font-extrabold text-sm">Color</td>
                                    <th class="py-4 font-extrabold text-sm">Acciones</th>
                                </tr>
                            </thead>
                            <c:forEach var="dato" items="${lista}">
                                <tbody>
                                    <!-- item -->
                                    <tr class="">
                                        <td class="py-4 text-sm text-gray-600 flex flex-row items-center text-left">
                                            <div class="w-8 h-8 overflow-hidden mr-3">
                                                <img src="ImagenController?id=${dato.getId()}" class="object-cover">
                                            </div>
                                            ${dato.getNombre()}
                                        </td>
                                        <td class="py-4 text-xs text-gray-600 text-left">${dato.getDescripcion()}</td>
                                        <td class="py-4 text-xs text-gray-600">${dato.getPrecio()}</td>
                                        <td class="py-4 text-xs text-gray-600">${dato.getCategoria()}</td>
                                        <td class="py-4 text-xs text-gray-600">${dato.getTalla()}</td>
                                        <td class="py-4 text-xs text-gray-600">${dato.getColor()}</td>
                                        <td class="py-4 text-xs text-gray-600">
                                            <div class="flex flex-row-reverse">
                                                <form>
                                                    <a href="ProductoController?accion=Eliminar&id=${dato.getId()}" class="flex flex-1 bg-red-600 hover:bg-red-300 text-white font-bold py-2 px-4 rounded-full" >Eliminar</a>
                                                </form>
                                                <form>
                                                    <a href="ProductoController?accion=Editar&id=${dato.getId()}" class="flex flex-1 bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full">Editar</a>
                                                </form>


                                            </div>         
                                        </td>
                                    </tr>
                                    <!-- end item -->
                                </c:forEach>



                            </tbody>

                        </table>

                    </div>
                </div>   
            </div>
            <!-- end content -->
        </div>
        <!-- end wrapper -->

        <!-- script -->
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="js/scripts.js"></script>
        <!-- end script -->
    </body>
</html>
