package kr.com.demo;
import java.util.Scanner;
public class Exam09 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력으로 월, 시작 요일, 마지막 일자 정보를
		 * 입력 받아 다음 에시와 같이 출력하세요.
		 * 	예시		 * 	월
		 * 	시작요일
		 * 	마지막 날자
		 * 	10 월
		 * 	일	월	화	수	목	금	토
		 * 							1
		 *	2	3	4	5	6	7	8	
		 *	9	10	11	12	13	14	15
		 *  16	17	18	19	20	21	22	
		 *  23	24	25	26	27	28	29
		 *  30	31
		 *					
		 */
		
		
		Scanner sc = new Scanner(System.in);
				
		int month, day = 0, lastDay;
		String starDate;
		
		System.out.print("월 : ");
		month = sc.nextInt();	sc.nextLine();
		
		System.out.print("시작요일 : ");
		starDate = sc.nextLine();
	
		System.out.print("마지막일자 : ");
		lastDay = sc.nextInt();
		
		System.out.printf("%d 월\n", month);
		System.out.print("일\t월\t화\t수\t목\t금\t토\n");
		int dateIndex = 0;
		switch(starDate) {
			case "일":
				day = 7;  dateIndex = 0; break;
			case "월":
				day = 6;  dateIndex = 6; break;
			case "화":
				day = 5;  dateIndex = 5; break;
			case "수":
				day = 4;  dateIndex = 4; break;
			case "목":
				day = 3;  dateIndex = 3; break;
			case "금":
				day = 2;  dateIndex = 2; break;
			case "토": 
				day = 1;  dateIndex = 1; break;
		}
		
		for(day = day -7 +1; day <= lastDay; day++) {
			if(day >=1) {
			System.out.printf("%d\t", day);
			if(day % 7 == dateIndex) {
				System.out.print("\n");
		}
			} else {
				System.out.print("\t");
			}
		}
		
	}

}
