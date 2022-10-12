package java_demo05;

public class Exam01 {

	public static void main(String[] args) {
		/*
		 * 배열 크기가 3 인 정수 배열을 만들고 3 부터 시작하는
		 * 3의 배수 값으로 초기화 후 출력하세요.
		 */
		
		int arr1[] = new int[3];
		for(int i = 0; i < arr1.length; i++) {
			arr1[i] = 1;
			System.out.println(arr1[i] * 3);	
		}
		
	
		
		
		/*
		 * 배열 크기가 5 인 정수 배열을 만들고 5 부터 -1 씩 감소된
		 * 값으로 초기화 후 출력하세요.
		 */
		
		int arr2[] = new int[5];
		for(int i = 5; i < arr2.length; --i) {
			arr2[i] = 5 ;
		}
		
		System.out.println(arr2[5] - 1);
		
		
		/* 
		 * Exa02.java 파일을 생성 후 다음의 문제를 풀어보세요.
		 * 사용자 입력으로 5 ~ 10 사이의 정수 값을 입력 받아
		 * 입력 받은 정수값과 동일한 크기의 배열을 생성하세요.
		 * 그리고 배열의 값은 -1 로 초기화 하세요.
		 */
		
		
		
		
		/*
		 *  Exam03.java 파일을 생성 후 다음의 문제를 풀어보세요.
		 *  사용자 입력으로 2 ~ 5 사이의 정수 값을 입력 받아
		 *  입력 받은 정수값과 동일한 크기의 배열을 생성 하고, 
		 *  배열의 값을 초기화 하기 위해 다시 사용자 입력을 사용하여
		 *  1 ~ 10 사이의 값만을 입력 받아 초기화 하세요.
		 */
	}

}
