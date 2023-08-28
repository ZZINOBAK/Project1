--테스트 조회

SELECT *
FROM RESERVATION
ORDER BY BOOK_ID
;

book_id
user_id
concert_id
hall_id
count
seat
totalPrice
paymentMethod
createDate
status

book_id user_id concert_id hall_id count seat totalPrice paymentMethod createDate status
book_id, user_id, concert_id, hall_id, count, seat, totalPrice, paymentMethod, createDate, status

    int book_id, String user_id, int concert_id, int hall_id, int count,
			String seat, int totalprice, String paymentmethod, String status
            
            
            
            
INSERT INTO CONCERT_INFO
VALUES(11, '하이', 'ㅋㅋ', 123, sysdate, '서울')
;              

DELETE FROM CONCERT_INFO
WHERE Concert_ID = 11;

INSERT INTO HALL_INFO
VALUES(12, '하이', 'ㅋㅋ', '서울')
;
INSERT INTO RESERVATION
VALUES(1, 
    (SELECT USER_ID FROM USERS  WHERE USER_ID = 'GKAJT'), 
    (SELECT CONCERT_ID FROM CONCERT_INFO WHERE CONCERT_ID = '11'),
    (SELECT HALL_ID FROM HALL_INFO WHERE HALL_ID = '12'), 
    2, '20번, 21번', 1000000, '카드', sysdate, '정상')
;
SELECT R.*, U.USER_ID, C.CONCERT_ID, H.HALL_ID
FROM Reservation R
JOIN  Users U ON U.USER_ID = R.USER_ID
JOIN Concert_info C ON R.CONCERT_ID = C.CONCERT_ID
JOIN Hall_info H ON R.HALL_ID = H.HALL_ID;

commit;

SELECT R.*
FROM Reservation R, Users U, Concert_info C, Hall_info H
WHERE R.user_id = U.user_id AND R.Concert_id = C.Concert_id AND R.hall_id= H.hall_id
--AND R.Concert_id = 2
;
SELECT R.*
FROM Reservation R
JOIN Users U ON R.user_id = U.user_id
JOIN Concert_info C ON R.Concert_id = C.Concert_id
JOIN Hall_info H ON R.hall_id = H.hall_id;


SELECT R.*, CI.concert_id AS concert_info_id
FROM reservation R
JOIN concert_info CI ON R.concert_id = CI.concert_id;



UPDATE concert_info
   SET time = TO_TIMESTAMP('19:30:00', 'HH24:MI:SS')
 WHERE concert_info = '1'
;   


UPDATE concert_info
   SET time = TO_TIMESTAMP('19:30:00', 'HH24:MI:SS')
 WHERE concert_id = 1;

INSERT INTO concert_info
VALUES(1, 'ㅇㅇㅇ', 'ㅇㅇㄹ', 12, '2023-05-29', 'ddfh', '7시')
;

Select *
from concert_info
;1	예술의전당 여름음악축제	클래식	120	2023/09/01	예술의전당	19:00

INSERT INTO concert_info (concert_id, title, genre, running_time, concert_date, location, time)
VALUES (
1,
    '예술의전당 여름음악축제',
    '클래식',
    120,
    TO_DATE('2023/09/01', 'YYYY/MM/DD'),
    '예술의전당',
    '19:00:00'
);

ALTER TABLE concert_info
DROP CONSTRAINT fk_child_parent;

UPDATE concert_info
SET location = (SELECT  h.name
FROM hall_info h 
WHERE h.hall_id = 2)
WHERE concert_id = 1;

SELECT  h.name
FROM hall_info h 
WHERE h.hall_id = 1
;

