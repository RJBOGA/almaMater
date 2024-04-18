package com.almaMater.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.almaMater.entities.Jobs;
import com.almaMater.utils.DbUtil;

public class JobDaoImpl implements JobDao {
	
	private static final String jdbc = "jdbc:mysql://localhost:3306/almaMater";
	private static final String jdbcusername = "root";
	private static final String jdbcpassword = "";

	static {
		try {
			final String driver = "com.mysql.cj.jdbc.Driver";
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public String createJob(Jobs postjob) {
		try (Connection connection = DbUtil.getConnection(jdbcusername, jdbcpassword)) {
			if (connection != null) {
				System.out.println("Connected to the database!");

				String query = "INSERT INTO jobs (jobId, profile, exp, description, techs, studentId, postedBy, datePosted) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, postjob.getJobId());
				preparedStatement.setString(2, postjob.getProfile());
				preparedStatement.setInt(3, postjob.getExp());
				preparedStatement.setString(4, postjob.getDesc());
				preparedStatement.setString(5, postjob.getTechs());
				preparedStatement.setInt(6, postjob.getStudentId());
				preparedStatement.setString(7, postjob.getContact());
				preparedStatement.setObject(8, postjob.getDatePosted());

				int rows = preparedStatement.executeUpdate();
				System.out.println(rows);
				return String.valueOf(rows);
			} else {
				System.out.println("Failed to make connection!");
				return "Failed to connect to database";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Error occurred while posting job: " + e.getMessage();
		}
	}

	@Override
	public List<Jobs> getAllJobs() {
		String selectaAll = "SELECT * FROM jobs";
		List<Jobs> jobsList = new ArrayList<>();
		try (Connection connection = DbUtil.getConnection(jdbcusername, jdbcpassword);
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery(selectaAll)) {

			while (resultSet.next()) {
				Jobs job = mapResultSetToJob(resultSet);
				jobsList.add(job);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jobsList;
	}

	private Jobs mapResultSetToJob(ResultSet resultSet) throws SQLException {
		Jobs job = new Jobs();
		job.setJobId(resultSet.getInt("jobId"));
		job.setProfile(resultSet.getString("profile"));
		job.setDesc(resultSet.getString("description"));
		job.setExp(resultSet.getInt("exp"));
		job.setStudentId(resultSet.getInt("studentId"));
		job.setTechs(resultSet.getString("techs"));
		job.setContact(resultSet.getString("postedBy"));
		job.setDatePosted(convertStringToDate(resultSet.getString("datePosted")));
		return job;
	}

	private static LocalDate convertStringToDate(String dateString) {
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		return LocalDate.parse(dateString, dateFormatter);
	}

	@Override
	public boolean deleteJob(int studentId, int jobId) {
		String delete = "DELETE FROM jobs WHERE studentId = ? AND jobId = ?";
		try (Connection connection = DbUtil.getConnection(jdbcusername, jdbcpassword);
				PreparedStatement statement = connection.prepareStatement(delete)) {

			statement.setInt(1, studentId);
			statement.setInt(2, jobId);
			int rowsDeleted = statement.executeUpdate();
			return rowsDeleted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Jobs> getJobsOfUser(int userId) {
		String getJobs = "SELECT * FROM jobs WHERE studentId = ?";
		List<Jobs> jobsList = new ArrayList<>();
		try (Connection connection = DbUtil.getConnection(jdbcusername, jdbcpassword);
				PreparedStatement statement = connection.prepareStatement(getJobs)) {

			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Jobs job = mapResultSetToJob(resultSet);
				jobsList.add(job);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jobsList;
	}

}
