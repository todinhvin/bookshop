<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="d-flex" style="height: auto !important;">
      

        <div class="content p-4" style="height: auto !important;">
        		        	
        	
                <h2 class="mb-4">Dashboard</h2>

    <div class="row mb-4" >
        <div class="col-md" style="margin-right:100px;">
            <div class="d-flex border">
                <div class="bg-danger text-light p-4">
                    <div class="d-flex align-items-center h-100">
                        <i class="fa fa-3x fa-fw fa-shopping-cart"></i>
                    </div>
                </div>
                <div class="flex-grow-1 bg-white p-4">
                    <p class="text-uppercase text-secondary mb-0">Số đơn hàng</p>
                    <h3 class="font-weight-bold mb-0">${totalOrder}</h3>
                </div>
            </div>
        </div>
    <div class="card">
        <div class="card-header bg-white font-weight-bold">
            Đơn hàng
        </div>
        <div class="card-body">

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">ID đơn hàng</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Người mua</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Số điện thoại</th>
                </tr>
                </thead>
                <tbody>
                	<c:forEach var="item" items ="${checkoutList}">
                	<tr>
                    	<td><a href="#">${item.order_id}</a></td>
                   		<td>${item.bookDTO.title}</td>
                    	<td>${item.userDTO.fullName}</td>
                    	<td>${item.delivery_address}</td>
                    	<td>${item.userDTO.phoneNumber}</td>
               		</tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
        </div>
    </div>
</body>
</html>