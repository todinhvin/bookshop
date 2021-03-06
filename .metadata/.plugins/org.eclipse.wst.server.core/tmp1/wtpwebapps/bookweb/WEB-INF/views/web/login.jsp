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
     <%--    <c:if test ="${param.incorrectAccount!=null}">
                                 	  <div class="alert alert-danger" role="alert">
  											Tài khoản hoặc mật khẩu không đúng
										</div>
                                 </c:if>
                                 <c:if test ="${param.accessDenied!=null}">
                                 	  <div class="alert alert-danger" role="alert">
  											Không được phép truy cập
										</div>
                                 </c:if> --%>
        
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
							<h3 class="account__title">Login</h3>
							<c:if test ="${param.incorrectAccount!=null}">
                                 	  <div class="alert alert-danger" role="alert">
  											Tài khoản hoặc mật khẩu không đúng
										</div>
                                 </c:if>
                                 <c:if test ="${param.accessDenied!=null}">
                                 	  <div class="alert alert-danger" role="alert">
  											Không được phép truy cập
										</div>
                                 </c:if>
                                 <c:if test ="${not empty arlet}">
               				 <div class="alert alert-${arlet}" role="alert">
  								${message}
						</div>
            				 </c:if>
							<form action="j_security_check" method="post">
								<div class="account__form">
									<div class="input__box">
										<label>Username <span>*</span></label>
										<input type="text" id="name" name="j_username" value="">
									</div>
									<div class="input__box">
										<label>Password<span>*</span></label>
										<input type="password" id="password" name="j_password" value="">
									</div>
									<div class="form__btn">
										<button type="submit" value="">Login</button>
										<label class="label-for-checkbox">
											<input id="rememberme" class="input-checkbox" name="rememberme" value="forever" type="checkbox">
											<span>Remember me</span>
										</label>
									</div>
									<a class="forget_pass" href="/dang-ky">Register Account</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>