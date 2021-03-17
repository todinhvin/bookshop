package com.laptrinhweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {

	@Column
	private String name;
	
	@Column
	private String code;

	@OneToMany(fetch = FetchType.LAZY,mappedBy ="category")
	private List<BookEntity> bookList = new ArrayList<>();
	
	public List<BookEntity> getBookList() {
		return bookList;
	}

	public void setBookList(List<BookEntity> bookList) {
		this.bookList = bookList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
}


