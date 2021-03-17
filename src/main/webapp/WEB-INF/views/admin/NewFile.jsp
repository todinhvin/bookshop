<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/taglib.jsp" %>
<c:url var = "imageURL" value ="/api/book"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form id ="formSubmit" action ="/new/api" method = "get" enctype="multipart/form-data">
		<div class="card">
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
                <div class="form-group">
  					<label for="category">Lựa chọn thể loại</label>
  					<form:select class="form-control" id="categoryCode" path="categoryCode">
    					<form:option value="" lable ="Lựa chọn thể loại"/>
    					<form:options items="${categories}"/>
  					</form:select>
				</div>

            </div>
    
            <div class="input-group mb-3">
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">Thumbnail</span>
                </div>
                <form:input type="file" id ="file" class="form-control" path="thumbnail"/>
                
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon3">Author</span>
                </div>
                <form:input type="text" class="form-control" id="author"  path="author"/>
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
        <button type="submit" id="btnSubmit" value="Submit">Submit</button>
    </div>
	
	</form:form>
	<script>
    $(document).ready(function(){
    	var formData = new FormData();
    	$('#btnSubmit').click(function(e){
    		e.preventDefault;
            var id = $('#id').val();
            
    		formData.append("title",$('#title').val());
            formData.append("thumbnail",$('#file').val());
            formData.append("author",$('#author').val());
            formData.append("price",$('#price').val());
    	})
    	
        $('#file').change(function(e){
            e.preventDefault;
        	var dataArray ={};
            var file = $(this)[0].files[0];
            if(file!=undefined){
                var reader = new FileReader();
                reader.onload= function(e){
                    dataArray["base64"] =e.target.result;
                    dataArray["name"]=file.name;
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