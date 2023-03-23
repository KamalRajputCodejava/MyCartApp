<%-- 
    Document   : index
    Created on : 07-Mar-2023, 9:08:17 pm
    Author     : Lenovo
--%>

<%@page import="com.kamal.mycartplace.helper.Helper"%>
<%@page import="com.kamal.mycartplace.entites.Category"%>
<%@page import="com.kamal.mycartplace.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.kamal.mycartplace.entites.Product"%>
<%@page import="com.kamal.mycartplace.dao.ProductDao"%>
<%@page import="com.kamal.mycartplace.helper.FactoryProvider"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> MyCartplace-HomePage</title>
        <%@include file = "components/common_css_js.jsp" %>
      
    </head>    
    <body style="background-color:white">
        <%@include file= "components/navbar.jsp" %>
        <div class="row mt-3 mx-2" >
            <%
                String cat = request.getParameter("category");

                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                if (cat == null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();

                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);

                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());

                List<Category> clist = cdao.getCategories();

            %>

            <!--show categories;-->
            <div class="col-md-2 mt-4">

                <a href="index.jsp?category=all" class="list-group-item list-group-item-active bg-primary text-white">
                    ALL PRODUCTS
                </a>




                <%                    for (Category c : clist) {


                %>
                <!--url rewriting-->
                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>    



                <% } %>



            </div>
            <!--show products-->
            <div class="col-md-10">
                <!--row-->
                <div class="row mt-4" >
                    <div class="col-md-12">
                        <div class="card-columns">

                            <!--traversing product by for loop-->
                            <%
                                for (Product p : list) {


                            %>
                            <!--products area-->
                            <div class="card">
                                <!--showing Photo of product ;-->
                                <div class="container text-center">
                                    <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 250px;max-width: 100%;width:auto"  class="card-img-top" alt="...">
                                </div>


                                <div class="card-body">
                                    <h6   style="font-size:14px" class="card-title "><%= p.getpName()%></h6>
                                    <p  style="font-size: 13px" class="card-text">
                                        <%=Helper.get10Words(p.getpDesc())%>

                                    </p>

                                </div>
                                <div class="card-footer  text-center">
                                    <button class="btn bg-primary text-white" onclick="add_to_cart( <%=p.getPId()%> ,'<%=p.getpName()%>' ,<%=p.getPriceAfterApplyingDiscount()%> )">Add to cart</button>
                                    <button class="btn btn-outline-success " > &#8377; <%= p.getpPrice()%>/-<span class="text-secondary discount-label"><%=p.getPriceAfterApplyingDiscount()%> &#8377;after{<%=p.getpDiscount()%>%}OFF</span></button>



                                </div>

                            </div>
                            <%}%> 

                            <%
                                if (list.size() == 0) {
                                    out.println("no data in this category");

                                }

                            %>

                        </div>


                    </div>


                </div>

            </div>

        </div>
                            <%@include file="components/common_models.jsp" %>
    </body>
</html>
