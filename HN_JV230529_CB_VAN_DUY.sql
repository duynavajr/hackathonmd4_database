CREATE DATABASE QUANLYDIEMTHI ;
USE QUANLYDIEMTHI;
CREATE TABLE student(
studentId varchar(4) PRIMARY KEY NOT NULL,
studentName varchar(100) not null,
birthday DATE not null,
gender BIT(1) not null ,
address TEXT not null ,
phoneNumber varchar(45) UNIQUE
);
CREATE TABLE subject (
subjectId varchar(4) PRIMARY KEY NOT NULL,
subjectName varchar(45) not null,
priority int(11) not null
);
CREATE TABLE mark (
subjectId varchar(4) not null,
StudentId varchar(4) not null,
FOREIGN KEY (subjectId) references subject(subjectId),
FOREIGN KEY (StudentId) references student(StudentId),
point int(11) not null
);
-- thêm dữ liệu vào bảng stdent
INSERT INTO student(studentId,studentName,birthday,gender,address,phoneNumber) VALUES
("S001","Nguyễn Thế Anh","1999/1/11",1,"Hà Nội","984678082"),
("S002","Đặng Bảo Trâm","1998/12/22",0,"Lào Cai","904982654"),
("S003","Trần Hà Phương","2000/5/5",0,"Nghệ An","947645363"),
("S004","Đỗ Tiến Mạnh","1999/3/26",1,"Hà Nội","983665353"),
("S005","Phạm Duy Nhất","1998/10/4",1,"Tuyên Quang","987242678"),
("S006","Mai Văn Thái","2002/6/22",1,"Nam Định","982754268"),
("S007","Giang Gia Hân","1996/11/10",0,"Phú Thọ","982364753"),
("S008","Nguyễn Ngọc Bảo My","1999/1/22",0,"Hà Nam","927867453"),
("S009","Nguyễn Tiến Đạt","1998/8/7",1,"Tuyên Quang","989274673"),
("S010","Nguyễn Thiều Quang","2000/9/18",1,"Hà Nội","984378291");

-- -- -- thêm dữ liệu vào bảng subject

INSERT INTO subject (subjectId,subjectName,priority) VALUES
('MH01', 'Toán', 2),
('MH02', 'Vật lý', 2),
('MH03', 'Hoá học', 1),
('MH04', 'Ngữ văn', 1),
('MH05', 'Tiếng Anh', 2);

-- thêm dữ liệu vào bảng mark 
INSERT INTO mark(studentId,subjectId,point) VALUES 
("S001","MH01", 8.5),("S001","MH02", 7),("S001","MH03", 9),("S001","MH04", 9),("S001","MH05", 5),
("S002","MH01", 9),("S002","MH02", 8),("S002","MH03", 6.5),("S002","MH04", 8),("S002","MH05", 6),
("S003","MH01", 7.5),("S003","MH02", 6.5),("S003","MH03", 8),("S003","MH04", 7),("S003","MH05", 7),
("S004","MH01", 6),("S004","MH02", 7),("S004","MH03", 5),("S004","MH04", 6.5),("S004","MH05", 8),
("S005","MH01", 5.5),("S005","MH02", 8),("S005","MH03", 7.5),("S005","MH04", 8.5),("S005","MH05", 9),
("S006","MH01", 8),("S006","MH02", 10),("S006","MH03", 9),("S006","MH04", 7.5),("S006","MH05", 6.5),
("S007","MH01", 9.5),("S007","MH02", 9),("S007","MH03", 6),("S007","MH04", 9),("S007","MH05", 4),
("S008","MH01", 10),("S008","MH02", 8.5),("S008","MH03", 8.5),("S008","MH04", 6),("S008","MH05", 9.5),
("S009","MH01", 7.5),("S009","MH02", 7),("S009","MH03", 9),("S009","MH04", 5),("S009","MH05", 10),
("S010","MH01", 6.5),("S010","MH02", 8),("S010","MH03", 5.5),("S010","MH04", 4),("S010","MH05", 7);

-- bài 2 CẬP NHẬT DỮ LIỆU ...

-- Sửa tên sinh viên có mã S004 thành “Đỗ Đức Mạnh”.
UPDATE student
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';

-- Sửa tên và hệ số môn học có mã MH05 thành “NgoạiNgữ” và hệ số là 1.
UPDATE subject
SET subjectName = 'NgoạiNgữ', priority = 1
WHERE subjectId = 'MH05';

-- Cập nhật lại điểm của học sinh có mã S009
UPDATE mark
SET point = 8.5
WHERE studentId = 'S009' AND subjectId = 'MH01';

UPDATE mark
SET point = 7
WHERE studentId = 'S009' AND subjectId = 'MH02';

UPDATE mark
SET point = 5.5
WHERE studentId = 'S009' AND subjectId = 'MH03';

UPDATE mark
SET point = 6
WHERE studentId = 'S009' AND subjectId = 'MH04';

UPDATE mark
SET point = 9
WHERE studentId = 'S009' AND subjectId = 'MH05';

-- Xóa thông tin học sinh có mã S010 từ bảng MARK
DELETE FROM mark WHERE studentId = 'S010';
-- Xóa thông tin học sinh có mã S010 từ bảng STUDENT
DELETE FROM student WHERE studentId = 'S010';

-- bài 3 Truy vấn dữ liệu...
-- 1 Lấy ra tất cả thông tin của sinh viên trong bảng Student 
SELECT * FROM student;
-- 2 Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
SELECT subjectId, subjectName
FROM subject
WHERE priority = 1;

-- 3 Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh)
-- giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
SELECT 
    studentId, 
    studentName, 
TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS age,
CASE 
WHEN gender = 1 THEN 'Nam'
ELSE 'Nữ'
END AS gender,address AS hometown
FROM student;

-- 4 Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán
--  và sắp xếp theo điểm giảm dần. 
SELECT s.studentName, sub.subjectName, m.point
FROM student s
JOIN mark m ON s.studentId = m.studentId
JOIN subject sub ON m.subjectId = sub.subjectId
WHERE sub.subjectName = 'Toán'
ORDER BY m.point DESC;

-- 5 Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng)
SELECT 
CASE 
WHEN gender = 1 THEN 'Nam'
ELSE 'Nữ'
END AS Gender,COUNT(*) AS Total
FROM student
GROUP BY gender;

-- 6 Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán)
-- bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
SELECT s.studentId,s.studentName,SUM(m.point) AS totalPoint,AVG(m.point) AS averagePoint
FROM student s
JOIN mark m ON s.studentId = m.studentId
GROUP BY s.studentId, s.studentName;

-- Bài 4: Tạo View, Index, Procedure -- 
-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán .
CREATE VIEW STUDENT_VIEW AS
SELECT studentId,studentName,
CASE 
WHEN gender = 1 THEN 'Nam'ELSE 'Nữ'
END AS Gender,
address AS Hometown
FROM student;

-- 2 Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,điểm trung bình các môn học .
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT s.studentId,s.studentName,
AVG(m.point) AS averageMark
FROM student s
JOIN mark m ON s.studentId = m.studentId
GROUP BY s.studentId, s.studentName;

-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT.
CREATE INDEX idx_phoneNumber ON student(phoneNumber);

-- 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó.
DELIMITER //
CREATE PROCEDURE PROC_INSERTSTUDENT(
IN p_studentId varchar(4),
IN p_studentName varchar(100),
IN p_birthday DATE,
IN p_gender BIT(1),
IN p_address TEXT,
IN p_phoneNumber varchar(45)
)
BEGIN
INSERT INTO student (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
END //
DELIMITER ;

--  Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
DELIMITER //
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN p_subjectId varchar(4),
    IN p_newSubjectName varchar(45)
)
BEGIN
    UPDATE subject
    SET subjectName = p_newSubjectName
    WHERE subjectId = p_subjectId;
END //
DELIMITER ;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh và trả về số bản ghi đã xóa.
DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK(
IN p_studentId varchar(4),
OUT p_numDeleted INT
)
BEGIN
DECLARE num_deleted INT;
DELETE FROM mark
WHERE studentId = p_studentId;
SET p_numDeleted = ROW_COUNT();
END //
DELIMITER ;










 



 




