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
      <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Shopping Cart</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Shopping Cart</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="cart-main-area section-padding--lg bg--white">
            <div id="cart" class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <form action="#">               
                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="entry" items="${myCart}">
        								 <tr class="cart-${entry.key}">
                                            <td class="product-thumbnail"><a href="#"><img src="${pageContent.request.contextPath}/thumbnail/${entry.value.bookDTO.thumbnail}" alt="product img"></a></td>
                                            <td class="product-name"><a href="#">${entry.value.bookDTO.title}</a></td>
                                            <td class="product-price"><span class="amount">${entry.value.bookDTO.price}</span></td>
                                            <td class="product-quantity"><input id="btnQuantity${entry.key}" type="number" value="${entry.value.quantity}"></td>
                                             <td class="product-remove"><button onclick="handleDeleteCart(${entry.key})">X</button></td>
                                        </tr>
                                        <script>
        		$('#btnQuantity${entry.key}').change(function(e){
        			e.preventDefault();
        			var formData  = new FormData();
        			formData.append('book_id',${entry.key});
        			formData.append('quantity',$('#btnQuantity${entry.key}').val());
        			formData.append('price',${entry.value.bookDTO.price});
        		
        			var data={};
        	        for(var item of formData.entries()){
        	            data[""+item[0]+""] =item[1];
        	        }
        	        addCart(data);
        	        getCart();
        		})
        		
        		function addCart(data){
        			$.ajax({
        				url:'/api/addCart',
        				type:'POST',
        				dataType : 'json',
                		contentType: 'application/json',
        				data : JSON.stringify(data),
        				success: function(){
        					swal("", "", "success");
        				},
        				error : function(){
        				
        				}
        			})
        		}
        </script>
        							</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </form> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 offset-lg-6">
                        <div class="cartbox__total__area">
                            <a href="/checkout-cart" class="cart__total__amount" style="justify-content:center">
                                <span style="">?????t h??ng</span>  
                            </a>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <!-- cart-main-area end -->
        <script>
		var removeCartURL= "http://localhost:8080/api/removeCart";
		var getCartURL ="http://localhost:8080/cart"
	function handleDeleteCart(id){
		var options = {
				method:'DELETE',
				headers:{
					'Content-Type' :'application/json'
				},
		};
		fetch(removeCartURL+'/'+id,options)
			.then(function(response){
				response.json();
			})
			.then(function(){
				var cartItem =document.querySelector('.cart-'+id);
				if(cartItem){
					cartItem.remove();
				}
			});
	}
	
	
	</script>
</body>
</html>