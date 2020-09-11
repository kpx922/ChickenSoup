package com.wtlc.AIFire.beans;

public class WorkLogsBean {

	private String subject;
	private String date;
	private String comments;
	private String supervisor;
	private String worker;
	
	@Override
	public String toString() {
		return "WorkLogsBean [subject=" + subject + ", date=" + date + ", comments=" + comments + ", supervisor="
				+ supervisor + ", worker=" + worker + "]";
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}
	public String getWorker() {
		return worker;
	}
	public void setWorker(String worker) {
		this.worker = worker;
	}
	
	

}
