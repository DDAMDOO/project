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
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setString(4,birth);
			pstmt.setString(5, email);
			pstmt.setString(6, gender);
			
			pstmt.execute();
			conn.close();
			
			System.out.println("insert fin");
			
			return "insert success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
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
		}
	}
}
