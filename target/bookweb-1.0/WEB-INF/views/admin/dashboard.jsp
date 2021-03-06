<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <div class="row mb-4">
        <div class="col-md">
            <div class="d-flex border">
                <div class="bg-danger text-light p-4">
                    <div class="d-flex align-items-center h-100">
                        <i class="fa fa-3x fa-fw fa-shopping-cart"></i>
                    </div>
                </div>
                <div class="flex-grow-1 bg-white p-4">
                    <p class="text-uppercase text-secondary mb-0">Sales</p>
                    <h3 class="font-weight-bold mb-0">73,829</h3>
                </div>
            </div>
        </div>
    <div class="card">
        <div class="card-header bg-white font-weight-bold">
            Recent Orders
        </div>
        <div class="card-body">

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Item</th>
                    <th scope="col">Customer</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><a href="#">00000077</a></td>
                    <td>Praesent eu viverra leo</td>
                    <td>Kevin Dion</td>
                    <td><span class="badge badge-success">Shipped</span></td>
                </tr>
                <tr>
                    <td><a href="#">00000078</a></td>
                    <td>Lorem ipsum dolor</td>
                    <td>Mark Otto</td>
                    <td><span class="badge badge-success">Shipped</span></td>
                </tr>
                <tr>
                    <td><a href="#">00000079</a></td>
                    <td>Etiam eleifend elit</td>
                    <td>Jacob Thornton</td>
                    <td><span class="badge badge-info">Packaging</span></td>
                </tr>
                <tr>
                    <td><a href="#">00000080</a></td>
                    <td>Donec vitae ante egestas</td>
                    <td>Larry the Bird</td>
                    <td><span class="badge badge-secondary">Back Ordered</span></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
        </div>
    </div>
</body>
</html>