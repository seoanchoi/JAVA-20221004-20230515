package java_demo05;

import java.util.Scanner;

public class Exam04 {

	public static void main(String[] args) {
		/*
		 * Exam03.java 와 동일한 과정으로 배열을 생성할 때 
		 * 중복된 값이 없도록 초기화 하세요.
		 */

		
		
		Scanner sc = new Scanner(System.in);
		int size = 0;
		
		while(!(size >= 2 && size <= 5)) {
			System.out.print("2 ~ 5 사이의 정수 입력 : ");
			size = sc.nextInt();
		}
		 
		int arr1[] = new int[size];
		
		for(int i = 0; i < size;) {
			System.out.print("1 ~ 10 사이의 정수 입력 : ");
			int num = sc.nextInt();
			if(num >= 1 && num <= 10) {
				boolean isDuplicate = false;
				for(int j = 0; j < size; j++) {
					if(arr1[j] == num) {
					isDuplicate = true;
					break;
					}
			}
			if(!isDuplicate) {
				arr1[i] = num;
				i++;
				}
			}
		
		}
		for(int i = 0; i < size; i++) {
			System.out.printf("%d\t", arr1[i]);			
			}
			
		}
		

	}



		//boolean 사용x ver
		/*
		 * Scanner sc = new Scanner(System.in);
		 * int size = 0;
		
		 * while(!(size >= 2 && size <= 5)) {
		 *	System.out.print("2 ~ 5 사이의 정수 입력 : ");
		 *	size = sc.nextInt();
		 *		}
		 * 
		 * 
		 * 
		 * 
		 * int arr1[] = new int[size];
		 * 
		 * for(int i = 0; i < size;) {
		 * 	System.out.print("1 ~ 10 사이의 정수 입력 : ");
		 * 	int num = sc.nextInt();
		 * 	if(num >= 1 && num <= 10) {
		 * 		if(i == 0) {
		 * 		arr1[i] = num;
		 * }
		 * 
		 * 
		 * 
		 * 	for(int j = 0; j < size; j++) {
		 * 		if(arr1[i] = num;) {
		 *  		arr1[i] = num;
		 *  		} else {
		 * 			 arr1[i] = 0;
		 *	 		 break;
		 *		}
		 *	}
		 * if(arr1[i] ! = 0) {
		 * 		i++;
		 *
		 * 			}
		 * 		}
		 *	 }
		 * 
		 */


