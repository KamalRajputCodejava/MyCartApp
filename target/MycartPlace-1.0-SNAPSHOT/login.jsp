<%-- 
    Document   : login
    Created on : 09-Mar-2023, 6:55:41 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login-MycartPlace</title>
        <%@include file ="components/common_css_js.jsp" %>
    </head>
    <body style="background-color: wheat">
         <%@include file= "components/navbar.jsp" %>
        <div class ="container">
            <%@include file ="components/message.jsp" %>
            <div class ="row">
                <div class ="col-md-6 offset-3">
                    <div class ="card mt-3">
                        
                        <div class ="card-header bg-primary text-white text-center">
                           
                            <h4>Login Here</h4>
                            </div>
                        <div class="card-body">
                            <form action ="LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name ="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                <div class ="container text-center">
  <button type="submit" class="btn btn-primary  bg-primary border-0" >Submit</button>
  <button type="reset" class="btn btn-primary  bg-dark border-0">Reset</button>
                                </div>
</form>
                        </div>
                      
                    </div>
                    
                </div>
                
            </div>
            
            
        </div>
       
       
    </body>
</html>
