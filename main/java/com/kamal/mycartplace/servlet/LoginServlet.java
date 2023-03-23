

package com.kamal.mycartplace.servlet;

import com.kamal.mycartplace.dao.UserDao;
import com.kamal.mycartplace.entites.User;
import com.kamal.mycartplace.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            //validation 
            
            //userAuthentication ;
            //veryemportent;
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
             User user =   userDao.getUserByEmailAndPassword(email, password);
            // System.out.println(user);
            // message to the user ;
            HttpSession session = request.getSession();
           
            
           if(user==null){
        session.setAttribute("message","Invalid Details please check details");
             response.sendRedirect("login.jsp");
             return ;
           
           }else{
           out.println("<h1>Welcome "+user.getUserName() +"</h1>");
           
           session.setAttribute("current-user",user);
           if(user.getUserType().equals("admin")){
               //admin page ;
            response.sendRedirect("admin.jsp");
           
           }
           else if(user.getUserType().equalsIgnoreCase("normal")){
               //normal user page ;
             response.sendRedirect("normal.jsp");
           
           }
           else {
            out.println("We have not identified user type ");
           
           
           }

           
           //normal.jsp ;
           
           
           
           
           
           
           
           
           
           }
             
             
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
