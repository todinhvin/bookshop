/*
 * package com.laptrinhweb.repository;
 * 
 * import java.util.List; import java.util.Optional;
 * 
 * import javax.transaction.Transactional;
 * 
 * import org.springframework.data.jpa.repository.JpaRepository; import
 * org.springframework.data.jpa.repository.Modifying; import
 * org.springframework.data.jpa.repository.Query; import
 * org.springframework.data.repository.query.Param;
 * 
 * import com.laptrinhweb.entity.CartEntity;
 * 
 * public interface CartRepository extends JpaRepository<CartEntity, Long>{
 * 
 * @Query("Select cart FROM CartEntity cart WHERE cart.userEntity.id=:user_id")
 * List<CartEntity> getCartByUserId(@Param("user_id") Long user_id);
 * 
 * @Query("Select cart FROM CartEntity cart WHERE cart.book_id =:product_id AND cart.userEntity.id=:user_id"
 * ) Optional<CartEntity> getCartByUserIdAndProductId(@Param("user_id") Long
 * user_id,@Param("product_id") Long product_id);
 * 
 * @Query("Select cart FROM CartEntity cart WHERE cart.book_id =:product_id AND cart.userEntity.id=:user_id"
 * ) CartEntity getcartByUserIdAndProductId(@Param("user_id") Long
 * user_id,@Param("product_id") Long product_id);
 * 
 * @Modifying
 * 
 * @Transactional
 * 
 * @Query("DELETE FROM CartEntity cart WHERE cart.id=:cart_id AND cart.userEntity.id=:user_id"
 * ) void deleteCartByIdAndUserId(@Param("user_id") Long
 * user_id,@Param("cart_id") Long cart_id);
 * 
 * @Modifying
 * 
 * @Transactional
 * 
 * @Query("DELETE FROM CartEntity cart WHERE cart.userEntity.id=:user_id") void
 * deleteAllCartByUserId(@Param("user_id") Long user_id); }
 */