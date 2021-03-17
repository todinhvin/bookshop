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

	<div class="content p-4" style="height: auto !important;">
		
		<form:form id="formSubmit" action="/quan-tri/danh-sach?page=${book.page}&limit=${book.limit}" modelAttribute="book" method="get">

			<h2 class="mb-4">Datatables</h2>
			<c:if test ="${not empty arlet}">
                <div class="alert alert-${arlet}" role="alert">
  						${message}
				</div>
             </c:if>
			<div class="card mb-4">
				<div class="card-body">
					<div id="example_wrapper"
						class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="dataTables_length" id="example_length">
									<label>Show <select name="example_length"
										aria-controls="example" class="form-control form-control-sm"><option
												value="5">5</option>
											<option value="10">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option>
											<option value="250">250</option>
											<option value="500">500</option></select> entries
									</label>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div id="example_filter" class="dataTables_filter">
									<label><input type="search"
										class="form-control form-control-sm" placeholder="Search"
										aria-controls="example"></label>
									<button type="button"
										class="btn btn-link btn-sm btn-icon ml-2 mb-1"
										data-toggle="tooltip" title="Search">
										<i class="fa fa-fw fa-search"></i>
									</button>
									<button type="button" class="btn btn-link btn-sm btn-icon mb-1"
										data-toggle="tooltip" title="Reset">
										<i class="fa fa-fw fa-undo"></i>
									</button>
									<button type="button" class="btn btn-link btn-sm btn-icon mb-1"
										data-toggle="tooltip" title="Add">
										<a href ="<c:url value ='/quan-tri/chinh-sua'/>">
											<i class="fas fa-plus"></i>
										</a>
									</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="example"
									class="table table-hover dataTable no-footer dtr-inline"
									cellspacing="0" width="100%" role="grid"
									aria-describedby="example_info" style="width: 100%;">
									<thead>
										<tr role="row">
											<th class="sorting_desc" tabindex="0" aria-controls="example"
												rowspan="1" colspan="1" style="width: 160.5px;"
												aria-sort="descending"
												aria-label="Name: activate to sort column ascending">Title</th>
											<th class="sorting" tabindex="0" aria-controls="example"
												rowspan="1" colspan="1" style="width: 249.5px;"
												aria-label="Position: activate to sort column ascending">Thumbnail</th>
											<th class="sorting" tabindex="0" aria-controls="example"
												rowspan="1" colspan="1" style="width: 115.5px;"
												aria-label="Office: activate to sort column ascending">Content</th>
											<th class="sorting" tabindex="0" aria-controls="example"
												rowspan="1" colspan="1" style="width: 91.5px;"
												aria-label="Salary: activate to sort column ascending">Price</th>
											<th class="actions sorting_disabled" rowspan="1" colspan="1"
												style="width: 118px;" aria-label="Actions">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var ="item" items= "${book.list}">
											<tr role="row" class="odd">
												<td tabindex="0" class="sorting_1">${item.title}</td>
												<td><img width ="150px" height = "100px" src="${pageContent.request.contextPath}/thumbnail/${item.thumbnail}"></td>
												<td>${item.content}</td>
												<td>${item.price}</td>
												<td class=" actions"><a href="<c:url value ='/quan-tri/chinh-sua?id=${item.id}'/>" class="btn btn-icon btn-pill btn-primary" data-toggle="tooltip" title="Edit"> <i class="fa fa-fw fa-edit"></i></a> 
												<button type = "button" id ="btnDelete"  value = "${item.id}" class="btn btn-icon btn-pill btn-danger" onclick="warningDelete()">
													<i class="fa fa-fw fa-trash"></i>
												</button>
												
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div id="example_processing" class="dataTables_processing card"
									style="display: none;">Processing...</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="dataTables_info" id="example_info" role="status"
									aria-live="polite">Showing 1 to 50 of 57 entries</div>
							</div>
							<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="example_paginate"></div>
									<ul class="pagination" id="pagination" style= "float:right;"></ul>
									<input type="hidden" id="page" value="" name="page" /> 
									<input type="hidden" id="limit" value="" name="limit" />
							</div>
						</div>
					</div>
					
				</div>

			</div>
		</form:form>
	</div>

	<script type="text/javascript">
		$(function() {
			var currentPage = ${book.page};
			var totalPages = ${book.totalPages};
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				startPage : currentPage,
				visiblePages : 10,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#page').val(page);
						$('#limit').val(10);
						$('#formSubmit').submit();
					}
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
		
		function warningDelete(){
			var id =$('#btnDelete').val();
			swal({
				  title: "Bạn có muốn xóa không?",
				  text: "Bạn sẽ không thể khôi phục lại dữ liệu đã xóa!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "Yes, delete it!",
				  cancelButtonText: "No, cancel plx!",
				  closeOnConfirm: false,
				  closeOnCancel: false
				}).then(function(isConfirm) {
					if (isConfirm.value==true) {
						window.location.href ="/quan-tri/xoa-bai-viet?id="+id;
					}
				});
				
		}
	</script>
</body>
</html>