package comms;

import java.io.*;
import java.net.*;

public class Client {
	Socket echoSocket = null;
	PrintWriter out = null;
	BufferedReader in = null;

	public Client() {
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Client client = new Client();
		client.establish();

	}

	public void turnOn() {
		out.println("light:on");

	}

	public void turnOff() {
		out.println("light:off");

	}

	public void connectFromServlet() {
		try {
			echoSocket = new Socket("194.47.41.162", 8888);
			out = new PrintWriter(echoSocket.getOutputStream(), true);
			in = new BufferedReader(new InputStreamReader(
					echoSocket.getInputStream()));
		} catch (UnknownHostException e) {
			System.err.println("Don't know about host.");
			System.exit(1);
		} catch (IOException e) {
			System.err.println("Couldn't get I/O");
			System.exit(1);
		}

	}

	public String getDeviceState(String data) {
		String stateFromServer = "";
		//out.println(data);// send e.g.light:on/off
		try {
			stateFromServer = in.readLine();
			// System.out.println("reply from server: " +stateFromServer);
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
			// System.out.println("Msg from server: "+msgFromServer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msgFromServer;

	}

	public void establish() {

		try {
			echoSocket = new Socket(InetAddress.getLocalHost(), 8888);
			out = new PrintWriter(echoSocket.getOutputStream(), true);
			in = new BufferedReader(new InputStreamReader(
					echoSocket.getInputStream()));
		} catch (UnknownHostException e) {
			System.err.println("Don't know about host.");
			System.exit(1);
		} catch (IOException e) {
			System.err.println("Couldn't get I/O");
			System.exit(1);
		}

		BufferedReader stdIn = new BufferedReader(new InputStreamReader(
				System.in));
		String userInput;

		try {
			while ((userInput = stdIn.readLine()) != null) {
				out.println(userInput);
				if (userInput.equals("Bye."))
					break;
				System.out.println("echo: " + in.readLine());
			}

			out.close();
			in.close();
			stdIn.close();
			echoSocket.close();
		} catch (IOException ioe) {
			System.out.println("Failed");
			System.exit(-1);
		}
	}
}
