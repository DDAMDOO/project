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
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public String selectMap(String search_name) {
		String sql = "select lat, lon, c.climb_code from climb c, paths p where c.m_name like '%" + search_name
				+ "%' and c.climb_code = p.climb_code order by c.climb_code";
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

				JSONObject o = new JSONObject();
				o.put("lat", lat);
				o.put("lon", lon);
				o.put("climb_code",climb_code);
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

}