<%@page import="java.util.Map"%>
<%@page import="com.kamal.mycartplace.helper.Helper"%>
<%@page import="com.kamal.mycartplace.dao.CategoryDao"%>
<%@page import="com.kamal.mycartplace.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.kamal.mycartplace.helper.FactoryProvider"%>

<%@page import="com.kamal.mycartplace.entites.User"%>
<%
//protecting to the admin page by direct accessing ;;;
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "you are not logged in ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin");
            response.sendRedirect("login.jsp");

            return;
        }

    }


%>
  <%
                                   CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                                   List<Category> list = cdao.getCategories();
                                   
                        Map<String,Long> m =   Helper.getCounts(FactoryProvider.getFactory());

                                
                                %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MycartPlace Admin Page</title>
        <%@include file = "components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body style="background-color:white ">
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="container mt-3">
                <%@include file="components/message.jsp" %>

            </div>
            <div class ="row">
                <!--first col-->
                <div class="col-md-4 mt-2">
                    <div class ="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/man.png" alt="user_icon">


                            </div>

                            <h1 class="mt-2"><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>  
                </div>
                <!--second-col-->
                <div class="col-md-4 mt-2">
                    <div class ="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">


                            </div>

                            <h1 class="mt-2"><%=list.size()%></h1>
                            <h1 class=" text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>  
                </div>
                <!--third-col-->
                <div class="col-md-4 mt-2">
                    <div class ="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon">


                            </div>
                            <h1 class="mt-2"><%=m.get("productCount")%></h1>
                            <h1 class=" text-uppercase text-muted">Products</h1>
                        </div>
                    </div>  
                </div>


            </div>
            <!--second row-->
            <div class="row">
                <div class="col-md-6 mt-2">
                    <div class="card" data-toggle="modal" data-target="#addcategoryModel">
                        <div class ="card-body text-center">

                            <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/interace.png" alt="category
                                 _icon">
                            <h4 class="mt-2">Add Category Here !!</h4>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>


                    </div>
                </div>

                <div class="col-md-6 mt-2">
                    <div class="card"  data-toggle="modal" data-target="#addproductmodal">
                        <div class ="card-body text-center">
                            <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/packaging.png" alt="product_icon">
                               
                            <h4 class="mt-2">Add Product Here !</h4>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>


                    </div>
                </div>
            </div>
            <!-- start add category model-->
            <!-- Button trigger modal -->


            <!-- Model -->
            <div class="modal fade" id="addcategoryModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ProductOpretionServlet" method="post">
                                <input type="hidden" value="addcategory" name="opretion">

                                <div class="form-group">
                                    <input type ="text" class ="form-control" name="catTitle" placeholder="Enter category title" required>


                                </div>
                                <div class="form-group">
                                    <textarea  style="height: 200px" class="form-control" placeholder="Enter the Description of category" required name="catDescription" ></textarea>


                                </div>
                                <div class ="container text-center">
                                    <button  style="background-color:green" class ="btn btn-outline-success text-white">Add Category</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>

                            </form>

                        </div>

                    </div>
                </div>
            </div>

            <!-- end add category modal-->

            <!--=====================================================================================================================================================-->           
            <!--start- add product modal-->

            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal fade" id="addproductmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!--start form-->
                            <form  action="ProductOpretionServlet" method="post" enctype="multipart/form-data">

                                <input type = "hidden" name ="opretion" value ="addproduct">

                                <!--product title-->
                                <div class="form-group">
                                    <input name="pName" type="text" class="form-control" placeholder="Enter the Title of product" required >
                                </div>
                                <!--product description-->
                                <div class="form-group">
                                    <textarea  style="height: 100px" class="form-control" placeholder="Enter Product description" name="pDesc" ></textarea>
                                </div>
                                <!--product price--> 
                                <div class="form-group">
                                    <input name="pPrice" type="number" class="form-control" placeholder="Enter the price of the Product" required >
                                </div>
                                <!--product discount-->
                                <div class="form-group">
                                    <input name="pDiscount" type="number" class="form-control" placeholder="Enter the Product Discount">
                                </div>
                                <!--product quantity-->
                                <div class="form-group">
                                    <input name="pQuantity" type="number" class="form-control" placeholder="Enter the Product Quantity" required>
                                </div>
                                <!--product category , very imp for fetching the real time category-->
                                
                              

                                <div class="form-group">
                                    <select  name ="catId" class="form-control " >
                                        <%
                                        for(Category c :list){
                                        
                                            
                                        %>

                                        <option value="<%=c.getCategoryId()%>"><%= c.getCategoryTitle() %> </option>
                                        <%}%>

                                    </select>
                                </div>
                                <!--product file-->
                                <div class ="form-group">
                                <label for="pPic" >Select Picture of Product</label>
                                <br>
                                <input type ="file" name ="pPic"  id ="pPic" required >
                                </div>
                                <!--submit button-->
                                <div class ="container text-center">
                                    <button  style="background-color:green" class ="btn btn-outline-success text-white">Add Product</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>                     





                            </form> 
                            <!--end form-->

                        </div>

                    </div>
                </div>
            </div>









            <!--end- add product modal-->
    </body>
</html>
