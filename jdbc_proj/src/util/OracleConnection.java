package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnection {
    // jdbc:oracle:thin: 는 jdbc 통신 프로토콜. 
    // 참고로 mysql 은 jdbx:mysql://localhost:3306/데이터베이스이름
    private static final String URL = "jdbc:oracle:thin:@//localhost:1521/xe";
    private static final String USERNAME = "c##idev";
    private static final String PASSWORD = "1234";

    public static Connection getConnerction() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }catch (SQLException e) {
            System.out.println("오라클 db 연결 실패: " + e.getMessage());
        }

        return connection;
    }

    // SQL 실행이 끝나면 Connection 객체를 해제(close)
    public static void close(Connection connection) {
        try {
            if (connection != null)
                connection.close();
        } catch (SQLException e) {
            System.out.println("오라클 db close 실패: " + e.getMessage());
        }
    }

    // Connection 생성 테스트
    public static void main(String[] args) {
        Connection conn = getConnerction();
        System.out.println("Connection 객체 생성 상태: " + conn);   // nullㅣ아닌 참조값
        System.out.println("Connection 구현 클래스 " + conn.getClass().getClass()); 

        // Connection 객체 생성 상태 : oracle.jdbc.driver.T4CConnection@262b2c86
        // Connection 구현 클래스 : oracle.jdbc.driver.T4CConnection
    }

}
