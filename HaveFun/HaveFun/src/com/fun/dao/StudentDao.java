package com.fun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fun.pojo.Student;
import com.fun.util.DBUtil;

public class StudentDao {

	public List<Student> listStudent() {
		String sql = "SELECT student.id,student.`name` FROM student";
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		List<Student> studentList = new ArrayList<>();
		try {
			conn = DBUtil.getConn();
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while (rs.next()) {
				Student student = new Student(rs.getInt(1), rs.getString(2));
				studentList.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (ptmt != null) {
						try {
							ptmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							if (conn != null) {
								try {
									conn.close();
								} catch (SQLException e) {
									e.printStackTrace();
								}
							}
						}
					}
				}
			}
		}
		return studentList;
	}

	public int deleteById(Integer id) {
		String sql = "delete from student where id=?";
		Connection conn = null;
		PreparedStatement ptmt = null;
		int result = 0;
		try {
			conn = DBUtil.getConn();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id);
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		return result;
	}

}
