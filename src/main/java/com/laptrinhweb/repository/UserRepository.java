package com.laptrinhweb.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhweb.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

	UserEntity findOneByUserNameAndStatus(String username, Integer status);

	@Query("Select user FROM UserEntity user WHERE user.email =:email OR user.userName=:username")
	Optional<UserEntity> checkAccountExists(@Param("email") String email, @Param("username") String username);
}
