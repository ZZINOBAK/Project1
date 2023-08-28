--hall_id / city / name / 총좌석수

INSERT INTO HALL_info 
VALUES (1, '서울', '예술의전당' , 8);

INSERT INTO HALL_info
VALUES (2, '서울', '콘서트홀', 8);

UPDATE HALL_info
SET No_seats = 9
WHERE hall_id = 2;

INSERT INTO HALL_info
VALUES (3, '서울', '재즈클럽', 8);

INSERT INTO HALL_info
VALUES (4, '서울', '올림픽공원', 8);

UPDATE HALL_info
SET no_seats = 9
WHERE hall_id = 4;

INSERT INTO HALL_info
VALUES (5, '서울', '잠실실내체육관', 8);

UPDATE HALL_info
SET hall_id = 5
WHERE hall_id = 7;

UPDATE HALL_info
SET no_seats = 9
WHERE hall_id = 5;


INSERT INTO HALL_info
VALUES (6, '경기', '수원 경기아트센터 대극장', 8);

UPDATE HALL_info
SET hall_id = 6
WHERE hall_id = 8;

UPDATE HALL_info
SET no_seats = 9
WHERE hall_id = 6;

INSERT INTO HALL_info
VALUES (7, '부산', '부산 드림씨어터', 8);

UPDATE HALL_info
SET hall_id = 7
WHERE hall_id = 9;

UPDATE HALL_info
SET no_seats = 9
WHERE hall_id = 7;

INSERT INTO HALL_info
VALUES (8, '광주', '광주 예술의전당 대극장', 8);

UPDATE HALL_info
SET hall_id = 8
WHERE hall_id = 10;

UPDATE HALL_info
SET no_seats = 9
WHERE hall_id = 8;

COMMIT;