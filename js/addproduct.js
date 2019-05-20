//variables to check returned value as per validations
var error_productname = false;
var error_productcategory = false;
var error_productsubcategory = false;
var error_productprice = false;
var error_productquantity = false;
var error_productcategoryname = false;
var error_productsubcategoryname = false;

//storing the data entered in the form fields
var productname = $("#productName");
var productprice = $("#productPrice");
var productquantity = $("#productQuantity");
var productcategory = document.getElementById("category");
var val1 = productcategory.options[productcategory.selectedIndex];
var productsubcategory = document.getElementById("subcategory");
var val2 = productsubcategory.options[productsubcategory.selectedIndex];
var productcategoryname = $("#categoryName");
var productsubcategoryname = $("#subcategoryName");
// checking if the category/sub-category have been selected
function checkCategory(value,error,error_id)
{
	if(value == "Select Category" || value == "Select Sub-Category")
	{
		document.getElementById(error_id).innerHTML = 'Field cannot be empty';
		return false;
	}
	else
	{
		document.getElementById(error_id).innerHTML = '';
		return true;
	}
	
}
// to check for empty fields
function checkEmptyField(value,error,error_id)
{
	if(value == "")
	{
		document.getElementById(error_id).innerHTML = 'Field cannot be empty';
		return false;
	}
	else
	{
		document.getElementById(error_id).innerHTML = '';
		return true;
	}
}
// validating for the amount entered for the price of the products
function checkPrice(value,error,error_id)
{
	if(value == "")
	{
		document.getElementById(error_id).innerHTML = 'Field cannot be empty';
		return false;
	}
	else
	{
		if(!(/^[0-9]+(\.[0-9]+)?$/.test(value)))
		{
			document.getElementById(error_id).innerHTML = 'Enter valid Price';
			return false;
		}
		else
		{
			document.getElementById(error_id).innerHTML = '';
			return true;
		}
		
		error = true;
	}
	
}
// validation to check if the quantity entered is an integer
function checkQuantity(value,error,error_id)
{
	if(value == "")
	{
		document.getElementById(error_id).innerHTML = 'Field cannot be empty';
		return false;
	}
	else
	{
		if(!(/^[0-9]*$/.test(value)))
		{
			document.getElementById(error_id).innerHTML = 'Enter valid Quantity';
			return false;
		}
		else
		{
			document.getElementById(error_id).innerHTML = '';
			return true;
		}
		
		error = true;
	}
	
}
// checking the validation when the user tries to add a product
function checkProduct()
{
	checkEmptyField(productname.val(),error_productname,"productname_error_message");
	checkPrice(productprice.val(),error_productprice,"productprice_error_message");
	checkQuantity(productquantity.val(),error_productquantity,"productquantity_error_message");
	checkCategory(val1.value,error_productcategory,"productcategory_error_message");
	checkCategory(val2.value,error_productsubcategory,"productsubcategory_error_message");
	
	if(error_productname == false || error_productprice == false || error_productquantity == false ||
			error_productcategory == false || error_productsubcategory == false)
		{
			return false;
		}
	else
		{
		console.log("HI");
		//for fetching the multiple image files
		//$("#addproduct_button").click = function(){
//		$.ajax
//		 ({
//			 url: "controller/actionaddproduct.cfm?handleImages",
//			 type: "GET",
//			 data: {
//	            site: data
//	            
//	            },
//	            
//			 success: function(data)
//			 {
//				 console.log(data);
//				console.log("succesful here");
//			 },
//			 error: function(data)
//			 {
//				 console.log(data);
//			 }
//		 });
		    
		}
}


function productname_field()
{
	error_productname = checkEmptyField(productname.val(),error_productname,"productname_error_message");
}

function productprice_field()
{
	error_productprice = checkPrice(productprice.val(),error_productprice,"productprice_error_message");
}

function productquantity_field()
{
	error_productquantity = checkQuantity(productquantity.val(),error_productquantity,"productquantity_error_message");
}

function productcategory_field()
{
	 val1 = productcategory.options[productcategory.selectedIndex];
	error_productcategory = checkCategory(val1.value,error_productcategory,"productcategory_error_message");
}

function productsubcategory_field()
{
	 val2 = productsubcategory.options[productsubcategory.selectedIndex];
	error_productsubcategory = checkCategory(val2.value,error_productsubcategory,"productsubcategory_error_message");
}

function checkCategory()
{
	error_productcategoryname = checkEmptyField(productcategoryname,error_productcategoryname,"categoryname_error_message");
	
	if(error_productcategoryname == false)
		{
			return false;
		}
}

function checkSubCategory()
{
	error_productsubcategoryname = checkEmptyField(productsubcategoryname,error_productsubcategoryname,"subcategoryname_error_message");
	
	if(error_productsubcategoryname == false)
		{
			return false;
		}
}

function productcategoryname_field()
{
	error_productcategoryname = checkEmptyField(productcategoryname.val(),error_productcategoryname,"categoryname_error_message");
}

function productsubcategoryname_field()
{
	error_subproductcategoryname = checkEmptyField(productsubcategoryname.val(),error_productsubcategoryname,"subcategoryname_error_message");
}

//for managing category types to be displayed to the user in add sub-category modal

$("#exampleModal5").ready(function(){
	  $.ajax
	  ({
		  url: "controller/actionaddproduct.cfm?getCategory",
		  type: "GET",
		  success: function(data)
		  {
			  categories = JSON.parse(data);
			  $.each( categories, function( index, value )
			  {
				  $("#selectCategory").append('<option value='+value.categoryId+'>'+
				  value.categoryName+'</option>')
				  });
		  },
		  error: function(data)
		  {
			  console.log(data)
		  }
	  });
	});

//for managing category types to be displayed in the drop down in the add product modal

$("#exampleModal3").ready(function(){
	  $.ajax
	  ({
		  url: "controller/actionaddproduct.cfm?getCategories",
		  type: "GET",
		  success: function(data)
		  {
			  categories = JSON.parse(data);
			  $.each( categories, function( index, value )
			  {
				  $("#category").append('<option value='+value.categoryId+'>'+
				  value.categoryName+'</option>')
				  });
		  },
		  error: function(data)
		  {
			  console.log(data);
		  }
	  });
	});


// for adding subcategories according to the category selected

$("#category").change(function(){
	 $.ajax
	 ({
		 url: "controller/actionaddproduct.cfm?handleCategories",
		 type: "GET",
		 data: {
             site: $("#category").val()
             
             },
             
		 success: function(data)
		 {
			 $("#subcategory").html("");
			 $("#subcategory").append('<option selected style="display:none;color:#eee;">Select Sub-Category</option>');
			 categories = JSON.parse(data);
			  $.each( categories, function( index, value )
			  {
				  
				  $("#subcategory").append('<option value='+value.subcategoryId+'>'+
				  value.subcategoryName+'</option>')
				  });
		 },
		 error: function(data)
		 {
			 console.log(data);
		 }
	 });
});


//for displaying categories to be displayed in the drop down in the edit product modal

$("#exampleModal6").ready(function(){
	  $.ajax
	  ({
		  url: "controller/actioneditproduct.cfm?getCategories",
		  type: "GET",
		  success: function(data)
		  {
			  products = JSON.parse(data);
			  $.each( products, function( index, value )
			  {
				  if(value.productImage != "")
					  {
					  		$("#editCategory").append('<option value='+value.categoryId+'>'+ value.categoryName+'</option>')
					  }
				 
			  });
		  },
		  error: function(data)
		  {
			  console.log(data);
		  }
	  });
	});

// for displaying subcategories according to the category selected

$("#editCategory").change(function(){
	 $("#editSubCategory").html("");
	 $.ajax
	 ({
		 url: "controller/actioneditproduct.cfm?handleCategories",
		 type: "GET",
		 data: {
             site: $("#editCategory").val()
             
             },
             
		 success: function(data)
		 {
			 $("#editSubCategory").append('<option selected style="display:none;color:#eee;">Select Sub-Category</option>')
			 categories = JSON.parse(data);
			  $.each( categories, function( index, value )
			  {
				  
				  $("#editSubCategory").append('<option value='+value.subcategoryId+'>'+
				  value.subcategoryName+'</option>')
				  });
		 },
		 error: function(data)
		 {
			 console.log(data);
		 }
	 });
});

//for displaying products according to the category selected

$("#editSubCategory").change(function(){
	 $("#editProduct").html("");
	 $.ajax
	 ({
		 url: "controller/actioneditproduct.cfm?getProducts",
		 type: "GET",
		 data: {
             site: $("#editSubCategory").val()
             
             },
             
		 success: function(data)
		 {
			 $("#editSubCategory").append('<option selected style="display:none;color:#eee;">Select Sub-Category</option>')
			 categories = JSON.parse(data);
			  $.each( categories, function( index, value )
			  {
				  
				  $("#editSubCategory").append('<option value='+value.subcategoryId+'>'+
				  value.subcategoryName+'</option>')
				  });
		 },
		 error: function(data)
		 {
			 console.log(data);
		 }
	 });
});
var imageArray=[];
//Check File API support
if(window.File && window.FileList && window.FileReader)
{
	//var data = new FormData();
    var filesInput = document.getElementById("imageupload");
    filesInput.addEventListener("change", function(event){
        
        var files = event.target.files; //FileList object
        for(var i = 0; i< files.length; i++)
        {
            imageArray[i] = files[i];
            console.log(imageArray[i]);
            //Only pics
            if(!imageArray[i].type.match('image'))
              continue;
            
            //data.append('file_'+i,file);
            
            
            
//            var picReader = new FileReader();
//            
//            picReader.addEventListener("load",function(event){
//                
//                var picFile = event.target;
//                
//                var div = document.createElement("div");
//                
//               div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
//                        "title='" + picFile.name + "'/>";
//                
//               $("#thumbnail").append(div);           
            
 //           });
            
             //Read the image
           // picReader.readAsDataURL(file);
        }     
        //console.log(data);      
       //$("#imagefile").innerHTML = data;
    });
}
else
{
    console.log("Your browser does not support File API");
}
//}




