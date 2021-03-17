
package com.laptrinhweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhweb.entity.CheckoutEntity;

public interface CheckoutRepository extends JpaRepository<CheckoutEntity, Long> {

	@Query("Select checkoutCart FROM CheckoutEntity checkoutCart WHERE checkoutCart.userEntity1.id=:user_id")
	List<CheckoutEntity> getCheckoutCartByUserId(@Param("user_id") Long user_id);

	@Query("Select count(checkoutCart) FROM CheckoutEntity checkoutCart")
	int countCheckoutCart();
	
	@Query("Select checkoutCart FROM CheckoutEntity checkoutCart")
	List<CheckoutEntity> getAllCheckoutCart();
}
