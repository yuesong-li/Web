package comms;

import java.io.*;
import java.net.*;

public class Client {
	Socket echoSocket = null;
	PrintWriter out = null;
	BufferedReader in = null;
	boolean adultUser = false; 
	String devicesAndStates = "";//Used to accept initial states on start up for use on first load of controlPanel.jsp

	public boolean isAdultUser() {
		return adultUser;
	}

	public void setAdultUser(boolean adultUser) {
		this.adultUser = adultUser;
	}
	
	public void readInitialStatesFromServerStartUpString() {
		devicesAndStates = listen();
	}
	
	public void emptyTheInitialStates(){
		devicesAndStates = ""; 
	}
    //Returns initial states 
	public String getInitialStatesFromServerStartUpString() {
		return devicesAndStates;
	}

	public Client() {
	}

	 public void changeState(String deviceAndState) {
		 System.out.println("client change state");
	 out.println(deviceAndState);
	 }
	//
	// public void turnOff() {
	// out.println("light:off");
	// }

	

	public void connectFromServlet() {
		try {
			//echoSocket = new Socket("194.47.41.235", 8888);//Laptop
			echoSocket = new Socket("127.0.0.1", 8888);
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
		System.out.println("sendCommand Client");
		out.println(command);
	}

	/*
	 * Send the username and password to the server and returns the result from the server which will be
	 * login:high if the user is high privilege 
	 * login:low if the user is low privilege (e.g. a child)
	 */
	public String login(String username, String password) {
		System.out.println("Login - client");
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
		System.out.println("getDeviceState client");
		
		String stateFromServer = "";
		out.println("getStatus");// send e.g.light:on/off
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
			System.out.println("client listen - Msg from server: "+msgFromServer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msgFromServer;
	}
}
