INSERT INTO reservation (book_id, user_id, concert_id, hall_id, count, seat, totalprice, paymentmethod, createdate, status)
SELECT 99, u.user_id, c.concert_id, c.hall_id, 99, s.seat_no, s.seat_price, '카드', sysdate, '정상'
FROM users u, concert_info c, seat_info s
;


ALTER TABLE reservation
ADD seat_id number(3)  REFERENCES seat_info(seat_id); 


