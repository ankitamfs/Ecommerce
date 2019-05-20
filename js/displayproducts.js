

//to display the products in home page

$("document").ready(function(){
	  $.ajax
	  ({
		  url: "controller/actiondisplayproducts.cfm?getAllProducts",
		  type: "GET",
		  success: function(data)
		  {
			  products = JSON.parse(data);
			 $.each( products, function( index, value )
			  {
				 if(value.productImage != "")
				 {
					 $("#displayProducts").append('<div class="col-md-4 product-men mt-5"><div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><img src="/images/'+value.productName+'/'+value.productImage+'.jpg"  alt="No Image available" style = "height:200px;width:100px" ><div id="soldout"></div></div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><div class="info-product-price my-2"><span class="item_price"> Rs.'+value.productPrice+'</span></div></div></div></div>')
					 if(value.productActive != "Active")
		  			{
		  				$("#soldout").append('<div class="men-cart-pro"><div class="inner-men-cart-pro"><label class="link-product-add-cart">Sold Out</label></div>')
		  			}
				 }
				 else
					 {
					 	$("#displayProducts").append('<div class="col-md-4 product-men mt-5"><div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><img src="/images/noproductavailable.jpg"  alt="No Image available" style = "height:200px;width:100px" ><div id = "soldout"></div> </div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><div class="info-product-price my-2"><span class="item_price"> Rs.'+value.productPrice+'</span></div></div></div></div>')
						 	if(value.productActive != "Active")
				  			{
				  				$("#soldout").append('<div class="men-cart-pro"><div class="inner-men-cart-pro"><label class="link-product-add-cart">Sold Out</label></div>')
				  			}
					 }
				 
				 
			  });
		  },
		  error: function(data)
		  {console.log("error here");
			  console.log(data);
		  }
	  });
	});

function insertDataIntoModal(productName){
	alert(productName);
	$("#selectedProductName").val(productName);
	
}
//to implement product searching

$("#searchProducts").click(function(e){
	e.preventDefault();
	var searchstring = $("#searchstring").val();
	$.ajax
	({
		
		url: "controller/actiondisplayproducts.cfm?searchProducts",
		
		type:"GET",
		data: {
			site: searchstring
		},
		success: function(data)
		  {
			  products = JSON.parse(data);
			  if(products == "")
			  {
				  $("#displayProducts").html("");
				  $("#displayProducts").append('<p>No products available</p>');
			  }
			  else
			  {
				$("#displayProducts").html("");
			  	$.each( products, function( index, value )
			  	{
			  		if(value.productImage != "")
			  		{
			  			$("#displayProducts").append('<div class="col-md-4 product-men mt-5"> <div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><a href="productpage.cfm?productId='+value.productId+'"><img src="/images/'+value.productName+'/'+value.productImage+'.jpg"  alt="No Image available" style = "height:200px;width:100px" ></a><div id="soldout"></div><div id="soldout"></div> </div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><div class="info-product-price my-2"><span class="item_price">Rs.'+value.productPrice+'</span></div></div></div></div>')
			  			if(value.productActive != "Active")
			  			{
			  				$("#soldout").append('<div class="men-cart-pro"><div class="inner-men-cart-pro"><label class="link-product-add-cart">Sold Out</label></div>')
			  			}
			  		}
			  		else
					 {
					 	$("#displayProducts").append('<div class="col-md-4 product-men mt-5"><div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><a href="productpage.cfm?productId='+value.productId+'"><img src="/images/noproductavailable.jpg"  alt="No Image available" style = "height:200px;width:100px" ></a><div id = "soldout"></div> </div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><div class="info-product-price my-2"><span class="item_price"> Rs.'+value.productPrice+'</span></div></div></div></div>')
					 	if(value.productActive != "Active")
			  			{
			  				$("#soldout").append('<div class="men-cart-pro"><div class="inner-men-cart-pro"><label class="link-product-add-cart">Sold Out</label></div>')
			  			}
					 }

			  		
			  	});
			  }
		  },
		  error: function(data)
		  {
			  console.log("error here");
			  console.log(data);
		  }
	});
});

// to implement filters

function filterProducts(index)
{
	 $.ajax
	  ({
		  url: "controller/actiondisplayproducts.cfm?filterProducts",
		  type: "GET",
		  data:{
			  site:index
		  },
		  success: function(data)
		  {
			  products = JSON.parse(data);
			  if(products == "")
			  {
				  $("#displayProducts").html("");
				  $("#displayProducts").append('<p>No products available</p>');
			  }
			  else
			  {
				$("#displayProducts").html("");
				var counter = 1;
				var soldout = "soldout"+counter;
			  	$.each( products, function( index, value )
			  	{
			  		if(value.productImage != "")
			  		{
			  			if(value.productActive != "Active")
			  				{
			  					$("#displayProducts").append('<div class="col-md-4 product-men mt-5"> <div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><img src="/images/'+value.productName+'/'+value.productImage+'.jpg"  alt="No Image available" style = "height:200px;width:100px" ><div class="men-cart-pro"><div class="inner-men-cart-pro"><label class="link-product-add-cart">Sold Out</label></div> </div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><div class="info-product-price my-2"><span class="item_price">Rs.'+value.productPrice+'</span></div></div></div></div>')
			  				}
			  			else
			  				{
			  					$("#displayProducts").append('<div class="col-md-4 product-men mt-5"> <div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><img src="/images/'+value.productName+'/'+value.productImage+'.jpg"  alt="No Image available" style = "height:200px;width:100px" ></div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><div class="info-product-price my-2"><span class="item_price">Rs.'+value.productPrice+'</span></div></div></div></div>')
			  				}
			  			
					
			  		}
			  		else
					 {
			  			if(value.productActive != "Active")
			  				{
			  					$("#displayProducts").append('<div class="col-md-4 product-men mt-5"><div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><img src="/images/noproductavailable.jpg"  alt="No Image available" style = "height:200px;width:100px" ><div class="men-cart-pro"><div class="inner-men-cart-pro"><label class="link-product-add-cart">Sold Out</label></div></div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><a href="#" data-toggle="modal" data-id='+ value.productId +' data-target="#exampleModal7" onclick="insertDataIntoModal('+ value.productName +')"><label style = "color:green; font-size:10px">Click for Queries</label></a><div class="info-product-price my-2"><span class="item_price"> Rs.'+value.productPrice+'</span></div></div></div></div>')
			  				}
			  			else
			  				{
			  					$("#displayProducts").append('<div class="col-md-4 product-men mt-5"><div class="men-pro-item simpleCart_shelfItem"> <div class="men-thumb-item text-center"><img src="/images/noproductavailable.jpg"  alt="No Image available" style = "height:200px;width:100px" ></div><div class="item-info-product text-center border-top mt-4"><h4 class="pt-1"><a href="productpage.cfm?productId='+value.productId+'" id="viewproduct">'+value.productName+'</a></h4><a href="#" data-toggle="modal" data-id='+ value.productId +' data-target="#exampleModal7" onclick="insertDataIntoModal('+ value.productName +')"><label style = "color:green; font-size:10px">Click for Queries</label></a><div class="info-product-price my-2"><span class="item_price"> Rs.'+value.productPrice+'</span></div></div></div></div>')
			  				}
					 	
					 }
			  	});
			  }
		  },
		  error: function(data)
		  {
			  console.log("error here");
			  console.log(data);
		  }
	  });
}