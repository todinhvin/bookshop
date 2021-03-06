<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.laptrinhweb.util.SecurityUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Watch Shop</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End-->
        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4">
                <div class="product_img_slide owl-carousel owl-loaded owl-drag">
                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-2070px, 0px, 0px); transition: all 0.25s ease 0s; width: 4830px;"><div class="owl-item cloned" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div><div class="owl-item cloned" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div><div class="owl-item" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div><div class="owl-item active" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div><div class="owl-item" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div><div class="owl-item cloned" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div><div class="owl-item cloned" style="width: 690px;"><div class="single_product_img">
                        <img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt="#" class="img-fluid">
                    </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"> <i class="ti-angle-left"></i> </button><button type="button" role="presentation" class="owl-next"><i class="ti-angle-right"></i> </button></div><div class="owl-dots disabled"></div></div>
                </div>
                <div class="col-lg-8">
                <div class="single_product_text text-center" style ="margin:0">
                    <h3>${book.title}</h3>
                    <p>
                       ${book.content}
                    </p>
                </div>
                </div>
                <div class="col-lg-12">
                	<div class="card_area" style = "float:left;">
                        <div class="product_count_area">
                            <p>Quantity</p>
                            <div class="product_count d-inline-block">
                                <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
                                <input class="product_count_item input-number" id ="quantity" type="text" value="1" min="0" max="10">
                                <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
                            </div>
                            <p>$5</p>
                        </div>
                    <div class="add_to_cart" id="btnAddCart" style="margin-top:3rem">
                        <a href="" class="btn_3">add to cart</a>
                    </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->
        
         --%>
        
        
         <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Shop Single</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Shop Single</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start main Content -->
        <div class="maincontent bg--white pt--80 pb--55">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-10 col-12">
        				<div class="wn__single__product">
        					<div class="row">
        						<div class="col-lg-6 col-12">
        							<div class="wn__fotorama__wrapper">
		        						<a href="1.jpg"><img src="${pageContent.request.contextPath}/thumbnail/${book.thumbnail}" alt=""></a>
        							</div>
        						</div>
        						<div class="col-lg-6 col-12">
        							<div class="product__info__main">
        								<h1>${book.title}</h1>
        								<div class="product-reviews-summary d-flex">
        									<ul class="rating-summary d-flex">
    											<li><i class="zmdi zmdi-star-outline"></i></li>
    											<li><i class="zmdi zmdi-star-outline"></i></li>
    											<li><i class="zmdi zmdi-star-outline"></i></li>
    											<li class="off"><i class="zmdi zmdi-star-outline"></i></li>
    											<li class="off"><i class="zmdi zmdi-star-outline"></i></li>
        									</ul>
        								</div>
        								<div class="price-box">
        									<span>${book.price}</span>
        								</div>
										<div class="product__overview">
        									<p>${book.content}</p>
        								</div>
        								<div class="box-tocart d-flex">
        									<span>Qty</span>
        									<input id="quantity" class="input-text qty" name="qty" min="1" value="1" title="Qty" type="number">
        									<div class="addtocart__actions">
        										<button id="btnAddCart" class="tocart" type="submit" title="Add to Cart">Add to Cart</button>
        									</div>
											<div class="product-addto-links clearfix">
												<a class="wishlist" href="#"></a>
												<a class="compare" href="#"></a>
											</div>
        								</div>
										<div class="product_meta">
											<span class="posted_in">Categories: 
												<a href="#">Adventure</a>, 
												<a href="#">Kids' Music</a>
											</span>
										</div>
										<div class="product-share">
											<ul>
												<li class="categories-title">Share :</li>
												<li>
													<a href="#">
														<i class="icon-social-twitter icons"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="icon-social-tumblr icons"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="icon-social-facebook icons"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="icon-social-linkedin icons"></i>
													</a>
												</li>
											</ul>
										</div>
        							</div>
        						</div>
        					</div>
        				</div>
        			</div>
        			
        		</div>
        	</div>
        </div>
        <!-- End main Content -->
        <script>
        	$(document).ready(function(){
        		$('#btnAddCart').click(function(e){
        			e.preventDefault();
        			var formData  = new FormData();
        			formData.append('book_id',${book.id});
        			formData.append('quantity',$('#quantity').val());
        			formData.append('price',${book.price});
        		
        			var data={};
        	        for(var item of formData.entries()){
        	            data[""+item[0]+""] =item[1];
        	        }
        	        addCart(data);
        	        
        		})
        		
        		function addCart(data){
        			$.ajax({
        				url:'/api/addCart',
        				type:'POST',
        				dataType : 'json',
                		contentType: 'application/json',
        				data : JSON.stringify(data),
        				success: function(){
        					swal("", "Th??m v??o gi??? h??ng th??nh c??ng", "success");
        				},
        				error : function(){
        				
        				}
        			})
        		}
        	})

        </script>
</body>
</html>