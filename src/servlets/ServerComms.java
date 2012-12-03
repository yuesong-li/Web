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

	Client client;// = new Client();
	String devicesAndStates = "";
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
		client = new Client();
		devicesAndStates = client.getDeviceState();// Get state on startup
		System.out.println("init()" + devicesAndStates);
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
		String buttonValue = request.getParameter("button");
		System.out.println("bv = " + buttonValue);
		if (runOnce == false) {
			// System.out.println("runOnce");
			request.setAttribute("deviceStates", devicesAndStates);
			runOnce = true;// Set to true so this if only runs once
		}
		if (buttonValue != null) {// Make sure there is a value to get

			client.sendCommand(buttonValue);

			// if (buttonValue.equals("lightIn:on")) {
			// // System.out.println("turn light on");
			// client.turnOn();
			// // Just to be sure
			// // buttonValue = client.getDeviceState("light:on/off");// Get
			// // current
			// // state
			// String str[] = buttonValue.split(":");// Split to
			// // [device:]and[state]
			// buttonValue = str[1];
			// // System.out.println("bv = "+buttonValue);
			// request.setAttribute("newLightState", buttonValue);
			// }
			// if (buttonValue.equals("lightIn:off")) {
			// // System.out.println("off");
			// client.turnOff();
			// // buttonValue = client.getDeviceState("light:on/off");// Get
			// // current
			// // state
			// String str[] = buttonValue.split(":");// Split to
			// // [device:]and[state]
			// buttonValue = str[1];
			// // System.out.println("bv = "+buttonValue);
			// request.setAttribute("newLightState", buttonValue);
			// }
		}
		RequestDispatcher rd = request
				.getRequestDispatcher("interfaces.jsp");
		rd.forward(request, response);
	}

}
