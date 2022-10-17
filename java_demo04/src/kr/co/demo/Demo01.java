package kr.co.demo;

public class Demo01 {

	public static void main(String[] args) {
		/*
		 *  if 조건문
		 *  	프로그램 수행 흐름을 바꾸기 위한 역할을 수행하는 제어문중 하나.
		 *  	조건에 따라 다른 코드가 실행되도록 한다.
		 *  	
		 *  if(조건식) {
		 *  	실행 코드
		 *  }
		 *  
		 *  if(조건식) {
		 *  	실행 코드 A
		 *  } else {           //else문은 생략 가능
		 *  	실행 코드 B
		 *  }
		 *  
		 *  if(조건식A) {
		 *  	실행 코드 1
		 *  } else if(조건식C) {
		 *  	실행 코드 3
		 *  }                 //else문 생략한 것
		 *  
		 *  if(조건식A) {		  //if문 중첩
		 *  	if(조건식B) {
		 *  	실행 코드 1	  //else 구문 생략한 것
		 *  }
		 */
		
		
		
		/* int x = 1;
		
		if(x == 1) {			// 조건식의 결과가 true이기 때문에 아래 문장이 실행됨, false이면 실행 안됨
			System.out.println("변수 x 에는 정수 1 이 저장되어 있습니다.");
		}
	
		System.out.println("프로그램이 종료 됩니다.");
		*/
		
		
		
		/* int x2 = 12;
		
		if(x2 % 2 == 0) {
			System.out.println("변수 x 에는 짝수값이 저장되어 있습니다."); // 참
		} else {
			System.out.println("변수 x 에는 홀수값이 저장되어 있습니다."); // 거짓
		}

		System.out.println("프로그램이 종료 됩니다.");
		*/
		
		
		
		/* int x3 = 15;
		
		if(x3 < 10) {		//false
			System.out.println("변수 x3 에 저장된 값은 10보다 작습니다.");
		} else if(x3 < 20) {		// true
			System.out.println("변수 x3 에 저장된 값은 10이상이지만 20보다는 작습니다.");
		} else if(x3 < 30 ) {		//윗줄이 true이기 때문에 실행 안 함
			System.out.println("변수 x3 에 저장된 값은 20 이상이지만 30보다는 작습니다.");
		}
		
		System.out.println("프로그램이 종료 됩니다.");
		 */
		
		
		/* int x4 = 5;
		
		if(x4 < 10) {		//true
			System.out.println("변수 x4 에 저장된 값은 10보다 작습니다.");
		}
		if(x4 < 20) {		//false
			System.out.println("변수 x4 에 저장된 값은 10이상이지만 20보다는 작습니다.");
		}
		if(x4 < 30 ) {		//false
			System.out.println("변수 x4 에 저장된 값은 20 이상이지만 30보다는 작습니다.");
		}
		
		System.out.println("프로그램이 종료 됩니다."); //모두 if문이기 때문에 false여도 모두 출력됨
		*/
		
		
		
		int x5 = 5;
		
		if(x5 > 10) {  
			if(5 % 2 == 0) {   
				System.out.println("변수 x5 에 저장된 값을 10 보다 크고 짝수 입니다.");
			} else { 
				System.out.println("변수 x5 에 저장된 값을 10 보다 크고 짝수 입니다.");
			}
		} else { 
			if(x5 % 2 == 0) {
				System.out.println("변수 x5 에 저장된 값은 10 미만이고 짝수 입니다.");
			}
		}
		
		System.out.println("프로그램이 종료 됩니다.");
		
		
		
		
	}

}
