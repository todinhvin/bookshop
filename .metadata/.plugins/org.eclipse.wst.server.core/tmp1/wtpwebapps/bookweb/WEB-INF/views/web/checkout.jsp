<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.laptrinhweb.util.SecurityUtils" %>
<%@include file ="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Checkout</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Checkout</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Checkout Area -->
        <section class="wn__checkout__area section-padding--lg bg__white">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-6 col-12">
        				<div class="customer_details">
        					<h3>Billing details</h3>
        					<div class="customar__field">
        						<div class="input_box">
        							<label>Address <span></span></label>
        							<input id="address" type="text" placeholder="Street address">
        						</div>
        						<div class="input_box">
        							<label>Note <span>*</span></label>
        							<textarea id="note"  type="text" placeholder="Note address" style="height: 300px;width: 600px;"></textarea>
        						</div>
								
        					</div>
        					
        				</div>
        				
        			</div>
        			<div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
        				<div class="wn__order__box">
        					<h3 class="onder__title">Your order</h3>
        					<ul class="order__total">
        						<li>Product</li>
        						<li>Total</li>
        					</ul>
        					<ul class="order_product">
        					<c:forEach var="entry" items="${myCart}">
        						<tr>
                                    <li>${entry.value.bookDTO.title}x${entry.value.quantity} <span>${entry.value.quantity*entry.value.price}</span></li>
                                 </tr>
        					</c:forEach>	
        					</ul>
        					<ul class="total__amount">
        						<li>Order Total <span>${totalPrice}??</span></li>
        					</ul>
        				</div>
					    <div id="accordion" class="checkout_accordion mt--30" role="tablist">
						    <div class="payment">
						        <div class="che__header" role="tab" id="headingOne" >
						          	<a id="btnCheckout" class="checkout__title" href="#" style="background-color: orangered;color: #fff;text-align: center;">
						                <span >Mua h??ng</span>
						          	</a>
						        </div>
						       
						    </div>
						  
					    </div>

        			</div>
        		</div>
        	</div>
        </section>
        <!-- End Checkout Area -->
        <script>
        $(document).ready(function(){
    		$('#btnCheckout').click(function(e){
    			e.preventDefault();
    			var formData  = new FormData();
    			formData.append('deliveryAddress',$('#address').val());
    			formData.append('note',$('#note').val());
    			var data={};
    	        for(var item of formData.entries()){
    	            data[""+item[0]+""] =item[1];
    	        }
    	        addCheckout(data);
    		})
    		
    		function addCheckout(data){
    			$.ajax({
    				url:'/api/order/checkout_order',
    				type:'POST',
    				dataType : 'json',
            		contentType: 'application/json',
    				data : JSON.stringify(data),
    				success: function(){
    					swal("", "?????t h??ng th??nh c??ng", "success");
    					setTimeout(redirect,1500);
    				},
    				error : function(){
    					swal("", "?????t h??ng kh??ng th??nh c??ng", "error");
    				}
    			})
    		}
    		function redirect(){
    			window.location.href = "/shop?page=1";
    		}
    	})

        </script>
</body>
</html>