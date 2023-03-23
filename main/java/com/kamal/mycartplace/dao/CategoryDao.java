package com.kamal.mycartplace.dao;


import com.kamal.mycartplace.entites.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



public class CategoryDao{
private SessionFactory factory ;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

//save the category to db 
    public int saveCategory(Category cat){
    Session session = this.factory.openSession();
    Transaction tx = session.beginTransaction();
    int catId = (int)session.save(cat);
      tx.commit();
      session.close();
      
    return catId ;
}
    
    
    //getting the dynamic list of categories from the database ; 
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
    Query query = s.createQuery("from Category");
    List<Category> list = query.list();
    return list ;
  
    }
    
    
    //////////////creating a method for getting the Categoy by CategoryId ;
    
    public Category getCategoyById(int cid ){
        
         Category  cat = null;
        try {
            Session session = this.factory.openSession();
             cat = session.get(Category.class ,cid);
            
             session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return cat ;
    }


}