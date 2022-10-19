package kr.co.demo;

public class Exam08 {

	public static void main(String[] args) {
		/*
		 * 다음과 같은 모양의 출력을 만들어 보세요.
		 * 1	
		 * 2	3
		 * 4	5	6	
		 * 7	8	9	10
		 * 11	12	13	14	15
		 */
		
		int colcount = 1, rowCount = 1;
		for(int i = 1; i <= 15; i++, rowCount++) {
			System.out.printf("%d\t", i);
			if(colcount == rowCount) {
				System.out.print("\n");
				colcount = 0;
				rowCount++;
			}
		}
		System.out.println("------------------------------");
		int n = 0;
		for(rowCount = 1; rowCount <= 5; rowCount++) {
			for(colcount = 1; colcount <= rowCount; colcount++) {
				n++;
				System.out.printf("%d\t", n);
			}
			System.out.print("\n");
		}
		
		
	}

}
