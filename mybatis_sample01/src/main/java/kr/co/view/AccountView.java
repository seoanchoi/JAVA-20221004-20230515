package kr.co.view;

import java.util.List;

import kr.co.vo.AccountVO;

public class AccountView {

	public void show(List<AccountVO> data) {
		for(AccountVO a: data) {
			System.out.println(a);
		}
	}
 
	public void show(boolean result) {
		if(result) {
			System.out.println("데이터가 데이터베이스에 저장되었습니다.");
		} else {
			System.out.println("데이터베이스에 데이터를 저장 중 문제가 발생하였습니다.");
		}
	}

	public void message(String msg) {
		System.out.println(msg);
	}
}
