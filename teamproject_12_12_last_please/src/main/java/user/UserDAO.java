package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; //DB접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs; //정보를 담을 수 있는 객체
	
	public UserDAO() { //userDAO를 객체로 만듦
		try {  //try-catch 문을 사용하여 예외처리 가능하게 함
			String dbURL = "jdbc:mysql://localhost:3306/USERINFO";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver"); //Mysql에 접속 가능하게 하는 하나의 라이브러리와 비슷
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); //오류 발생시 오류가 무엇인지 나타냄
		}// mysql접속을 돕는 부분
	
	
	}

	public int login(String userID, String userPassword) { //로그인을 시도하는 함수 제작
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //유저 테이블에서 사용자의 비밀번호 가져오도록함
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserPnum());
			pstmt.setString(5, user.getUserName());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
		
	}
	
	public String findpw(String userID, String userPnum) {
		String userPassword = null;
		
		try {
			String SQL = "SELECT userPassword FROM USER WHERE userID = ? AND userPnum = ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userPassword = rs.getString("userPassword");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userPassword;
	}
	
}
