package com.boot.jdbc.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaDto {
	private Integer qna_no;
	private String user_id;
	private String qna_type;
	private String qna_title;
	private Date qna_date;
	private String qna_content;
	private MultipartFile qna_file;
	private String qna_filepath;
	
	public QnaDto() {}

	public QnaDto(Integer qna_no, String user_id, String qna_type, String qna_title, Date qna_date, String qna_content,
			MultipartFile qna_file, String qna_filepath) {
		super();
		this.qna_no = qna_no;
		this.user_id = user_id;
		this.qna_type = qna_type;
		this.qna_title = qna_title;
		this.qna_date = qna_date;
		this.qna_content = qna_content;
		this.qna_file = qna_file;
		this.qna_filepath = qna_filepath;
	}

	public Integer getQna_no() {
		return qna_no;
	}

	public void setQna_no(Integer qna_no) {
		this.qna_no = qna_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQna_type() {
		return qna_type;
	}

	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public MultipartFile getQna_file() {
		return qna_file;
	}

	public void setQna_file(MultipartFile qna_file) {
		this.qna_file = qna_file;
	}

	public String getQna_filepath() {
		return qna_filepath;
	}

	public void setQna_filepath(String qna_filepath) {
		this.qna_filepath = qna_filepath;
	};
	
	
	
}
