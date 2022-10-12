package kr.com.demo;

public class Exam07 {

	public static void main(String[] args) {
		/*
		 * 다음과 같은 모양의 출력을 만들어 보세요.
		 * 1	2	3	4	5
		 * 6	7	8	9	10
		 * 11	12	13	14	15
		 * 16	17	18	19	20	
		 * 21	22	23	24	25
		 * 
		 * 숫자 사이의 공백은 Space 가 아닌 Tab(\t) 로 만드세요.
		 * 반드시 중첩 반복문이 아니어도 됨)
		 */
		
		for(int i = 1; i <= 25; i++) {
			System.out.printf("%d\t", i);
			if(i % 5 == 0) {
				System.out.print("\n");
			}
		}
		System.out.println("------------------------------");
		int n = 0;
		for(int i = 1; i <= 5; i++) {
			for(int j = 1; j <= 5; j++) {
				n++;  //int n = 5 * (i - 1) + j;
				System.out.printf("%d\t", n);
				
			}
			System.out.print("\n");
		}
		
		
		
		
		/*
		 * 1 ~ 31 까지의 숫자를 달력 형태 처럼 출력하세요.
		 * 1	2	3	4	5	6	7
		 * 8	9	10	11	12	13	14
		 * 15	16	17	18	19	20	21
		 * 22	23	24	25	26	27	28	
		 * 29	30	31
		 * 
		 * 숫자 사이의 공백은 Space 가 아닌 Tab(\t) 로 만드세요.
		 */
		
		for(int i = 1; i <= 31; i++) {
			System.out.printf("%d\t", i);
			if(i % 7 == 0) {
				System.out.print("\n");
			}
		}
		System.out.print("\n");
		System.out.println("------------------------------");
		int m = 0;
		for(int i = 1; i <= 5; i++) {
			for(int j = 1; j <= 7; j++) {
				m++; 
				System.out.printf("%d\t", m);
				if(m >= 31) {
					break;		//(가장 근처에 있는)반복문 중지
				}
			}
			System.out.printf("\n");
			if(m >= 31) {
				break;		//break를 한 번만 쓰면 가장 근처에 있는 반복문만 중단시킴, 따라서 두 번 씀
			}		
			System.out.print("------------------------------");
		}
		
		
		
	}

}
