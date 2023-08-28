/*
CREATE TABLE CONCERT_INFO (
    concert_id NUMBER(2) Primary Key,
    title VARCHAR2(100) NOT NULL,
    genre VARCHAR2(50) NOT NULL,
    running_time NUMBER NOT NULL,
    concert_date VARCHAR2(100) NOT NULL,
    location VARCHAR2(500)
);
*/

ALTER TABLE concert_INFO
ADD hall_id number(2)  REFERENCES hall_info(hall_id); 

ADD CONSTRAINT fk_RESERVATION_concert_info
FOREIGN KEY (concert_id) REFERENCES concert_info(concert_id)
ON DELETE CASCADE;

INSERT INTO CONCERT_INFO
VALUES (1, '김하은1', '클래식', 100, '2023년 8월 30일', (select name from hall_info
where hall_id = 7), '7시'
);

INSERT INTO CONCERT_INFO (concert_id, title, genre, running_time, concert_date, location, time, hall_id)
select 98, '김하은테스트1', '클래식', 100, sysdate, name, '8시', hall_id 
from hall_info
where hall_id = 4
;
UPDATE CONCERT_INFO
SET title = '김하은테스트 '
WHERE concert_id =99;

INSERT INTO CONCERT_INFO
VALUES (2, '제목2', '클래식', 100, '2023년 8월 30일', '예술의전당 오페라극장');

INSERT INTO CONCERT_INFO
VALUES (3, '제목3', '클래식', 100, '2023년 8월 30일', '예술의전당 오페라극장');

INSERT INTO concert_info (concert_id, title, genre, running_time, concert_date, location)
SELECT 4, '제목4', 'K-pop', 150, '2023-09-05', h.name || ' ' || h.hallname
FROM hall_info h
WHERE h.hall_id = 2;


commit;
