package in.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import in.entity.Note;
import in.helper.FactoryProvider;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMyNote")
public class noteDelete extends HttpServlet 
{
      
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	{
	   	int id=Integer.parseInt(req.getParameter("id"));
	   	Session s=FactoryProvider.getFactory().openSession();
	   	Transaction tx=s.beginTransaction();
	   	Note n=s.get(Note.class, id);
	   	s.delete(n);
	   	tx.commit();
	   	
	   	s.close();
	   	req.setAttribute("deleteStatus","true");
	   	try 
	   	{
			resp.sendRedirect("showNotes.jsp");
			
		}
        catch (IOException e) 
	   	{
			e.printStackTrace();
		}
	}

}
