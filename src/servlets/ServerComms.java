//Author Mark Powell Software Engineering 2 2012
package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import comms.Client;

/**
 * Servlet implementation class ServerComms
 */
@WebServlet("/ServerComms")
public class ServerComms extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Client client = new Client();
	String newState = "";
	boolean runOnce = false;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServerComms() {
		super();

	}

	@Override
	public void init() throws ServletException {// run only once
		System.out.println("init()");
		client.connectFromServlet();// Connect to the server
		newState = client.getDeviceState("light:on/off");// Get state on startup
		String str[] = newState.split(":");// Split to [device:]and[state]
		newState = str[1];
		System.out.println("init()" + newState);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("doPost");
		PrintWriter writer = response.getWriter();
		String buttonValue = request.getParameter("lightStateButtonValue");
		System.out.println("bv = " + buttonValue);
		if (runOnce == false) {
			// System.out.println("runOnce");
			request.setAttribute("newLightState", newState);
			runOnce = true;// Set to true so this if only runs once
		}
		if (buttonValue != null) {// Make sure there is a value to get
			if (buttonValue.equals("on")) {
				// System.out.println("turn light on");
				client.turnOn();
				// Just to be sure
				buttonValue = client.getDeviceState("light:on/off");// Get
																	// current
																	// state
				String str[] = buttonValue.split(":");// Split to
														// [device:]and[state]
				buttonValue = str[1];
				// System.out.println("bv = "+buttonValue);
				request.setAttribute("newLightState", buttonValue);
			}
			if (buttonValue.equals("off")) {
				// System.out.println("off");
				client.turnOff();
				buttonValue = client.getDeviceState("light:on/off");// Get
																	// current
																	// state
				String str[] = buttonValue.split(":");// Split to
														// [device:]and[state]
				buttonValue = str[1];
				// System.out.println("bv = "+buttonValue);
				request.setAttribute("newLightState", buttonValue);
			}
		}
		RequestDispatcher rd = request
				.getRequestDispatcher("changeDeviceState.jsp");
		rd.forward(request, response);
	}

}
