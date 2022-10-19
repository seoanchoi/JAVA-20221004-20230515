package kr.co.exam;

import java.util.Arrays;

import java.util.Random;

public class Exam06 {

	public static void main(String[] args) {
		/*
		 * 1. 크기가 0 인 정수 배열을 생성 후 Random 을 사용하여
		 * 배열의 값들을 초기화 한다.
		 * Random 은 0 ~ 100 사이의 난수값이 생성되도록 한다.
		 * 배열에는 홀수에 해당하는 값만 5개 저장되도록 한다.
		 */		 
		Random rand = new Random();
		int odd[] = new int[0];
		
		for(int i = 0; i <5; i++) {
			int num = rand.nextInt(101); 
			if(num % 2 == 1) {
				//배열 추가
				int tmp[] = new int[odd.length + 1];

				// for(int j = 0; j < odd.length; j++) {		//배열을 이용한 깊은 복사 
				//	tmp[j] = odd[j];
				// }
				
				//System.arraycopy(odd, 0, tmp, 0, odd.length); //Sysetm.arraycopy를 이용한 깊은 복사
				
																//마지막은 길이, 0번부터 몇 개 복사 할지
				
				odd = Arrays.copyOf(odd,  odd.length + 1);		//odd에 바로 저장				
				odd[tmp.length - 1] = num;
				
				// odd = tmp;
								
				i++;
				
				System.out.printf("%d 값 추가 함\n", num);
				for(int j = 0; j < odd.length; j++) {
				System.out.printf("%d\t", odd[j]);
			}
				System.out.printf("\n");
		}	
			
//		for(int i = 0; i < odd.length; i++) {
//			System.out.printf("%d\t", odd[i]);
//		}
//		System.out.println();

		}
	
		
	}
	
}


