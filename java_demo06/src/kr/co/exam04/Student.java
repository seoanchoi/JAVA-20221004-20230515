package kr.co.exam04;

import java.util.Arrays;

public class Student {
	public Subject subjects[];
	public String name;
	public int year;
	
	public Student(String name) {
		this.subjects = new Subject[0];
		this.name = name;
	}
	
	public Student(String name, int year) {
		this(name);
		this.year = year;
	}
	
	public String getGradeTable() {
		String result = "";
		for(int i = 0; i < this.subjects.length; i++) {
			Subject s = this.subjects[i];
			 result += String.format("%s\t%.2f\n", s.getName(), s.getScore());
		}
		return result;
	}
	
	private boolean isDuplicate(String subjectName) {
		return this.findIndex(subjectName) == -1 ? false : true;
	}
	
	private int findIndex(String subjectName) {
		for(int i = 0; i < this.subjects.length; i++) {
			Subject s = this.subjects[i];
			if(s.isExists(subjectName)) {
				return i;
			}
		}
		return -1;
	}
	
	public Subject getSubject(String subjectName) {
		Subject result = null;
		int idx = this.findIndex(subjectName);
		
		if(idx >= 0) {
			result = this.subjects[idx];
		}
		
		return result;
	}
	
//	public Subject[] getSubjects(String[] subjectNames) {
//		Subject results[] = new Subject[0];
//		for(int i = 0; i < subjectNames.length; i++) {
//			Subject subject = this.getSubject(subjectNames[i]);
//			if(subject != null) {
//				results = Arrays.copyOf(results, results.length + 1);
//				results[results.length - 1] = subject;
//			}
//		}
//		return results;
//	}
	
	public Subject[] getSubjects(String ... subjectNames) {
		Subject results[] = new Subject[0];
		for(int i = 0; i < subjectNames.length; i++) {
			Subject subject = this.getSubject(subjectNames[i]);
			if(subject != null) {
				results = Arrays.copyOf(results, results.length + 1);
				results[results.length - 1] = subject;
			}
		}
		return results;
	}
	
	public double getScore(String subjectName) {
		Subject result = this.getSubject(subjectName);
		return result != null ? result.getScore() : -1;
	}
	
	// 메서드 오버로딩(Overloading) : 동일한 이름의 메서드를 여러개 작성하는 것.
	//     매개변수 타입 / 매개변수 수량이 이미 작성된 메서드와 달라야 한다.
	//     오버로딩된 메서드를 사용하는 사용자 입장에서는 해당 메서드를 사용할 때
	//     타입에 대한 부분을 신경쓰지 않아도 되며, 다양한 타입을 사용해서 동일한
	//     결과를 얻을 수도 있다.
	public void addSubject(Subject subject) {
		this.addSubject(subject.getName(), subject.getScore());
	}
	
	public void addSubject(String subjectName) {
		this.addSubject(subjectName, 0);
	}
	
	public void addSubject(String subjectName, byte score) {
		this.addSubject(subjectName, score);
	}
	
	public void addSubject(String subjectName, short score) {
		this.addSubject(subjectName, score);
	}
	
	public void addSubject(String subjectName, int score) {
		this.addSubject(subjectName, (double)score);
	}
	
	public void addSubject(String subjectName, double score) {
		if(!this.isDuplicate(subjectName)) {
			int len = this.subjects.length;
			this.subjects = Arrays.copyOf(this.subjects, len + 1);
			this.subjects[len] = new Subject(subjectName, score);
		}
	}
	
	// updateSubject 를 Subject 객체를 매개변수로 사용하여 기존과
	// 동일하게 동작하는 메서드로 오버로딩 하여 구현
	public void updateSubject(String subjectName, double score) {
		int idx = this.findIndex(subjectName);
		if(idx >= 0) {
			Subject s = this.subjects[idx];
			s.setScore(score);
		}
	}
	
	// removeSubject 를 Subject 객체를 매개변수로 사용하여 기존과
	// 동일하게 동작하는 메서드로 오버로딩 하여 구현
	// 여러개의 성적 정보를 삭제할 수 있게도 하세요.
	public void removeSubject(String subjectName) {
		int idx = this.findIndex(subjectName);
		if(idx >= 0) {
			for(int i = idx; i < this.subjects.length - 1; i++) {
				this.subjects[i] = this.subjects[i + 1];
			}
			this.subjects = Arrays.copyOf(this.subjects, this.subjects.length - 1);
		}
	}
}
