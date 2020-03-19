package com.my.app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public class ProdDBHandle {

	@Autowired
	DataSource dataSource;

	Connection conn;
	PreparedStatement pstmt;

	public String insertStudent(String name, int age, String birth) {
		String sql = "insert into student values(?,?,?)";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, birth);
			pstmt.execute();
			conn.close();

			return "insert success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public String selectStudent() {
		String sql = "select * from student";
		JSONArray arr = new JSONArray();
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String birth = rs.getString("birth");
				
				JSONObject o = new JSONObject();
				o.put("name", name);
				o.put("age", age);
				o.put("birth", birth);

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