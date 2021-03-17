package com.laptrinhweb.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private long id;
	
	@CreatedDate
	@Column(name="createddate")
	private Date createdDate;
	
	@CreatedBy
	@Column(name="createdby")
	private String createdBy;
	
	@LastModifiedDate
	@Column(name = "modifieddate")
	private Date  modifiedDate;
	
	@LastModifiedBy
	@Column(name ="modifiedby")
	private String modifiedby;

	public long getId() {
		return id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public String getModifiedby() {
		return modifiedby;
	}
}
