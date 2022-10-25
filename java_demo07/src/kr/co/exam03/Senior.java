package kr.co.exam03;

public class Senior extends Staff {

	public Senior() {
		role = "대리";
	}
	
	public Senior(String name, int age) {
		this();
		setName(name);
		setAge(age);
	}
	
	public void research() {
		String message = String.format("%s %s 이(가) 자료 조사를 합니다.", role, getName());
		System.out.println(message);
	}
	
	public void document() {
		String message = String.format("%s %s 이(가) 문서 작성을 합니다.", role, getName());
		System.out.println(message);
	}
	
	public void call() {
		String message = String.format("%s %s 이(가) 업체와 통화를 합니다.", role, getName());
		System.out.println(message);
	}
}
