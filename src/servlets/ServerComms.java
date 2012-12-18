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
import javax.servlet.http.HttpSession;

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
	boolean adultUser = false; 
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServerComms() {
		super();

	}

//	@Override
//	public void init() throws ServletException {// run only once
//		System.out.println("here yyyy");
//		
//		// Get state on startup
//		
//	}

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
		System.out.println("doPost");
		PrintWriter writer = response.getWriter();
		String buttonValue = request.getParameter("changeDeviceState");
		String pageToLoad = request.getParameter("pageToUpdate");
		
		System.out.println("bv = " + buttonValue);
		HttpSession session = request.getSession(true);
		client = (Client) session.getAttribute("client");
		client.changeState(buttonValue);//Send e.g. lightIn:off
		//client = new Client();
		//client.connectFromServlet();
		//client = (Client) request.getAttribute("client");
		//Check if the user is adult or child by accessing the client object received 
		//adultUser = client.isAdultUser();
		
//		String str[] = devicesAndStates.split(",");// Split to [device:]and[state]
//		String str1[] = str[0].split(":");
//		String lightInState = str1[1];
//		String lightIn = str1[0];
//		String str2[] = str[1].split(":");
//		String lightOutState = str2[1];
//		String lightOut = str2[0];
//		String str3[] = str[2].split(":");
//		String fanState = str3[1];
//		String fan = str3[0];
//		String str4[] = str[3].split(":");
//		String heatingState = str4[1];
//		String heating = str4[0];
		//PrintWriter writer = response.getWriter();
		//String buttonValue = request.getParameter("button");
		//System.out.println("bv = " + buttonValue);
//		if (runOnce == false) {
//			// System.out.println("runOnce");
//			request.setAttribute("deviceStates", devicesAndStates);
//			runOnce = true;// Set to true so this if only runs once
//		}
//		if (buttonValue != null) {// Make sure there is a value to get
//
//			devicesAndStates = client.getDeviceState();
//			System.out.println("device & states: " + devicesAndStates);
			//request.setAttribute("deviceStates", devicesAndStates);
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
		//}
		String devicesAndStates = "reload"+client.listen();
		System.out.println("from serveComms"+devicesAndStates);
		
		request.setAttribute("devicesAndStates", devicesAndStates);
		RequestDispatcher rd = request.getRequestDispatcher(pageToLoad);
		rd.forward(request, response);
	}

}
