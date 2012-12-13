package comms;

import java.io.*;
import java.net.*;

public class Client {
	Socket echoSocket = null;
	PrintWriter out = null;
	BufferedReader in = null;
	boolean adultUser = false; 

	public boolean isAdultUser() {
		return adultUser;
	}

	public void setAdultUser(boolean adultUser) {
		this.adultUser = adultUser;
	}

	public Client() {
	}

	// public void turnOn() {
	// out.println("light:on");
	// }
	//
	// public void turnOff() {
	// out.println("light:off");
	// }

	

	public void connectFromServlet() {
		try {
			echoSocket = new Socket("194.47.46.135", 8888);//Laptop
			//echoSocket = new Socket("194.47.46.204", 8888);
			out = new PrintWriter(echoSocket.getOutputStream(), true);
			in = new BufferedReader(new InputStreamReader(
					echoSocket.getInputStream()));
			System.out.println("*******BufferedReader created*******");
		} catch (UnknownHostException e) {
			System.err.println("Don't know about host.");
			System.exit(1);
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("Couldn't get I/O");
			System.exit(1);
		}
	}
	public void sendCommand(String command) {
		out.println(command);
	}

	/*
	 * Send the username and password to the server and returns the result from the server which will be
	 * login:high if the user is high privilege 
	 * login:low if the user is low privilege (e.g. a child)
	 */
	public String login(String username, String password) {
		String msgToServer = username + ":" + password;
		String msgFromServer = "";
		out.println(msgToServer);
		System.out.println(msgToServer);
		try {
			msgFromServer = in.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(msgFromServer);
		if(msgFromServer.contains("login:high") ){//If an adult user
			System.out.println("Login Sucessful-High privilege");
			return "high";
		}else if(msgFromServer.contains("login:low")){
			System.out.println("Login Sucessful-low privilege");
			return "low";
		}else{
			System.out.println("Login not sucessful!!!!");
			return "failed";
		}
		
		
		
	}

	public String getDeviceState() {
		System.out.println("here it is");
		String stateFromServer = "";
		// out.println(data);// send e.g.light:on/off
		try {
			//stateFromServer = in.readLine();
			stateFromServer = in.readLine();
			System.out.println("reply from server: " +stateFromServer);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Failed to get state from server");
		}
		return stateFromServer;

	}

	public String listen() {
		String msgFromServer = "";
		try {
			msgFromServer = in.readLine();
			System.out.println("Msg from server: "+msgFromServer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msgFromServer;
	}
}
