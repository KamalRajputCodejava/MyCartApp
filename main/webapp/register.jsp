<%-- 
    Document   : register
    Created on : 09-Mar-2023, 11:45:46 am
    Author     : Lenovo
--%>

<%@page import="com.kamal.mycartplace.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NewUser</title>
         <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body style="background-color: wheat">

        
       <%@include file ="components/navbar.jsp" %>
        <div style="padding: 20px">
            <div class ="row mt-1">
                <div class ="col-md-4 offset-md-4">
                    <div class ="card">
                        <%@include file ="components/message.jsp" %>
                        <div class ="card-header bg-primary text-white">
                            <h4 class="text-center my-2">Sign Up here</h4>
                            
                        </div>
                        
                        <div class ="card-body px-2">
                    
                    <form action="RegisterServlet" method ="post">
                        <div class="form-group">
    <label for="name">User Name</label>
    <input     name ="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter UserName">
                       </div>
                        <div class="form-group">
    <label for="email">User Email</label>
    <input  name ="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter UserEmail">
                       </div>
                        <div class="form-group">
    <label for="password">User Password</label>
    <input  name ="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter password">
                       </div>
                        <div class="form-group">
    <label for="phone">User Phone</label>
    <input name ="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter phonenumber">
                       </div>
                        <div class = "from-group">
              <label for="phone">User Address</label>           
              <textarea  name ="user_address" style="height: 200px;" class ="form-control" placeholder ="Enter Address"></textarea>
                        </div>
                        <br>
                        <div class="container text-center">
                            <button class ="btn btn-outline-success bg-primary text-white">Register</button>                            
                            <button class ="btn btn-outline-warning bg-dark text-white">Reset</button>                            
                        </div>       
                        
                    </form>
                        </div>
                    </div>
                    
                    
                    
                    
                </div>
                
                
                
            </div>
        
        </div>
    </body>
</html>
