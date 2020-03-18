package com.my.app;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProdDBHandle {
	@Autowired
	DataSource dataSource;

	Connection conn;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public String insertData(String name, int age, String birth) {
		String sql = "insert into Student values(?, ?, ?)";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, birth);
			pstmt.execute();
			conn.close();

			return "insert success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public String selectData() {
		String sql = "select * from Student";
		JSONArray arr = new JSONArray();

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
			conn.close();
			System.out.println("조회 성공~~");

			return arr.toJSONString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public String makeJson() {
		
		JSONArray arr = new JSONArray();
		String sql = "select * from student";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				int age = rs.getInt("age");
				Date birth = rs.getDate("birth");
			
				JSONObject o = new JSONObject();
				o.put("name", name);
				o.put("age", age);
				String b ="";
				if( birth !=null)
					o.put("birth", birth.toString());
				else
					o.put("birth", b);
				arr.add(o);
			}

			rs.close();
			System.out.println("조회 성공~~");
			return arr.toJSONString();
		} catch (Exception ex) {
			System.out.println("조회 실패~~");
			return null;
		}	
	}
}
