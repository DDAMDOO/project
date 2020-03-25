package com.my.app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public class LeeDBHandle {

	@Autowired
	DataSource dataSource;

	Connection conn;
	PreparedStatement pstmt;

	public String insertAppUser(String id, String pw, String name, String birth, String email, String gender) {
		String sql = "insert into app_user values(?,?,?,?,?,?)";
		try {

			System.out.println("insert ready");

			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.setString(6, gender);

			pstmt.execute();

			System.out.println("insert fin");

			return "insert success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String selectUser() {
		String sql = "select * from app_user";
		JSONArray arr = new JSONArray();
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("user_id");
				String pw = rs.getString("pw");
				String name = rs.getString("user_name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				String gender = rs.getString("gender");

				JSONObject o = new JSONObject();
				o.put("id", id);
				o.put("pw", pw);
				o.put("name", name);
				o.put("birth", birth);
				o.put("email", email);
				o.put("gender", gender);

				arr.add(o);
			}

			rs.close();
			return arr.toJSONString();
		} catch (Exception e) {
			System.out.println("Insert error : " + e.getLocalizedMessage());
			return null;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String loginCheck(String id, String pass) {
		String sql = "select user_id, pw from app_user where user_id='" + id + "' and pw='" + pass + "'";
		ResultSet rs = null;
		System.out.println("아이디 " + id + "비밀번호" + pass);
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				System.out.println("로그인 성공");

				rs.close();
				pstmt.close();
				return "success";
			} else {
				System.out.println("로그인 실패");
				rs.close();
				pstmt.close();
				return "fail";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String UpdateInfo(String id, String pw, String name, String birth, String email, String gender) {
//		String sql = "update app_user set pw = '" + pw + "', name ='" + name + "',birth='" + birth + "',email='" + email
//				+ "',gender='" + gender + "' where id = '" + id + "';";

		String sql = "update app_user set pw = ?, user_name =?,birth=?,email=?,gender=? where user_id = ?";
		try {
			System.out.println("update ready");

			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			System.out.println("핸들 로그" + id + " " + pw + " " + name + " " + birth + " " + email + " " + gender);

			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, birth);
			pstmt.setString(4, email);
			pstmt.setString(5, gender);
			pstmt.setString(6, id);

			pstmt.execute();

			return "update success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String selectMap(String search_name) {
		String sql = "select lat, lon, c.climb_code, climb_name, climb_diff from climb c, paths p where c.m_name like '%"
				+ search_name + "%' and c.climb_code = p.climb_code order by c.climb_code";
		JSONArray arr = new JSONArray();
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Double lat = rs.getDouble("lat");
				Double lon = rs.getDouble("lon");
				String climb_code = rs.getString("climb_code");
				String climb_name = rs.getString("climb_name");
				String climb_diff = rs.getString("climb_diff");

				JSONObject o = new JSONObject();
				o.put("lat", lat);
				o.put("lon", lon);
				o.put("climb_code", climb_code);
				o.put("climb_name", climb_name);
				o.put("climb_diff", climb_diff);
//				System.out.println("로그찍어봄"+lat+" "+lon);
				arr.add(o);
			}

			rs.close();
			return arr.toJSONString();
		} catch (Exception e) {
			System.out.println("Insert error : " + e.getLocalizedMessage());
			return null;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String selectData(String search, String level, String time) {
		String sql = "select * from climb A JOIN mountain B on A.m_code = B.m_code where A.m_name like '%";
		ResultSet rs = null;
		
		if(level.equals("none"))
			sql = sql + search + "%'";
		else if(level.equals("low"))
			sql =sql + search + "%' and climb_diff='쉬움'";
		else if(level.equals("medium"))
			sql =sql + search + "%' and climb_diff='중간'";
		if(time.equals("low"))
			sql = sql + " and (climb_up + climb_down) >= 0 and (climb_up + climb_down) < 5";
		else if(time.equals("medium"))
			sql = sql + " and (climb_up + climb_down) >= 5 and (climb_up + climb_down) < 60";
		else if(time.equals("high"))
			sql = sql + " and (climb_up + climb_down) >= 60";
		JSONArray arr = new JSONArray();
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int climb_code = rs.getInt("climb_code");
				String m_name = rs.getString("m_name");
				String m_addr = rs.getString("m_addr");
				String climb_name = rs.getString("climb_name");
				double climb_len = rs.getDouble("climb_len");
				int climb_time = rs.getInt("climb_up") + rs.getInt("climb_down");
				String climb_time_s = Integer.toString(climb_time);
				String climb_diff = rs.getString("climb_diff");
				String climb_risk = rs.getString("climb_risk");
				JSONObject o = new JSONObject();
				o.put("climb_code", climb_code);
				o.put("m_name", m_name);
				o.put("m_addr", m_addr);
				o.put("climb_name", climb_name);
				o.put("climb_len", climb_len * 1000);
				o.put("climb_time", climb_time + "분");
				o.put("climb_diff", climb_diff);
				o.put("climb_risk", climb_risk);
				arr.add(o);
			}
			return arr.toJSONString();	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void changeFav(String id, String climb_code) {
		String sql = "select * from favorite where user_id = ? and climb_code = ?";
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, climb_code);
			rs = pstmt.executeQuery();
			if(rs.next() == false) {
				String insert_sql = "insert into favorite values (?, ?)";
				pstmt = conn.prepareStatement(insert_sql);
				pstmt.setString(1, id);
				pstmt.setString(2, climb_code);
				pstmt.execute();
				//System.out.println("추가 성공");
				pstmt.close();
			}
			else {
				String delete_sql = "delete from favorite where user_id = ? and climb_code = ?";
				pstmt = conn.prepareStatement(delete_sql);
				pstmt.setString(1, id);
				pstmt.setString(2, climb_code);
				pstmt.execute();
				pstmt.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	//선재
	
	public String countPerCity() {
		//ArrayList<StudentModel> arr = new ArrayList<StudentModel>();
		JSONArray arr = new JSONArray();
		
		String sql = "select city, (anjeon+siljok+gaein+jonan+gita) from accident_loc order by (anjeon+siljok+gaein+jonan+gita)";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String acc_city = rs.getString(1);
				int acc_sum = rs.getInt(2); 
				JSONObject o = new JSONObject();
				o.put("addr", acc_city);
				o.put("num", acc_sum);
				
				arr.add(o);
			}
			rs.close();
			System.out.println("조회 성공");
			
			return arr.toJSONString();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("조회 실패");
			return null;
		}
	}
	
	public String countPerFactor() {
		//ArrayList<StudentModel> arr = new ArrayList<StudentModel>();
		JSONArray arr = new JSONArray();
		
		String sql = "select sum(anjeon), sum(siljok), sum(gaein), sum(jonan), sum(gita) from accident_loc";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int anjeon = rs.getInt(1);
				int siljok = rs.getInt(2);
				int gaein = rs.getInt(3);
				int jonan = rs.getInt(4);
				int gita = rs.getInt(5);

				JSONObject o = new JSONObject();
				o.put("anjeon", anjeon);
				o.put("siljok", siljok);
				o.put("gaein", gaein);
				o.put("jonan", jonan);
				o.put("gita", gita);
				
				arr.add(o);
			}
			rs.close();
			System.out.println("조회 성공");
			
			return arr.toJSONString();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("조회 실패");
			return null;
		}
	}
	
	
	public int selectMountNum(String m_name) {
		String sql = "select m_num from mountain where m_name = ?";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_name);
			
			rs = pstmt.executeQuery();
			rs.next();
			int num = rs.getInt(1);
			
			pstmt.close();
			return num;
		} catch (SQLException e) {
			System.out.println("MountNum 넘기기 오류");
			System.out.println(e.getMessage());
			return 0;
		}
	}
}