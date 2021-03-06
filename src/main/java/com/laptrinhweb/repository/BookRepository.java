package com.laptrinhweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhweb.entity.BookEntity;

public interface BookRepository extends JpaRepository<BookEntity, Long> {
	public BookEntity save(BookEntity entity);

	public BookEntity findOneById(Long id);

	public void delete(BookEntity entity);

	@Query("SELECT count(book) FROM BookEntity book ")
	public int getCountBook();

	@Query(value="SELECT * FROM book LIMIT :limit OFFSET :offset", nativeQuery=true)
	public List<BookEntity> getNewBooks(@Param("limit") int limit, @Param("offset") int offset);
	
	@Query("SELECT count(book) FROM BookEntity book WHERE book.category.code =:categoryCode ")
	public int getCountBookByCategory(@Param("categoryCode")String categoryCode);
	
	@Query(value="SELECT * FROM book WHERE book.categoryid=:categoryid LIMIT :limit OFFSET :offset", nativeQuery=true)
	public List<BookEntity> getBooksByCategoryCode(@Param("limit") int limit, @Param("offset") int offset,@Param("categoryid")Long categoryid);
}
