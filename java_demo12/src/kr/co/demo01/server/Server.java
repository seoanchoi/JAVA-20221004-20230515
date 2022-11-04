package kr.co.demo01.server;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class Server {

	public static void main(String[] args) {
		/*
		 * 네트워크 프로그램
		 *    - 네트워크로 연결된 컴퓨터 장치 간에 데이터를 송/수신 할 수 있도록
		 *     만드는 프로그램
		 *    - 서버/클라이언트 나누어서 프로그램을 작성하게 된다.
		 *    - 네트워크 연결이 필요한 정보로 IP 주소와 Port 번호가 있으며, 이 정보를 통해 
		 *      연결할 서버와 클라이언트를 식별하게 된다.
		 *    - 네트워크 연결에는 UDP/TCP 두 가지 방식의 연결 방법이 있으며 
		 *      UDP 의 경우 데이터 통신의 신뢰성이 낮은 반면 통신속도가 빠르다는 특징이 있고		//근거리에  사용
		 *      TCP 의 경우 데이터 통신의 신뢰성이 높으며 대신 통신속도가 느리다는 특징이 있다.		//장거리에 주로 사용
		 *    
		 * 서버: 클라이언트의 네트워크 연결을 수락하고 정보를 제공하는 역할   
		 * 클라이언트: 서버에 연결을 요청하고 필요한 정보를 요청하는 역할
		 * 
		 * 서버측 프로그래밍 순서(UDP)
		 *    1. 서버가 사용할 Port 선택
		 *    2. DatagramSocket 객체 선택
		 *    3. 연결할 클라이언트의 InetAddress 객체 생성
		 *    4. 전송할 데이터를 byte[]로 변환
		 *    5. 전송할 데이터를 DatagramPacket 에 전달
		 *    6. Socket을 사용하여 메시지 전송
		 * 
		 * 클라이언트측 프로그래밍 순서(UDP)
		 *    1. 서버가 보낸 메시지를 받을 byte[] 준비
		 *    2. DatagramSocket 객체 생성
		 *    3. 메시지 받을 DatagramPacket 객체 생성
		 *    4. byte[]로 받은 메시지를 String 으로 변환
		 */
		
		int port = 5000;
		
		try {
			DatagramSocket dSocket = new DatagramSocket(port);
			System.out.println("클라이언트가 접속 할 수 있도록 연결 소켓을 생성 합니다.");
			while(true) {
				byte[] data = new byte[1024];
				DatagramPacket dPacket = new DatagramPacket(data, data.length);
				System.out.println("클라이언트의 연결을 대기 합니다.");
				dSocket.receive(dPacket);	
				String clientIp = dPacket.getSocketAddress().toString();
				System.out.println("클라이언트와 연결이 되었습니다.");
				System.out.println("연결된 클라이언트의 주소는 " + clientIp + " 입니다.");
				
				String recv = new String(dPacket.getData(), 0, dPacket.getData().length);
				System.out.println("클라이언트(" + clientIp + ")가 보낸 메시지 : " + recv);
				
				// 서버거 클라이언트에게 메시지를 보냄.
				DatagramPacket sendPacket = new DatagramPacket(recv.getBytes(), recv.getBytes().length, dPacket.getAddress(), dPacket.getPort());	
				dSocket.send(sendPacket);	
			}
			
			
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();	
		}
		

	}

}
