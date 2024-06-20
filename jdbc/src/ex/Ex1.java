package ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Ex1 {
    // jdbc 데이터베이스 users 테이블에 INSERT문으로 user 정보를 삽입하는 코드를 작성하시오.
    // 예시 : winter / 한겨울 / 12345 / 25 / winter@abc.com
    public static void main(String[] args) {
        String url = "jdbc:mysql://127.0.0.1:3306/jdbc";
        String user = "root";
        String password = "1234";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // 1. 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. 데이터베이스 연결
            connection = DriverManager.getConnection(url, user, password);

            // 3. SQL 쿼리 준비
            String sql = "INSERT INTO users (userId, username, password, age, email) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            // 4. 파라미터 설정
            preparedStatement.setString(1, "winter");
            preparedStatement.setString(2, "한겨울");
            preparedStatement.setString(3, "12345");
            preparedStatement.setInt(4, 25);
            preparedStatement.setString(5, "winter@abc.com");

            // 5. 쿼리 실행
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("A new user was inserted successfully!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 6. 리소스 해제
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
