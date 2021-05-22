<%-- 
    Document   : SideBar
    Created on : 3/11/2020, 08:46:03 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <!-- start sidebar -->
        <div id="sideBar"
             class="relative flex flex-col flex-wrap bg-white border-r border-gray-300 p-6 flex-none w-64 md:-ml-64 md:fixed md:top-0 md:z-30 md:h-screen md:shadow-xl animated faster">


            <!-- sidebar content -->
            <div class="flex flex-col">

                <!-- sidebar toggle -->
                <div class="text-right hidden md:block mb-4">
                    <button id="sideBarHideBtn">
                        <i class="fad fa-times-circle"></i>
                    </button>
                </div>
                <!-- end sidebar toggle -->

                <p class="uppercase text-xs text-gray-600 mb-4 tracking-wider">Productos</p>
                <!-- link -->
                <form action="ProductoController" method="POST">
                    <i class="fad fa-list-ul text-xs mr-2"></i>
                    <input type="submit" name="accion" value="listar" class="mb-3 capitalize font-medium text-sm hover:text-teal-600 transition ease-in-out duration-500">
                        
                        
                    </input>
                </form>  

                <!-- end link -->

                <p class="uppercase text-xs text-gray-600 mb-4 mt-4 tracking-wider">Entregas</p>

                <!-- link -->
                <a href="./email.html"
                   class="mb-3 capitalize font-medium text-sm hover:text-teal-600 transition ease-in-out duration-500">
                    <i class="fad fa-envelope-open-text text-xs mr-2"></i>
                    ---falta---
                </a>
                <!-- end link -->

                <!-- link -->
                <a href="#"
                   class="mb-3 capitalize font-medium text-sm hover:text-teal-600 transition ease-in-out duration-500">
                    <i class="fad fa-comments text-xs mr-2"></i>
                    ---falta---
                </a>
                <!-- end link -->

                <!-- link -->
                <a href="#"
                   class="mb-3 capitalize font-medium text-sm hover:text-teal-600 transition ease-in-out duration-500">
                    <i class="fad fa-shield-check text-xs mr-2"></i>
                    ---falta---
                </a>
                <!-- end link -->
            </div>
            <!-- end sidebar content -->
        </div>
        <!-- end sidbar -->
    </body>
</html>
