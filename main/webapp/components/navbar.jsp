

<%@page import="com.kamal.mycartplace.helper.FactoryProvider"%>
<%@page import="com.kamal.mycartplace.dao.UserDao"%>
<%@page import="com.kamal.mycartplace.entites.User"%>
<div>
    <nav class="navbar navbar-expand-lg container-lg navbar-dark bg-primary ">
        <a class="navbar-brand" href="index.jsp">MyCartPlcae</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>

            </ul>

            <ul class = "navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><span>cart </span><span class="cart-items">()</span></a>
                </li>  
               
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li><!-- comment -->
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>

            </ul>
        </div>

    </nav>
</div> 