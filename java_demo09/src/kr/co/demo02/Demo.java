package kr.co.demo02;

public class Demo {
	
	/*
	 * throws 를 사용하면 예외가 발생했을 때 해당 예외를 자신을 호출한
	 * 메서드로 위임하게 된다.
	 */
	public static void methodA() throws NullPointerException { // methodA() 를 호출한 위치로 예외 던짐.
		methodB();
	}
	
	public static void methodB() throws NullPointerException { // methodB() 를 호출한 위치로 예외 던짐.
		String s = null;
		System.out.println(s.charAt(0)); //NullpointerException 발생 위치
	}

	public static void main(String[] args) {
		/*
		 * 예외가 발생하는 경우 어느 위치에서든 반드시 예외처리가 이루어져야 
		 * 프로그램의 비정상 종료가 발생하지 않는다.
		 */
		try {
		methodA();
		} catch(NullPointerException e) {
			System.out.println("methodA 에서 발생한 예외 처리");
			e.printStackTrace();
		}
		System.out.println("나머지 작업 진행");

	}

}
