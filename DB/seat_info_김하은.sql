/*
CREATE TABLE SEAT_INFO (
	seat_id number(2)	PRIMARY KEY,
	hall_id number(2) REFERENCES HALL_INFO (HALL_ID)
);
seat id
hall id
좌석 번호
가격
*/

-- 아니면 여기에 좌석 번호를 지정해줘서 사용한 자리는 예약 못하게 할 수 있나?
ALTER TABLE SEAT_INFO
ADD hallname varchar2(2); 

UPDATE SEAT_INFO
SET hallname, hall_id = (select name, hall_id from hall_info where hall_id = 8) -- 추가하려는 데이터 값
WHERE hall_id = 8;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 4, h.hall_id, h.name, 'B-2', '40000'
FROM hall_info h
WHERE h.hall_id = 1;

CREATE VIEW seat_info_with_hallname AS
SELECT si.seat_id, si.hall_id, si.seat_no, si.seat_price, hi.hallname
FROM seat_info si
JOIN hall_info hi ON si.hall_id = hi.hall_id;

CREATE OR REPLACE TRIGGER update_hallname_trigger
AFTER UPDATE ON seat_info
FOR EACH ROW
BEGIN
  IF :NEW.hall_id != :OLD.hall_id THEN
    UPDATE seat_info
    SET hallname = :NEW.hallname
    WHERE hall_id = :NEW.hall_id;
  END IF;
END;

UPDATE SEAT_INFO
SET hall_id = (select hall_id from hall_info where hall_id =2) -- 첫 번째 컬럼 업데이트할 데이터 값
WHERE seat_id = 1; --

--예술의전당(id=1) 대극장 좌석 정보-------------------------------------------------------------
INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 1, h.hall_id, 'A-1', '50000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 2, h.hall_id, 'A-2', '50000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 3, h.hall_id, 'B-1', '40000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 4, h.hall_id, 'B-2', '40000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 5, h.hall_id, 'C-1', '35000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 6, h.hall_id, 'C-2', '35000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 7, h.hall_id, 'D-1', '20000'
FROM hall_info h
WHERE h.hall_id = 1;

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 8, h.hall_id, 'D-2', '20000'
FROM hall_info h
WHERE h.hall_id = 1;

commit;

--콘서트홀(id =2) 좌석 정보-------------------------------------------------------------

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 9, h.hall_id, 'A-1', '50000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 10, h.hall_id, 'A-2', '50000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 11, h.hall_id, 'A-3', '50000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 12, h.hall_id, 'B-1', '35000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 13, h.hall_id, 'B-2', '35000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 14, h.hall_id, 'B-3', '35000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 15, h.hall_id, 'C-1', '20000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 16, h.hall_id, 'C-2', '20000' FROM hall_info h WHERE h.hall_id = 2
UNION ALL
SELECT 17, h.hall_id, 'C-3', '20000' FROM hall_info h WHERE h.hall_id = 2;

COMMIT;

--재즈클럽(id=3) 좌석 정보-------------------------------------------------------------

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 18, h.hall_id, 'A-1', '50000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 19, h.hall_id, 'A-2', '50000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 20, h.hall_id, 'B-1', '40000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 21, h.hall_id, 'B-2', '40000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 22, h.hall_id, 'C-1', '35000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 23, h.hall_id, 'C-2', '35000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 24, h.hall_id, 'D-1', '25000' FROM hall_info h WHERE h.hall_id = 3
UNION ALL
SELECT 25, h.hall_id, 'D-2', '25000' FROM hall_info h WHERE h.hall_id = 3;

COMMIT;


--올림픽공원(id = 4) 좌석 정보-------------------------------------------------------------

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 26, h.hall_id, 'A-1', '60000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 27, h.hall_id, 'A-2', '60000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 28, h.hall_id, 'A-3', '60000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 29, h.hall_id, 'B-1', '35000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 30, h.hall_id, 'B-2', '35000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 31, h.hall_id, 'B-3', '35000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 32, h.hall_id, 'C-1', '25000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 33, h.hall_id, 'C-2', '25000' FROM hall_info h WHERE h.hall_id = 4
UNION ALL
SELECT 34, h.hall_id, 'C-3', '25000' FROM hall_info h WHERE h.hall_id = 4;

COMMIT;

--잠실실내체육관(id=5) 좌석 정보-------------------------------------------------------------

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 35, h.hall_id, 'A-1', '60000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 36, h.hall_id, 'A-2', '60000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 37, h.hall_id, 'A-3', '60000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 38, h.hall_id, 'B-1', '35000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 39, h.hall_id, 'B-2', '35000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 40, h.hall_id, 'B-3', '35000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 41, h.hall_id, 'C-1', '25000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 42, h.hall_id, 'C-2', '25000' FROM hall_info h WHERE h.hall_id = 5
UNION ALL
SELECT 43, h.hall_id, 'C-3', '25000' FROM hall_info h WHERE h.hall_id = 5;

COMMIT;

--수원 경기아트센터 대극장(id=6) 좌석 정보-------------------------------------------------------------
INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 44, h.hall_id, 'A-1', '40000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 45, h.hall_id, 'A-2', '40000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 46, h.hall_id, 'A-3', '40000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 47, h.hall_id, 'B-1', '35000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 48, h.hall_id, 'B-2', '35000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 49, h.hall_id, 'B-3', '35000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 50, h.hall_id, 'C-1', '30000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 51, h.hall_id, 'C-2', '30000' FROM hall_info h WHERE h.hall_id = 6
UNION ALL
SELECT 52, h.hall_id, 'C-3', '30000' FROM hall_info h WHERE h.hall_id = 6;

COMMIT;

--부산 드림씨어터(id=7) 좌석 정보-------------------------------------------------------------
INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 53, h.hall_id, 'A-1', '50000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 54, h.hall_id, 'A-2', '50000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 55, h.hall_id, 'A-3', '50000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 56, h.hall_id, 'B-1', '35000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 57, h.hall_id, 'B-2', '35000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 58, h.hall_id, 'B-3', '35000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 59, h.hall_id, 'C-1', '25000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 60, h.hall_id, 'C-2', '25000' FROM hall_info h WHERE h.hall_id = 7
UNION ALL
SELECT 61, h.hall_id, 'C-3', '25000' FROM hall_info h WHERE h.hall_id = 7;

COMMIT;

--광주 예술의전당 대극장(id=8) 좌석 정보-------------------------------------------------------------

INSERT INTO seat_info (seat_id, hall_id, seat_no, seat_price)
SELECT 62, h.hall_id, 'A-1', '100000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 63, h.hall_id, 'A-2', '100000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 64, h.hall_id, 'A-3', '100000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 65, h.hall_id, 'B-1', '7000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 66, h.hall_id, 'B-2', '7000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 67, h.hall_id, 'B-3', '7000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 68, h.hall_id, 'C-1', '55000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 69, h.hall_id, 'C-2', '55000' FROM hall_info h WHERE h.hall_id = 8
UNION ALL
SELECT 70, h.hall_id, 'C-3', '55000' FROM hall_info h WHERE h.hall_id = 8;

COMMIT;
