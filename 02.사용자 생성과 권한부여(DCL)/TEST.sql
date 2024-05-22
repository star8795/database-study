-- 예제: director, ceo, staff 사용자 삭제 및 생성
DROP USER IF EXISTS 'director'@'localhost';
DROP USER IF EXISTS 'ceo'@'localhost';
DROP USER IF EXISTS 'staff'@'localhost';

CREATE USER 'director'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'ceo'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'staff'@'localhost' IDENTIFIED BY 'password';

-- 권한 부여 예제는 제공되지 않았으므로 생략

-- 문제 1: 'report_user' 사용자 생성 및 SELECT 권한 부여
CREATE USER 'report_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON sakila.* TO 'report_user'@'localhost';

-- 문제 2: 'admin_user' 사용자 생성 및 모든 권한 부여
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON world.* TO 'admin_user'@'localhost';

-- 문제 3: 'dev_user' 사용자 생성 및 특정 권한 부여
CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE ON sakila.actor TO 'dev_user'@'localhost';

-- 문제 4: 'guest_user' 사용자 생성 및 SELECT 권한 부여
CREATE USER 'guest_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON world.city TO 'guest_user'@'localhost';

-- 문제 5: 'report_user' 사용자로부터 SELECT 권한 회수
REVOKE SELECT ON sakila.* FROM 'report_user'@'localhost';

-- 문제 6: 'dev_user' 사용자의 권한 회수 및 SELECT 권한 다시 부여
REVOKE SELECT, INSERT, UPDATE ON sakila.actor FROM 'dev_user'@'localhost';
GRANT SELECT ON sakila.actor TO 'dev_user'@'localhost';

-- 문제 7: 모든 사용자 삭제
DROP USER 'report_user'@'localhost';
DROP USER 'admin_user'@'localhost';
DROP USER 'dev_user'@'localhost';
DROP USER 'guest_user'@'localhost';
