package kr.co.demo01;

public class Person {
	private String name;
	private int age;
	private char gender;
	
	
	
	public Person(String name) {		//생성자 생성
		this.name = name;
	}
	
	
	public String getName() {
		return this.name;		//this 생략 가능
		
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public char getGender() {
		return gender;
	}
	
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	

}
