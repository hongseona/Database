package sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.OracleConnection;

/* select sql .
    ㄴ 데이터를 조회. 테이블의 행 집합을 결과로 얻습니다.
    ㄴ 'ResultSet' 타입 객체는 행 집합을 저장합니다. select 쿼리에서 사용되는 리턴 타입.
      - ResultSet 객체는 현재 데이터 행을 가리키는 커서를 유지합니다.
      - 처음에는 커서가 첫 번째 행 앞에 배치됩니다. (첫번째 행이 0이라면 -1 에 위치)
      - next() 메서드는 커서를 다음 행으로 이동시키며, ResultSet 객체에 더 이상 행이 없을 때  false를 반환
      - next() 메서드 결과 집합을 반복하는 데 사용할 수 있습니다.
           ㄴ select 결과로 얻어지는 행의 갯수는 알 수 없습니다. 반복문 while 사용
            단, PK 컬럼 조건식은 행이 0 또는 1개 조회됩니다.

*/
public class ResultSetTest {
    public static void main(String[] args) {
        System.out.println("------------- tbl_javadict 테이블 조회하기 ----------------");
        String english = System.console().readLine("조회 명단 입력 >>> ");  // "public";
        String sql = "SELECT * FROM tbl_javadict WHERE english = ?";
        Connection connection = OracleConnection.getConnerction();
        try (
            PreparedStatement pstat = connection.prepareStatement(sql);     // 자동 close
        ) {
            pstat.setString(1, english);
            ResultSet rs = pstat.executeQuery();        // 🔥 SELECT 실행 메소드 executeQuery 실행 결과는 ResultSet 타입
            boolean result = rs.next();     // 행집합 안에서 커서(행 위치)를 다음으로 이동
            System.out.println("조회 결과 있음 ?" + result);
            if(result){
                System.out.println("#### 조회 결과 컬럼값 출력 ####");
                System.out.println("번호: " + rs.getInt( 1));
                System.out.println("번호: " + rs.getInt( 2));
                System.out.println("번호: " + rs.getInt( 3));
                System.out.println("번호: " + rs.getInt( 4));

            }else {
                System.out.println("조회 결과가 없습니다.");
            }
        } catch (Exception e) {
            System.out.println("SELECT 예외: " + e.getMessage());
        }
    }


   
    public static void selectByLevel({(String[] args) {
        System.out.println("------------- sELE ----------------");
        String step = System.console().readLine("조회 명단 입력 >>> ");  // "public";
        String sql = "SELECT * FROM tbl_javadict WHERE english = ?";
        Connection connection = OracleConnection.getConnerction();
        try (
            PreparedStatement pstat = connection.prepareStatement(sql);     // 자동 close
        ) {
            pstat.setString(1, step);
            ResultSet rs = pstat.executeQuery();     // 🔥 SELECTS 실행 메소드 executeQuery 실행결과(행 집합)는 ResultSet 타입
            boolean result = rs.next();     // 행집합 안에서 커서(행 위치)를 다음으로 이동
            int count = 0;
            while (result) {    // 행 집합 안에서 커서(행 위치)를 다음으로 이동. rs.next() 리턴이 
                
            }
            if(result){
                System.out.println("#### 조회 결과 컬럼값 출력 ####");
                System.out.println("번호: " + rs.getInt( 1));
                System.out.println("번호: " + rs.getInt( 2));
                System.out.println("번호: " + rs.getInt( 3));
                System.out.println("번호: " + rs.getInt( 4));

            }else {
                System.out.println("조회 결과가 없습니다.");
            }
        } catch (Exception e) {
            System.out.println("SELECT 예외: " + e.getMessage());
        }
    }

