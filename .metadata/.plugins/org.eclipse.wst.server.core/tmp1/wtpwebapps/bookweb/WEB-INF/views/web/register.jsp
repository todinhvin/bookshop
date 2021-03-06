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
        <div class="ht__bradcaump__area bg-image--6">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">My Account</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">My Account</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
		<!-- Start My Account Area -->
		<section class="my_account_area pt--80 pb--55 bg--white">
			<div class="container">
				<div class="row" style="position: relative;">
					<div class="col-lg-6 col-12" style="top:50%;left:25%;">
						<div class="my__account__wrapper">
							<h3 class="account__title">Register</h3>
							 <c:if test ="${not empty arlet}">
               				 <div class="alert alert-${arlet}" role="alert">
  								${message}
						</div>
            				 </c:if>
							<form action="<c:url value='/api/register'/>" id="formSubmit">
								<div class="account__form">
									<div class="input__box">
										<label>Họ tên <span>*</span></label>
										<input type="text"  name="fullname">
									</div>
									<div class="input__box">
										<label>Username <span>*</span></label>
										<input type="text"  name="username">
									</div>
									<div class="input__box">
										<label>Password<span>*</span></label>
										<input type="password" name="password">
									</div>
									<div class="input__box">
										<label>Email address <span>*</span></label>
										<input type="email"  name="email">
									</div>
									<div class="input__box">
										<label>Phone number <span>*</span></label>
										<input type="text" name="phone_number">
									</div>
									<div class="form__btn " id="btnRegister">
										<button>Register</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#btnRegister').click(function(e){
					 e.preventDefault();
					 var data = {};
					 var formData = $('#formSubmit').serializeArray();
					 $.each(formData, function (i, v) {
				            data[""+v.name+""] = v.value;
				     });
					 register(data);
				})
			})
			
			function register(data){
				$.ajax({
            		url : "/api/register",
            		type:'POST',
    				dataType : 'json',
            		contentType: 'application/json',
            		data : JSON.stringify(data),
            		success : function(){
            			window.location.href = "/dang-nhap?message=registerSuccess";
            		},
            		error : function(){
            			window.location.href = "/dang-ky?message=registerError";
            		}
				})
			}
		</script>
</body>
</html>