package kr.co.exam04;

import java.util.Arrays;

public class Exam {

	public static void main(String[] args) {
		/*
		 * 학생들의 성적을 관리하기 위한 용도의 클래스 생성
		 *     학생 클래스
		 *         멤버변수 : 성적배열, 이름, 학년
		 *         멤버메서드 : 성적표출력, 과목점수출력, 과목점수수정, 성적추가/삭제
		 *     
		 *     성적 클래스
		 *         멤버변수 : 과목명, 점수, 등급
		 *         멤버메서드 : 점수로 등급을 산출하는 메서드
		 */
		Student s = new Student("홍길동");

		String table = s.getGradeTable();
		System.out.print(table);
		
		double score = s.getScore("과학");
		System.out.println(score);
		
		s.addSubject("과학", 76.5);
		s.addSubject("국어", 76.5);
		s.addSubject("수학", 76.5);
		s.addSubject(new Subject("영어", 67));
		table = s.getGradeTable();
		System.out.print(table);
		
		s.updateSubject("과학", 95);
		table = s.getGradeTable();
		System.out.print(table);
		
		System.out.println("----------");
		
		s.removeSubject("수학");
		table = s.getGradeTable();
		System.out.print(table);
		
		Subject s1 = s.getSubject("영어");
		System.out.print(s1.getName() + "\t");
		System.out.print(s1.getScore() + "\t");
		System.out.print(s1.getGrade() + "\n");
		
		Subject sArr[] = s.getSubjects("영어", "국어", "수학", "과학");
		System.out.println(Arrays.toString(sArr));

		
		/*
		 * Run 클레스를 만들고 지금까지 만들어 둔 Student 클래스를 사용하여 
		 * 다음의 프로그램을 만들어 보세요
		 * 
		 * 학생의 성적을 관리하기 위한 프로그램
		 * 
		 * <<< 홍길동 학생 성적 관리 메뉴 >>>
		 * 1. 성적표 출력
		 * 2. 과목 성적 출력
		 * 3. 과목 성적 수정
		 * 5. 과목 성적 삭제
		 * 6. 프로그램 종료
		 * 
		 * 메뉴 번호 입력 : 1
		 * 
		 * 		국어		영어		수학		평균	
		 * 점수	70.0	80.0	70.0	73.3		
		 * 등급	C		B		C		C
		 * 
		 * 초기 메뉴로 들아가려면  Enter 입력!
		 * !
		 */
		
		/* 메뉴 번호 입력 : 3
		 * 
		 * 추가할 과목명 : 과학
		 * 성적 입력(0 ~ 100) : 95
		 * 
		 * 과목 추가 완료되었습니다.
		 * 
		 * 추가할 과목명 : 수학
		 * 성적 입력(0 ~ 100) : 67
		 * 
		 * 이미 존재하는 과목 정보 입니다.
		 * 
		 * 추가할 과목명 : exit
		 * 
		 * 추가 작업을 마칩니다.
		 * 초기 메뉴로 돌아가려면 Enter 입력!
		 */
		
		/*
		 * 메뉴 번호 입력 :5 
		 * 
		 * 삭제할 과목명 : 과학
		 * 
		 * 과목 삭제 완료되었습니다.
		 * 
		 * 삭제할 과목명 : 사회
		 * 
		 * 삭제할 과목이 존재하지 않습니다.
		 * 
		 * 삭제할 과목명 : exit
		 * 
		 * 삭제 작업을 마칩니다.
		 * 초기 메뉴로 돌아가려면 Enter 입력! 
		 */

		
		
		
	}

}
