<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/taglib.jsp" %>
<c:url var = "imageURL" value ="/api/image"/>
<c:url var = "BookURL" value ="/api/book"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<div class="card" style="width : 60%;height : 50%">
			 <c:if test ="${not empty arlet}">
                <div class="alert alert-${arlet}" role="alert">
  						${message}
				</div>
             </c:if>
		<form:form id ="formSubmit" modelAttribute="book" enctype="multipart/form-data">
        <div class="card-header bg-white font-weight-bold">
            Input Groups
        </div>
        <div class="card-body">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Title</span>
                </div>
                <form:input type ="text" class="form-control" id="title" path="title" />

            </div>
            
            <div class="input-group mb-3">
                <div class="form-group" style ="display:flex;">
                	<div class="input-group-prepend " style ="margin-right: 50px">
                    	<label class ="input-group-text" for="category">Lựa chọn thể loại</label>
                	</div>
  					
  					<form:select class="form-control" id="categoryCode" path="categoryCode">
    					<form:option value="Chọn thể loại" lable =""/>
    					<form:options items="${categories}"/>
  					</form:select>
				</div>

            </div>
    
            <div class="input-group mb-3">
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">Thumbnail</span>
                </div>
                	 <form:input type ="file" class="form-control" id="file" path="thumbnail" />
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon3">Content</span>
                </div>
            	<form:textarea path="content" id ="content" style="width: 250px; height: 150px;"  />
            </div>
    
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">$Price</span>
                </div>
                <form:input type="text" class="form-control" path="price"/>
                <div class="input-group-append">
                    <span class="input-group-text">.00</span>
                </div>
            </div>
    
            <!-- <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">With textarea</span>
                </div>
                <textarea class="form-control" aria-label="With textarea" style="margin-top: 0px; margin-bottom: 0px; height: 78px;"></textarea>
            </div> -->
        </div>
        <form:input type="hidden" id="id" path="id"/>
        <button type="submit" id="btnSubmit" value="Submit">Submit</button>
        <button type="button" value="Cancel">
        	<a href="<c:url value ='/quan-tri/danh-sach?page=1&limit=2' />">Cancel</a>
        </button>
    		</form:form>
    </div>
	

	<script>
    $(document).ready(function(){
    	var formData = new FormData();
    	$('#btnSubmit').click(function(e){
    		e.preventDefault();
            var id = $('#id').val();
            if(id==""){
            	formData.append("id","");
            }else{
                formData.append("id",id);

            }
            formData.append("categoryCode",$('#categoryCode').val());
    		formData.append("title",$('#title').val());
            formData.append("content",$('#content').val());
            formData.append("price",$('#price').val());
            var data={};
            for(var item of formData.entries()){
                data[""+item[0]+""] =item[1];
            }
            if(id==""){
            	addNewBook(data)
            }else{
            	updateBook(data)
            }
    	})
    	
    	function addNewBook(data){
    		$.ajax({
    			url : '${BookURL}',
        		type : 'POST',
        		dataType : 'json',
        		contentType: 'application/json',
        		data: JSON.stringify(data),
        		success: function(e){
        			window.location.href = "/quan-tri/chinh-sua?id="+e.id+"&message=addSuccess";
        		},
        		error : function(e){
        			window.location.href = "/quan-tri/danh-sach?page=1&limit=2&message=addError"
        		}
    		})
    	}
    	
    	function updateBook(data){
    		$.ajax({
    			url : '${BookURL}',
        		type : 'PUT',
        		dataType : 'json',
        		contentType: 'application/json',
        		data: JSON.stringify(data),
        		success: function(e){
        			window.location.href = "/quan-tri/chinh-sua?id="+e.id+"&message=updateSuccess";
        		},
        		error : function(e){
        			window.location.href = "/quan-tri/danh-sach?page=1&limit=2&message=updateError"
        		}
    		})
    	}
    	
        $('#file').change(function(e){
            e.preventDefault();
        	var dataArray ={};
            var file = $(this)[0].files[0];
            if(file!=undefined){
                var reader = new FileReader();
                reader.onload= function(e){
                    dataArray["base64"] =e.target.result;
                    dataArray["name"]=file.name;
                    formData.append("thumbnail",file.name);
                    uploadFile(dataArray);
                };
                reader.readAsDataURL(file);
            }
        })
        function uploadFile(data){
            $.ajax({
                url: "${imageURL}",
                type :"POST",
                contentType:"application/json",
                data :JSON.stringify(data),
                success: function(e){
					console.log("abc");
                },
                error:function(e){

                }

            })
        }
    })
	</script>
</body>
</html>