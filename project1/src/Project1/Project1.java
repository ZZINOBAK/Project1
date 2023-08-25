package Project1;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;

import concert_info.ConInfo_DAO;
import concert_info.ConInfo_VO;
import reservation.ReservationDAO;
import reservation.ReservationVO;

public class Project1 {
	//필드-------------------------------------------------------------
	private Scanner scan = new Scanner(System.in);
	private static final String CONCERT_INFO = "콘서트";
	private static final String RESERVATION = "예약하기";
	private static final String MY = "마이페이지";
	private static final String QUESTION = "문의사항";
	private static final String LOGIN = "로그인";
	private static final String JOININ = "회원가입";
	private static final String MANAGER = "관리자모드";
	
	//생성자------------------------------------------------------------
	
	//메소드------------------------------------------------------------
	public void startProject1() {
		int selcet;
		int intscanner;
		String sscanner;
		String concertscanner;
		int countscanner;
		String seatscanner;
		String paymentMethodscanner;
		
		ReservationDAO reservationDAO = new ReservationDAO();
		ConInfo_DAO conInfoDAO = new ConInfo_DAO();
		LocalDate nowDate = LocalDate.now();
		
		int book_id;
		String user_id = null;
		int concert_id;
		int hall_id;
		int count;
		String seat = null;
		int totalprice;
		String paymentMethod = null;
		String createDate = nowDate.toString();
		String status = "정상";
		
		List<ConInfo_VO> clist = conInfoDAO.selectAll();
		
		
		
		
		while (true) {
			System.out.println("----------------------------GIMIBAK----------------------------");
			System.out.println("1." + CONCERT_INFO + " 2." + RESERVATION + " 3." + MY + " 4." + 
					QUESTION + " 5." + LOGIN + " 6." + JOININ + " 7." + MANAGER + " 0.종료");
			System.out.println("---------------------------------------------------------------");
			System.out.println("원하는 서비스의 번호를 입력하시오.");
			System.out.print("번호 입력 : ");
			selcet = scan.nextInt();
			scan.nextLine();
			System.out.println("---------------------------------------------------------------");
			
			//콘서트---------------------------------------------------------------------------------
			if (selcet == 1) { 
				
				
			}
			
			//예약하기---------------------------------------------------------------------------------
			if (selcet == 2) { 
				while (true) {
					// 1. 콘서트 선택
					System.out.println();
					System.out.println("<콘서트 INFORMATION>");
					System.out.println("번호\t콘서트명\t\t\t\t장르\t러닝타임\t날짜\t\t\t장소\t\t시간");
					for (ConInfo_VO vo : clist) {
					    System.out.println(String.format("%-1s\t%-24s\t%-5s\t%-5s\t%-10s\t%-20s",
					                      vo.getConcert_id(), vo.getTitle(), vo.getGenre(),
					                      vo.getRunning_time(), vo.getConcert_date(), vo.getLocation(), 
					                      vo.getTime()));
					}
					System.out.println("---------------------------------------------------------------");
					System.out.println("관람할 콘서트의 번호를 입력하시오.");

					while (true) {
						System.out.print("콘서트 번호 입력 : ");
						concertscanner = scan.nextLine();
						
						if (Integer.parseInt(concertscanner) <= 10) {
			                // 입력값이 1부터 4 사이인 경우
			                break; // 올바른 입력이므로 반복문 종료
			            } else {
			                // 입력값이 범위를 벗어난 경우
			                System.out.println("잘못된 입력입니다. 다시 입력하세요.");
			            }
					}
					ConInfo_VO id = conInfoDAO.selectOne(concertscanner);
					System.out.println();
					
					// 2. 인원 선택하기
					System.out.println("관람할 인원을 입력하시오.(최대 5명)");
					while (true) {
						System.out.print("인원 입력 : ");
						countscanner = scan.nextInt();
						scan.nextLine();
						
						 if (countscanner < 6) {
				                break;
						 } else {
				                System.out.println("인원은 최대 5명까지 가능합니다. 다시 입력해주세요.");
				           }
					}
					System.out.println();

					// 3. 좌석 선택하기
					HashSet<String> inputSet = new HashSet<>();
					System.out.println("원하는 좌석의 번호를 입력하시오.");
					// 여기에 좌석 표 보여줘야함
					for (int i = 1; i < countscanner+1; i++) {	
						System.out.print("좌석 번호 입력 " + i + " : ");
						seatscanner = scan.nextLine();
						
						if (inputSet.contains(seatscanner)) {
			                System.out.println("중복된 좌석입니다. 다른 좌석을 선택하세요.");
			                i--; // 이미 입력된 번호로 인해 i 값을 감소시켜 한 번 더 입력하도록 함
			            } else {
			                inputSet.add(seatscanner);
			            }
					}
					System.out.println();
					System.out.println("---------------------------------------------------------------");

					// 4. 회원/비회원 예매 선택하기
					System.out.println("1.회원 예매 2.비회원 예매");
					System.out.print("번호 입력 : ");
					intscanner = scan.nextInt();
					scan.nextLine();
					System.out.println("---------------------------------------------------------------");

					if(intscanner == 1) {
						//여기서 아예 로그인페이지로 넘어가게 하고싶은데....
					}
					if(intscanner == 2) {
						System.out.println("<비회원 RESERVATION>");
						while (true) {
							System.out.print("전화번호 입력(010-0000-0000) : ");
							sscanner = scan.nextLine();
							
							if (sscanner.matches("\\d{3}-\\d{4}-\\d{4}")) {
			                    break; // 올바른 형식이므로 반복문 종료
			                } else {
			                    System.out.println("잘못된 형식입니다. 다시 입력하세요.");
			                }
						}
						System.out.println();
						System.out.print("티켓수령지 입력 : ");
						sscanner = scan.nextLine();
						
						System.out.println();
						System.out.println("---------------------------------------------------------------");
					}
					

					// 5. 결제하기
					System.out.println("<PAYMENT>");
					System.out.println("결제하실 금액은 " + " " + "입니다.");
					System.out.println();
					System.out.println("결제 방법을 선택해주세요.");
					System.out.println("1.카드결제 2.계좌이체");
					System.out.print("번호 입력 : ");
					paymentMethodscanner = scan.nextLine();
					System.out.println();
					System.out.println("---------------------------------------------------------------");
//
//					int maxBookId = 0;
//					for (ReservationVO existingReservation : reservationDAO.selectAll()) {
//					    if (existingReservation.getBook_id() > maxBookId) {
//					        maxBookId = existingReservation.getBook_id();
//					    }
//					}
					book_id = 2;
					user_id = null;
					concert_id = id.getConcert_id();
					hall_id = 0; // 입력된 콘서트 정보에서 홀 정보 가져오기
					count = countscanner;
					seat = String.join(", ", inputSet);
					totalprice = 0; //선택한 좌석 * 가격
					paymentMethod = paymentMethodscanner;
					status = "정상";
					
					for (ConInfo_VO vo : clist) {
						if (vo.getConcert_id() == 1) {
							 //입력된 콘서트 번호로 
							ReservationVO reservation = new ReservationVO (book_id, user_id, concert_id, hall_id, count, seat, totalprice, paymentMethod, nowDate.toString(), status);
							reservationDAO.insert(reservation);							
						    break;
						}
					}
					
					// 6. 예매완료
					System.out.println("성공적으로 예매 되었습니다.");
					System.out.println("추가로 예매를 원하시면 \"Y\"를 원치 않으시면 \"N\"를 입력하세요.");
					while (true) {
						System.out.print("입력 : ");
						sscanner = scan.nextLine();
						if (sscanner.equalsIgnoreCase("Y")) {
							//여기서 Y 누르면 다시 예매 탭으로 가고
							System.out.println("---------------------------------------------------------------");
							break;
						} else if (sscanner.equalsIgnoreCase("N")) {
							//N 누르면 처음으로 돌아가게 하기
							break;
						} else {
		                // Y나 N이 아닌 다른 입력인 경우
		                System.out.println("잘못된 입력입니다. \"Y\"나 \"N\"을 입력하세요.");
						}
					}
					if (sscanner.equalsIgnoreCase("N")) {
						//N 누르면 처음으로 돌아가게 하기
						System.out.println("감사합니다. 안녕히가시오.");
						System.out.println("---------------------------------------------------------------");
						System.out.println();
						System.out.println();
						break;
					} 
				}
			}
			
			//마이페이지---------------------------------------------------------------------------------
			if (selcet == 3) { 
				
				
			}
			
			//문의사항---------------------------------------------------------------------------------
			if (selcet == 4) { 
			
				
			}
			
			//로그인---------------------------------------------------------------------------------
			if (selcet == 5) { 
				
				
			}
			 
			if (selcet == 6) {
				
			}
			
			//관리자모드---------------------------------------------------------------------------------
			if (selcet == 7) {
				
				
			}
			
			//종료---------------------------------------------------------------------------------
			if (selcet == 0) { 
				System.out.print("감사합니다. 안녕히가시오.");
				break;
			}
			
		}

	}	
	
}













