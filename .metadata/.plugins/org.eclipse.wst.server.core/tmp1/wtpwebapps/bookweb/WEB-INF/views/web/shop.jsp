<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>

	<c:choose> 
		<c:when test="${not empty theloai }"> 
			<c:set var ="shopURL" value="/shop?page=${book.page}&theloai=${theloai}"> </c:set>
		</c:when>
		<c:when test="${empty theloai }"> 
			<c:set var ="shopURL" value="/shop?page=${book.page}"> </c:set>
		</c:when>
	</c:choose>
			<form:form id="formSubmit" action="${shopURL}" modelAttribute="book" method="get">
  <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--6">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Shop Grid</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Shop Grid</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Shop Page -->
        <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
        				<div class="shop__sidebar">
        					<aside class="wedget__categories poroduct--cat">
        						<h3 class="wedget__title">Product Categories</h3>
        						<ul>
        							<li><a href="<c:url value='/shop?page=1'/>">Tất cả <span></span></a></li>
        							<c:forEach var="entry" items="${category}">
        								<li><a href="<c:url value='/shop?page=1&theloai=${entry.key.code}'/>">${entry.key.name} <span>(${entry.value})</span></a></li>
        							</c:forEach>
        						</ul>
        					</aside>
        			<!-- 		<aside class="wedget__categories pro--range">
        						<h3 class="wedget__title">Filter by price</h3>
        						<div class="content-shopby">
        						    <div class="price_filter s-filter clear">
        						        <form action="#" method="GET">
        						            <div id="slider-range"></div>
        						            <div class="slider__range--output">
        						                <div class="price__output--wrap">
        						                    <div class="price--output">
        						                        <span>Price :</span><input type="text" id="amount" readonly="">
        						                    </div>
        						                    <div class="price--filter">
        						                        <a href="#">Filter</a>
        						                    </div>
        						                </div>
        						            </div>
        						        </form>
        						    </div>
        						</div>
        					</aside> -->
        				</div>
        			</div>
        			<div class="col-lg-9 col-12 order-1 order-lg-2">
        				
        				<div class="tab__container">
	        				<div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
	        					<div class="row">
									<c:forEach var="item" items="${book.list}">
										<!-- Start Single Product -->
										<div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product__thumb">
												<a class="first__img" href="<c:url value='/shop-details?id=${item.id}'/>"><img src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}" alt="product image"></a>
												<a class="second__img animation1" href="<c:url value='/shop-details?id=${item.id}'/>"><img src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}" alt="product image"></a>
											</div>
											<div class="product__content content--center">
												<h4><a href="single-product.html">${item.title}</a></h4>
												<ul class="prize d-flex">
													<li>${item.price}</li>
													<li class="old_prize">${item.price}</li>
												</ul>
												<div class="action">
													<div class="actions_inner">
														<ul class="add_to_links">
															<li><a class="wishlist" id="btnAddCart${item.id}" href=""><i class="bi bi-shopping-cart-full"></i></a></li>
															<li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#productmodal"><i class="bi bi-search"></i></a></li>
														</ul>
													</div>
												</div>
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
										<!-- End Single Product -->
										<script>
        	$(document).ready(function(){
        		$('#btnAddCart${item.id}').click(function(e){
        			e.preventDefault();
        			var formData  = new FormData();
        			formData.append('book_id',${item.id});
        			formData.append('quantity',1);
        			formData.append('price',${item.price});
        		
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
        					swal("", "Thêm vào giỏ hàng thành công", "success");
        				},
        				error : function(){
        				
        				}
        			})
        		}
        	})

        </script>
									</c:forEach>
	        						
	        					</div>
	        					<!-- <ul class="wn__pagination">
	        						<li class="active"><a href="#">1</a></li>
	        						<li><a href="#">2</a></li>
	        						<li><a href="#">3</a></li>
	        						<li><a href="#">4</a></li>
	        						<li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
	        					</ul> -->
	        					<ul class="pagination" id="pagination"  style="justify-content: center;"></ul>
	        					<input type="hidden" id="page" value="" name="page" /> 
	        					<c:if test="${not empty theloai }">
	        						<input type="hidden" id="theloai" value="${theloai}" name="theloai" /> 
	        					</c:if>
	        				</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        </form:form>
       <script type="text/javascript">
    $(function () {
    	var currentPage = ${book.page};
		var totalPages = ${book.totalPages};

        window.pagObj = $('#pagination').twbsPagination({
        	totalPages : totalPages,
			startPage : currentPage,
			visiblePages : 10,
            onPageClick: function (event, page) {
            	if (currentPage != page) {
            		$('#theloai').val();
					$('#page').val(page);
					$('#formSubmit').submit();
				}
            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });
</script>
        

</body>

</html>