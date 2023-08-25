package concert_info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.CommonJDBCUtil;
import reservation.ReservationVO;

	public class ConInfo_DAO {
	    private static final String DRIVER = "oracle.jdbc.OracleDriver";
	    private static final String URL = "jdbc:oracle:thin:@192.168.18.6:1521:xe";
	    private static final String USER = "project1";
	    private static final String PASSWORD = "project1";

	    private Connection conn = null;
	    private PreparedStatement pstmt = null;
		

	    static {
	        try {
	            Class.forName(DRIVER);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    ResultSet rs = null;
	    
	    public List<ConInfo_VO> selectAll() {
			List<ConInfo_VO> list = null;	
			
			try {
				//2. DB연결 - Connection 객체 생성 <- DriverManager
				conn = CommonJDBCUtil.getConnection();
				
				//3. Statement 문 실행(SQL 문 실행)
				StringBuilder sb = new StringBuilder();
				sb.append("SELECT CONCERT_ID, TITLE, GENRE, RUNNING_TIME, CONCERT_DATE, LOCATION, TIME");
				sb.append("  FROM CONCERT_INFO ");
				sb.append(" ORDER BY CONCERT_ID ");
				 
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				list = new ArrayList<ConInfo_VO>();
				
				//4. SQL 실행 결과에 대한 처리
				//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
				while (rs.next()) {
					ConInfo_VO vo = new ConInfo_VO(
							rs.getInt("Concert_id"), 
							rs.getString("Title"), 
							rs.getString("Genre"), 
							rs.getInt("Running_time"), 
							rs.getString("Concert_date"),
							rs.getString("Location"),
							rs.getString("Time"));

					list.add(vo);
				}  
				
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				//5. 클로징 처리에 의한 자원 반납
				CommonJDBCUtil.close(conn, pstmt, rs);
			}
			
			return list;
		}
	    
	    
		public ConInfo_VO selectOne(String id) {
			ConInfo_VO vo = null;
			
			//(할일) DB연결하고 SQL문 실행해서 결과값을 vo 변수에 저장하고 리턴
			
			try {
				//2. DB연결 - Connection 객체 생성 <- DriverManager
				conn = CommonJDBCUtil.getConnection();
				
				//3. Statement 문 실행(SQL 문 실행)
				StringBuilder sb = new StringBuilder();
				sb.append("SELECT CONCERT_ID, TITLE, GENRE, RUNNING_TIME, CONCERT_DATE, LOCATION, TIME ");
				sb.append("  FROM CONCERT_INFO ");
				sb.append(" WHERE Concert_id = ? ");
				
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, id);
				
				
				rs = pstmt.executeQuery();
				
				//4. SQL 실행 결과에 대한 처리
				//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
				if (rs.next()) {
					vo = new ConInfo_VO(
							rs.getInt("Concert_id"), 
							rs.getString("Title"), 
							rs.getString("Genre"), 
							rs.getInt("Running_time"), 
							rs.getString("Concert_date"),
							rs.getString("Location"),
							rs.getString("Time"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				//5. 클로징 처리에 의한 자원 반납
				CommonJDBCUtil.close(conn, pstmt, rs);
			}
			
			return vo;
		}
		
	    // INSERT -------------------------------------
	    public int insert(ConInfo_VO vo) {
	        int result = 0;
	        
	        
	        try {
	            conn = DriverManager.getConnection(URL, USER, PASSWORD);

	            
	            String sql = "INSERT INTO CONCERT_INFO (CONCERT_ID, TITLE, GENRE, RUNNING_TIME, CONCERT_DATE, LOCATION, TIME) "
                              + "VALUES (?, ?, ?, ?, ?, ?, ?)";
	            
	            
//	            StringBuilder sql = new StringBuilder();
//	            sql.append("INSERT INTO CONCERT_INFO ");
//	            sql.append("       (CONCERT_ID, TITLE, GENRE, RUNNING_TIME, CONCERT_DATE, LOCATION) ");
//	            sql.append("VALUES (?, ?, ?, ?, ?, ?) ");

	            pstmt = conn.prepareStatement(sql.toString());

	            pstmt.setInt(1, vo.getConcert_id());
	            pstmt.setString(2, vo.getTitle());
	            pstmt.setString(3, vo.getGenre());
	            pstmt.setInt(4, vo.getRunning_time());
	            pstmt.setString(5, vo.getConcert_date());
	            pstmt.setString(6, vo.getLocation());
	            pstmt.setString(7, vo.getTime());

	            result = pstmt.executeUpdate();

	        } catch (SQLException e) {
	            System.out.println("[예외발생] 작업중 예외가 발생 : " + e.getMessage());
	            result = -1;
	        } finally {
	            close();
	        }

	        return result;
	    }
	    // DELETE ------------------------------------------
	    public int delete(ConInfo_VO vo) {
	        int result = 0;

	        try {
	            conn = DriverManager.getConnection(URL, USER, PASSWORD);

	            String sql = "DELETE FROM CONCERT_INFO WHERE CONCERT_ID = ?";

	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, vo.getConcert_id());

	            result = pstmt.executeUpdate();

	        } catch (SQLException e) {
	            System.out.println("[예외발생] 작업중 예외가 발생 : " + e.getMessage());
	            result = -1;
	        } finally {
	            close();
	        }

	        return result;
	    }

	    private void close() {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    
	}
}
