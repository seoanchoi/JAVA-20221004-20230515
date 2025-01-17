package kr.co.demo01;

public class Demo01 {

	public static void main(String[] args) {		//지역 변수
		/* 
		 * 객체
		 *	 현실 세계에서는 사물이나 개념처럼 독립되고 구분되는
		 *	 각각의 객체로 이루어져 있으며, 발생하는 모든 사건들은
		 *	 객체간의 상호작용으로 이루어져 있다. 이러한 개념을
		 *	 컴퓨터로 옮겨 유사하게 동작하도록 만든것을 객체지향 언어
		 *	 라고 한다.
		 *
		 * 예시
		 *   국가에서 국민 정보 관리용 프로그램을 만들려고 할 때 프로그램에서
		 *   요구하는 "국민" 이라는 한 사람의 정보를 객체화(추상화) 한다면.
		 *   
		 *   국민 : 이름, 나이, 성별, 전화번호, 주민등록번호, 주소, ... 등
		 *   
		 *   국민객체
		 *      String 이름;
		 *      int 나이;
		 *      char 성별;
		 *      String  전화번호;
		 *      String 주민등록번호;
		 *      String 주소;
		 *      
		 *   public class 국민 {
		 *       String 이름;
		 *       int 나이;
		 *       char 성별;
		 *       String  전화번호;
		 *       String 주민등록번호;
		 *       String 주소;
		 *    }
		 */
		
		// 인스턴스화 : 클래스 객체를인스턴스 객체로 만드는 과정
		Person p1 = new Person();
		Person p2 = new Person();
		
		// 인스턴스 객체의 멤버변수에 데이터 할당
		p1.name = "홍길동";
		p1.age = 29;
		
		p2.name = "김철수";
		p2.age = 32;
		
		// 인스턴스 객체의 멤버변수에 저장된 데이터 확인
		System.out.println(p1.name);
		System.out.println(p1.age);
		
		System.out.println(p2.name);
		System.out.println(p2.age);
		
		
		SmartPhone phone1 = new SmartPhone();
		//phone1.brand = "삼성 갤럭시 노트";
		//phone1.model = "BSE-4567";
		//phone1.number = "010-4567-8975";
		
		/* 생성자
		 *     new 연산자를 통해 객체가 인스턴스로 만들어 질 때
		 *     객체 안에서 만들어지는 멤버 변수를 초기화 하기 위한
		 *     메서드
		 *     생성자를 통해 전달된 값으로 초기화를 한다. 
		 */
		Person p3 = new Person();
		System.out.println(p3.name + "|" + p3.age + "|" +(int)p3.gender);
		
		Person p4 = new Person("홍길동");
		System.out.println(p4.name + "|" + p4.age + "|" +(int)p4.gender);
		
		Person p5 = new Person("박주호", 32);
		System.out.println(p5.name + "|" + p5.age + "|" +(int)p5.gender);
		
		/* 기본 생성자 : 클래스를 만들면 기본적으로 사용되는 생성자.
	     *            별도의 생성자를 구현하지 않으면 기본 생성자는
	     *            작성하지 않아도 사용할 수 있다.
	     */
		
		
		/*
		 * 매개변수가 있는 생성자 
		 *     매개변수가 있는 생성자가 있으면 기본 생성자를 별도로 구현
		 *     하지 않을 시 기본 생성자를 사용할 수 없다.
		 */
		
		/*
		 * 접근 제한자
		 *     public    : 모든 영역에서 접근 가능
		 *     protected : 같은 패키지, 후손 관계 까지만 접근 가능
		 *     (default) : 같은 패키지 까지만 접근 가능
		 *     private   : 해당 클래스 내부에서만 접근 가능
		 *     
		 * 다른 외부 클래스/프로그램에서 내부 프로그램이 사용하는 데이터에 접근하지 못하게 
		 * 제한을 걸어 보안 및 안정성을 높이기 위해 사용한다.    
		 */
		Person p6 = new Person("홍길동");
		//P6.personID = "123456-7891234";
		//System.out.println(p6.personId);
		
		/*
		 * 캡슐화 : 객체를 외부에서 접근하지 못하게 켑슐처럼 감싸서 보호하는 것(객체지향 언어의 3대 특징)
		 * 
		 * 캡슐화를 위해 다음의 원칙을 적용한다.
		 *    - 클래스의 멤버 변수에 대한 접근제한은 private 로 한다.
		 *    - 글래스의 멤버 변수에 대한 연산처리를 목적으로 하는 함수들은 
		 *      클래스 내부에 작성한다.
		 *    - 멤버 메서드는 클래스 밖에서 접근할 수 있다록 public 으로 설정한다.
		 */
		
		
		/*
		 * getter/setter 메서드
		 *     getter 메서드는 멤버 변수의 값을 반환시켜주는 메서드이다.
		 *     setter 메서드는 멤버 변수에 데이터를 설정하기 위해 사용하는 메서드.
		 */
		
		SmartPhone phone2 = new SmartPhone();
		phone2.setBrand("삼성 갤럭시 노트");
		phone2.setModel("BMS-4567");
		phone2.setNumber("010-1234-4567");
		
		System.out.println(phone2.getBrand());
		System.out.println(phone2.getModel());
		System.out.println(phone2.getNumber());
		
		
		
		/*
		 * this
		 * 자기 자신을 의미하는 용도로 사용, 인스턴스 객체의 참조 주소가 저장되어 있다.
		 */
		
		
		
	}

}
