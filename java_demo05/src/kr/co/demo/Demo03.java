package kr.co.demo;

import java.util.Scanner;

public class Demo03 {

	public static void main(String[] args) {
		/*
		 * 동적 배열 
		 * 		반복문을 이용한 깊은 복사
		 */
		Scanner sc = new Scanner(System.in);
		int arr1[] = new int[3];
		arr1[0] = 1; arr1[1] =2; arr1[2] =3;

		int tmp[];
		
		for(int i = 0; i < 5; i++) {
			System.out.print("정수값을 입력하세요 : ");
			int num = sc.nextInt();
		
			// 기존 배열 크기보다 +1 또는 -1 증감한 새로운 배열을 생성
			tmp = new int[arr1.length +1];
			
			for(int j = 0; j < arr1.length; j++) {
				tmp[j] = arr1[j];
			}
			
			// 배열의 크기가 증가 된 경우 마지막 인덱스에 새로운 값 추가.
			tmp[tmp.length -1] = num;
			
			
			// 앞으로 계속 사용할 배열 변수 명은 기존 이름을 사용해야함.
			arr1 = tmp;		 //얕은 복사 : 참조 주소만을 복사
			
			System.out.printf("arr1 배열의 크기가 %d 가 되었습니다.", arr1.length);
		}
		
		for(int i = 0; i < arr1.length; i++) {
			System.out.printf("%d\t", arr1[i]);
		}
	}

}
