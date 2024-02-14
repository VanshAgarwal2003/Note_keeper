package in.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import in.entity.Note;
import in.factory.Factory;
import in.helper.FactoryProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/submitNote")
public class AddmyNote extends HttpServlet
{
	
   protected void doPost(HttpServletRequest req,HttpServletResponse resp)
   {
	   String title=req.getParameter("title");
	   String content=req.getParameter("content");
	   
	   Note n1=new Note(title,content,new Date());
	   
	   Session s=FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		
		s.save(n1);
		tx.commit();
		s.close();
		
		req.setAttribute("update", "true");
		RequestDispatcher rd=req.getRequestDispatcher("/addNote.jsp");
 		try 
 		{
			rd.forward(req, resp);
		} 
 		catch (ServletException e) 
 		{
			e.printStackTrace();
		} 
 		catch (IOException e) 
 		{
			e.printStackTrace();
		}
   }
}
