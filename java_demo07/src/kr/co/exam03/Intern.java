package kr.co.exam03;

public class Intern extends Employee {
	
	public Intern() {
		role = "인턴";
	}
	
	public Intern(String name, int age) {
		this();
		setName(name);
		setAge(age);
	}
	
	public void filing() {
		String message = String.format("%s %s이(가) 서류를 정리합니다.", role, getName());
		System.out.println(message);
	}
	
	public void fileCopy() {
		String message = String.format("%s %s이(가) 자료를 복사합니다.", role, getName());
		System.out.println(message);
	}
}
