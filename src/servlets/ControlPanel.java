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
@WebServlet("/ControlPanel")
public class ControlPanel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Client client;// = new Client();
	String devicesAndStates = "";
	boolean runOnce = false;
	//boolean adultUser = false; 
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControlPanel() {
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
		// System.out.println("doPost");
		System.out.println("control panel init()");
		client = (Client) request.getAttribute("client");
		//Client client = new Client();
		//client.connectFromServlet();
		//Check if the user is adult or child by accessing the client object received 
		//adultUser = client.isAdultUser();
		devicesAndStates = client.getDeviceState();
		System.out.println("device & states: " + devicesAndStates);
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
			request.setAttribute("deviceStates", devicesAndStates);
//			runOnce = true;// Set to true so this if only runs once
//		}
//		if (buttonValue != null) {// Make sure there is a value to get
//
//			client.sendCommand(buttonValue);
//			System.out.println("bv = " + buttonValue+"yeeeeeeeeeeeeeeeyyyy");
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
		RequestDispatcher rd = request.getRequestDispatcher("main_frame.jsp");
		rd.forward(request, response);
	}

}
