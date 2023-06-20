package com.thl.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thl.model.member;
import com.thl.util.DbUtil;

public class memberDao {

	private Connection connection;

	public memberDao() {
		connection = DbUtil.getConnection();
	}

	public void addUser(member member) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into `brick_db`.`brick_table` (name, password, record, try, email) values (?, ?, ?, ?, ?)");
			// Parameters start with 1
			preparedStatement.setString(1, member.getName());
			preparedStatement.setString(2, member.getPassword());
			preparedStatement.setString(3, member.getRecord());
			preparedStatement.setInt(4, member.getTrial());
			preparedStatement.setString(5, member.getEmail());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser(String name) { // 여기 뭐넣을지 나중에 생각
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from `brick_db`.`brick_table` where name=?"); //여기도
			// Parameters start with 1
			preparedStatement.setString(1, name); //여기도
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser(member member) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update `brick_db`.`brick_table` set name=?, password=?, record=?, try=?, email=?" +
							"where name=?"); // 여기에 뭐넣을지 생각
			// Parameters start with 1
			preparedStatement.setString(1, member.getName());
			preparedStatement.setString(2, member.getPassword());
			preparedStatement.setString(3, member.getRecord());
			preparedStatement.setInt(4, member.getTrial());
			preparedStatement.setString(5, member.getEmail());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<member> getAllUsers() {
		List<member> members = new ArrayList<member>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from `brick_db`.`brick_table`");
			while (rs.next()) {
				member member = new member();

				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setRecord(rs.getString("record"));
				member.setTrial(rs.getInt("try"));
				member.setEmail(rs.getString("email"));
				members.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return members;
	}
	
	public member getUserById(String name) {
		member member = new member();
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from `brick_db`.`brick_table` where name=?"); // 여기에 뭐넣을지
			preparedStatement.setString(1, name); //여기에 뭐넣을지
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				/* member.setUserid(rs.getInt("userid")); */
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setRecord(rs.getString("record"));
				member.setTrial(rs.getInt("try"));
				member.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}
	
	public member getUserPassWordById(String name) {
		member member = new member();
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from `brick_db`.`brick_table` where name=?"); // 여기에 뭐넣을지
			preparedStatement.setString(1, name); //여기에 뭐넣을지
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				/* member.setUserid(rs.getInt("userid")); */
				member.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}
	
	
	
	
	
}
