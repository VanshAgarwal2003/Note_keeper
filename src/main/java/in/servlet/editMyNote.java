package in.servlet;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import in.entity.Note;
import in.helper.FactoryProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editNote")
public class editMyNote extends HttpServlet
{
  protected void doPost(HttpServletRequest req,HttpServletResponse resp)
  {
	  String title=req.getParameter("title");
	  String content=req.getParameter("content");
	  int id=Integer.parseInt(req.getParameter("idVal"));
	  
	  Session s=FactoryProvider.getFactory().openSession();
	  
	  Transaction tx=s.beginTransaction();
	  Note n=s.get(Note.class, id);
	  
	  n.setTitle(title);
	  n.setContent(content);
	  n.setAddDate(new Date());
	  
	  tx.commit();
	  s.close();
	  req.setAttribute("update", "true");
		try 
	   	{
			resp.sendRedirect("UpdateMyNote.jsp");
			
		}
        catch (IOException e) 
	   	{
			e.printStackTrace();
		}
  }
}
