<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/taglib.jsp"%>
<%! int i;int j; %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <!-- Start Slider area -->
        <div class="slider-area brown__nav slider--15 slide__activation slide__arrow01 owl-carousel owl-theme">
        	<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--1 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	            		<div class="col-lg-12">
	            			<div class="slider__content">
		            			<div class="contentbox">
		            				<h2>Buy <span>your </span></h2>
		            				<h2>favourite <span>Book </span></h2>
		            				<h2>from <span>Here </span></h2>
				                   	<a class="shopbtn" href="<c:url value='/shop?page=1'/>">shop now</a>
		            			</div>
	            			</div>
	            		</div>
	            	</div>
	            </div>
            </div>
            <!-- End Single Slide -->
        	<!-- Start Single Slide -->
	        <div class="slide animation__style10 bg-image--7 fullscreen align__center--left">
	            <div class="container">
	            	<div class="row">
	            		<div class="col-lg-12">
	            			<div class="slider__content">
		            			<div class="contentbox">
		            				<h2>Buy <span>your </span></h2>
		            				<h2>favourite <span>Book </span></h2>
		            				<h2>from <span>Here </span></h2>
				                   	<a class="shopbtn" href="<c:url value='/shop?page=1'/>">shop now</a>
		            			</div>
	            			</div>
	            		</div>
	            	</div>
	            </div>
            </div>
            <!-- End Single Slide -->
        </div>
        <!-- End Slider area -->
		<!-- Start BEst Seller Area -->
		<section class="wn__product__area brown--color pt--80  pb--30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section__title text-center">
							<h2 class="title__be--2">SẢN PHẨM <span class="color--theme">MỚI</span></h2>
						</div>
					</div>
				</div>
				<!-- Start Single Tab Content -->
				<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
					<c:forEach var="item" items="${newBooks}">
						<div class="product product__style--3">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product__thumb">
								<a class="first__img" href="<c:url value='/shop-details?id=${item.id}'/>"><img src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}" alt="product image"></a>
								<a class="second__img animation1" href="<c:url value='/shop-details?id=${item.id}'/>"><img src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}" alt="product image"></a>
								<div class="hot__box">
									<span class="hot-label">BEST SALLER</span>
								</div>
							</div>
							<div class="product__content content--center">
								<h4><a href="single-product.html">${item.title}</a></h4>
								<ul class="prize d-flex">
									<li>${item.price}</li>
									<li class="old_prize">${item.price}</li>
								</ul>
								<div class="product__hover--content">
									<ul class="rating d-flex">
										<li class="on"><i class="fa fa-star-o"></i></li>
										<li class="on"><i class="fa fa-star-o"></i></li>
										<li class="on"><i class="fa fa-star-o"></i></li>
										<li><i class="fa fa-star-o"></i></li>
										<li><i class="fa fa-star-o"></i></li>
									</ul>
								</div>
							</div>				
						</div>
					</div>	
		
					</c:forEach>
				</div>
				<!-- End Single Tab Content -->
			</div>
		</section>
		<!-- Start BEst Seller Area -->
		<!-- Start NEwsletter Area -->
		<section class="wn__newsletter__area bg-image--2">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 offset-lg-5 col-md-12 col-12 ptb--150">
						<div class="section__title text-center">
							<h2>Stay With Us</h2>
						</div>
						<div class="newsletter__block text-center">
							<p>Nhập email để nhận được thông báo khi có các sản phẩm mới.</p>
							<form action="#">
								<div class="newsletter__box">
									<input type="email" placeholder="Enter your e-mail">
									<button>Subscribe</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End NEwsletter Area -->
		<!-- Start Best Seller Area -->
		<section class="wn__bestseller__area bg--white pt--80  pb--30">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section__title text-center">
							<h2 class="title__be--2">TẤT CẢ <span class="color--theme">SẢN PHẨM</span></h2>
						</div>
					</div>
				</div>
				<div class="row mt--50">
				</div>
				<div class="tab__container mt--60">
					<!-- Start Single Tab Content -->
					<div class="row single__tab tab-pane fade show active" id="nav-all" role="tabpanel">
						<div class="product__indicator--4 arrows_style owl-carousel owl-theme">
						<c:forEach var ="item" items="${bookList}">
							<div class="col-lg-3 col-md-4 col-sm-6 col-12">
										<div class="product product__style--3">
											<div class="product__thumb">
												<a class="first__img" href="/shop-details?id=${item.id}"><img src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}" alt="product image"></a>
												<a class="second__img animation1" href="/shop-details?id=${item.id}"><img src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}" alt="product image"></a>
											</div>
											<div class="product__content content--center content--center">
												<h4><a href="single-product.html">${item.title}</a></h4>
												<ul class="prize d-flex">
													<li>${item.price}</li>
													<li class="old_prize">${item.price}</li>
												</ul>
												<div class="product__hover--content">
													<ul class="rating d-flex">
														<li class="on"><i class="fa fa-star-o"></i></li>
														<li class="on"><i class="fa fa-star-o"></i></li>
														<li class="on"><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
						</c:forEach>
						
						</div>
					</div>
					<!-- End Single Tab Content -->
				</div>
				
		</section>
		<!-- Start BEst Seller Area -->
		<!-- Start Recent Post Area -->
		<section class="wn__recent__post bg--gray ptb--80">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section__title text-center">
							<h2 class="title__be--2">LỢI ÍCH CỦA VIỆC <span class="color--theme">ĐỌC SÁCH</span></h2>
						</div>
					</div>
				</div>
				<div class="row mt--50">
					<div class="col-md-6 col-lg-4 col-sm-12">
						<div class="post__itam">
							<div class="content">
								<h3><a href="blog-details.html">Thúc đẩy trí não</a></h3>
								<p>Các nghiên cứu khoa học đã chỉ ra rằng việc đọc thường xuyên sẽ giúp làm chậm quá trình não lão hóa, hạ thấp khả năng mắc chứng Alzheimer. Giống như bất kì bộ phận nào, não cần được hoạt động để luôn khỏe mạnh.</p>
								<div class="post__time">
									<span class="day">Dec 06, 18</span>
									<div class="post-meta">
										<ul>
											<li><a href="#"><i class="bi bi-love"></i>72</a></li>
											<li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-sm-12">
						<div class="post__itam">
							<div class="content">
								<h3><a href="blog-details.html">Giảm stress</a></h3>
								<p>Dù đang đối mặt vấn đề lớn cỡ nào trong công việc, tình yêu hay gia đình, chỉ cần mở trang sách người đọc sẽ ngay lập tức bước vào một thế giới khác. Một cuốn sách hay sẽ giúp bạn thư giãn và quên đi mọi muộn phiền trong cuộc sống. </p>
								<div class="post__time">
									<span class="day">Mar 08, 18</span>
									<div class="post-meta">
										<ul>
											<li><a href="#"><i class="bi bi-love"></i>72</a></li>
											<li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 col-sm-12">
						<div class="post__itam">
							<div class="content">
								<h3><a href="blog-details.html">Cung cấp kiến thức</a></h3>
								<p>Dù đọc chủ động hay bị động, những kiến thức đó chúng ta đều thu nạp ít hay nhiều. Sách cung cấp những tri thức có ích cho người đọc – một yếu tố góp phần hoàn thiện nhiều mặt trong cuộc sống như sự nghiệp, tài chính, sức khỏe…</p>
								<div class="post__time">
									<span class="day">Nov 11, 18</span>
									<div class="post-meta">
										<ul>
											<li><a href="#"><i class="bi bi-love"></i>72</a></li>
											<li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Recent Post Area -->
		
	
</body>
</html>