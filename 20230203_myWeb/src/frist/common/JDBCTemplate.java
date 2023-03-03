package frist.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

// 현재 프로젝트와 오라클DB 계정 KH와 연결하고 그 결과 Connection을 만들어내기
public class JDBCTemplate {
	private static JDBCTemplate instance;
	
	private JDBCTemplate() {}

	public static JDBCTemplate getInstance() {
		if(instance == null) {
			instance = new JDBCTemplate();
		}
		
		return instance;
	}
	
	public static Connection getConnection() {
		Connection conn = null;	 /* try문에서는 선언을 하지 않아서 밖으로 빼고 null 초기값 줌 */
		Properties prop = new Properties();			
		try {
			//C:\workspace\java\20230203_myWeb\src\frist\common\driver.properties
			//prop.load(new BufferedReader(new FileReader(new File("C:\\workspace\\java\\20230203_myWeb\\src\\frist\\common\\driver.properties"))));
			String currpath = JDBCTemplate.class.getResource("./").getPath();
			String filePath = currpath + "driver.properties";
			prop.load(new BufferedReader(new FileReader(new File(filePath))));
			
			System.out.println("1: "+ prop.getProperty("1h.driver"));
			System.out.println("2: "+ prop.getProperty("1h.url"));
			
			/*
			 * URL url = JDBCTemplate.class.getResource("./"); String currentPath =
			 * url.getPath(); System.out.println(url); System.out.println(currentPath);
			 * 
			 * URL url2 = JDBCTemplate.class.getResource("../"); String currentPath2 =
			 * url.getPath(); System.out.println(url2); System.out.println(currentPath2);
			 */
			
//			Class.forName("oracle.jdbc.driver.OracleDriver"); --> 둘 중 하나 써도 됨
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KH", "KH");  /*연결하는 통로를 다오, 무엇과 연결하는?*/
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();		
		} catch (ClassNotFoundException e) {
			System.out.println("!!!!!!!!ojdbc jar 없어요!!!!!!!!!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("!!!!!!!!!연결실패!!!!!!!!");
			e.printStackTrace();
		} finally {
			if(conn == null) {
				System.out.println("!!!!!!!!?연결실패했다고?!!!!!!!!!!");
			} else {
				System.out.println("연결성공");
			}
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if(rs!=null && !rs.isClosed()) {
				rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}

