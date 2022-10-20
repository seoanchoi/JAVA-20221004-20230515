package kr.co.exam03;

public class Clock {
	// 멤버 변수/상수
	private int hour;
	private int minute;
	private int second;
	
	// 생성자
	public Clock(int hour, int minute, int second) {
		this.setHour(hour);
		this.setMinute(minute);
		this.setSecond(second);
	}
	
	// 멤버 메서드
	public String getTimeString() {
		return this.hour + ":" + this.minute + ":" + this.second;
	}
	
	// getter 메서드
	public int getHour() {
		return this.hour;
	}
	
	public int getMinute() {
		return this.minute;
	}
	
	public int getSecond() {
		return this.second;
	}
	
	// setter 메서드
	private void setHour(int hour) {
		this.hour = hour % 24;
	}
	
	private void setMinute(int minute) {
		this.hour = minute % 60;
	}
	
	private void setSecond(int second) {
		this.second = second % 60;
	}
}
