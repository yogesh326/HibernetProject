package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.FormDetails;
import hiber.CrudDAO;

@WebServlet("/Create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;
	
    public Create() {}
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	try(PrintWriter out = response.getWriter()){
    		
    		String name = request.getParameter("uname");
        	String pw = request.getParameter("pword");
        	String mail = request.getParameter("email");
        	
        	String ag1 = request.getParameter("age");
        	String num1 = request.getParameter("cnum");
        	int ag = Integer.parseInt(ag1);
        	long num = Long.parseLong(num1);
        	
        	String gen = request.getParameter("gender");
        	
        	HttpSession session = request.getSession();
        	
        	try {
        		
        		CrudDAO crud = new CrudDAO();		
        		crud.create(name, pw, mail, num, ag, gen);
        		out.println("<html>");
        		out.println("<body>");
        		out.println("<h1>Data Added Successfully</h1>");
        		out.println("<a href=\"index.jsp\">Go back to Homepage</a>");
        		out.println("</body>");
        		out.println("</html>");

        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	
    	}
    	
    	CrudDAO crud = new CrudDAO();
    	
    	List<FormDetails> list = crud.retrieve();
    	System.out.println(list);
    	request.setAttribute("list", list);
    	RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
    	disp.forward(request, response);
    	
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

}
