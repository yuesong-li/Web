package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comms.Client;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Client client = new Client();
	ServerComms com;
        // Paria
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String userLevel = "";
		client.connectFromServlet();
		userLevel = client.login(username, password);
		//There is a string of states waiting to be read so we get it
		client.readInitialStatesFromServerStartUpString();//The object now holds this and we send it with the session
		System.out.println("userLevel =" + userLevel);
		if(userLevel.contains("high")){//The user is validated - goto application for adult users
			client.setAdultUser(true);
			//request.setAttribute("username", username);
			HttpSession session = request.getSession(true);
			session.setAttribute("client", client);//Add the client object to the session
			RequestDispatcher rd = request.getRequestDispatcher("main_frame.jsp");
			rd.forward(request, response);
		}else if(userLevel.contains("low")){//Not implemented yet
			client.setAdultUser(false);
			request.setAttribute("client", client);
			RequestDispatcher rd = request.getRequestDispatcher("ServerComms");
			rd.forward(request, response);
		}else{//Try and login again fool!
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
		
	}
}