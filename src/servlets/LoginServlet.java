package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("here1");
		client.connectFromServlet();
		userLevel = client.login(username, password);
		System.out.println("userLevel =" + userLevel);
		if(userLevel.contains("high")){//The user is validated - goto application for adult users
			client.setAdultUser(true);
			//request.setAttribute("username", username);
			request.setAttribute("client", client);//At present this is not used when sending to frameset
			//Might need to change frameset to .jsp??????????????????? /Mark
			RequestDispatcher rd = request.getRequestDispatcher("main_frame.html");
			rd.forward(request, response);
		}else if(userLevel.contains("low")){
			client.setAdultUser(false);
			request.setAttribute("client", client);
			RequestDispatcher rd = request.getRequestDispatcher("ServerComms");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
		
	}
}