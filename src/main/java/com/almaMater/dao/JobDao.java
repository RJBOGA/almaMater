package com.almaMater.dao;

import java.util.List;

import com.almaMater.entities.Jobs;

public interface JobDao {
	
	public String createJob(Jobs postjob);

	public List<Jobs> getAllJobs();

	public boolean deleteJob(int studentId, int jobId);
	
	public List<Jobs> getJobsOfUser(int userId);

}
