
package com.kamal.mycartplace.servlet;

import com.kamal.mycartplace.entites.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamal.mycartplace.dao.CategoryDao;
import com.kamal.mycartplace.dao.ProductDao;
import com.kamal.mycartplace.entites.Product;
import com.kamal.mycartplace.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ProductOpretionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String op = request.getParameter("opretion");
            if(op.trim().equals("addcategory")){
            //addcategory wala work yaha ;
             String title =  request.getParameter("catTitle");
             String description =  request.getParameter("catDescription");
                       Category category =  new Category();
                       category.setCategoryTitle(title);
                       category.setCategoryDescription(description);
                // category to save in data base ;
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
            int catId =categoryDao.saveCategory(category);
            out.println("Categry saved...");
                HttpSession session = request.getSession();
                session.setAttribute("message", "category added...."+ catId);
                response.sendRedirect("admin.jsp");
                return ;
                       
            
 //==================================================================================================================================           
            
            }
            else if(op.trim().equals("addproduct")){
                // add product wala kaam yaha hoga ;
                String pName  = request.getParameter("pName");
                String pDesc  = request.getParameter("pDesc");
                int pPrice    = Integer.parseInt(request.getParameter("pPrice"));
                int pdiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId     = Integer.parseInt(request.getParameter("catId"));
                
                // getting product file ..........
                
                Part part = request.getPart("pPic");
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pdiscount);
                p.setpPhoto(part.getSubmittedFileName());
                p.setpQuantity(pQuantity);
                
                
                //findin the Category objeect by session ;
                
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category categoy = cdoa.getCategoyById(catId);
                p.setCategory(categoy);
                
                
                //Product save to database ;
                ProductDao pdao  = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
               
                
                //pic of  product upload ;
                //findout path to upload picture ;
                
                String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
               System.out.println(path);
                
                //uploading code ...
                try
                {
                    
                FileOutputStream fos = new FileOutputStream(path);
                
                InputStream is = part.getInputStream();
                
                
                //reading data ; by array ;
                byte []data = new byte[is.available()];
                is.read(data);
                //writing data ;
                fos.write(data);
                
                fos.close();
                is.close();
                }
                catch(Exception e){
                e.printStackTrace();
                }
                out.println("Produt saved.....");
                
                
                
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
