package kr.co.exam04;

import java.util.Scanner;

public class Run {
	
	private Scanner sc = new Scanner(System.in);
	
	private String initMenu() {
		String menu = "";
		
		menu += "1. 성적표 출력\n";
		menu += "2. 과목 성적 출력\n";
		menu += "3. 과목 성적 추가\n";
		menu += "4. 과목 성적 수정\n";
		menu += "5. 과목 성적 삭제\n";
		menu += "6. 프로그램 종료\n";
		
		return menu;
	}
	
	private void select(int number) {
		switch(number) {
			case 1:
				this.printAll(); break;
			case 2:
				this.print(); break;
			case 3:
				this.add(); break;
			case 4:
				this.update(); break;
			case 5:
				this.remove(); break;
			case 6:
				System.out.println("프로그램을 종료 합니다.");
				System.exit(0);
		}
	}
	
	private void printAll() {
	}
	
	private void print() {}
	
	private void add() {}
	
	private void update() {}
	
	private void remove() {}

	public void start() {
		while(true) {
			System.out.println(this.initMenu());
			System.out.print("메뉴 번호 입력 : ");
			int number = sc.nextInt();	sc.nextLine();
			this.select(number);
			
			System.out.print("초기 메뉴로 돌아가려면 Enter 입력!");
			sc.nextLine();
		}
	}

}
