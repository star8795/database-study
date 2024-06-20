import java.sql.*;

public class Jdbc3 {
    public static void main(String[] args) {
        String url = "jdbc:mysql://127.0.0.1:3306/scott";
        String user = "root";
        String password = "1234";

        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            conn = DriverManager.getConnection(url, user, password);

            // 연결 객체에서 문장을 생성
            statement = conn.createStatement();

            String sql = "SELECT * FROM emp";

            // 실행문을 실행(executeQuery) => 결과 집합이 반환
            resultSet = statement.executeQuery(sql);

            // next() : 읽어올 행의 정보가 있으면 true
            //          읽어올 행의 정보가 있으면 false
            //          true일 경우 커서를 한 행 밑으로 이동
            while(resultSet.next())  {
                // 결과 집합에서 특정 컬럼 데이터를 반환
                // getXXX : 특정 타입의 데이터를 컬럼명에 맞게 반환
                String ename = resultSet.getString("ename");
                System.out.println(ename);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                resultSet.close();
                statement.close();
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }
}