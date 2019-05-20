// to display category and sub-categories for filters
$("#document").ready(function(){
	  $.ajax
	  ({
		  url: "controller/actionaddproduct.cfm?getData",
		  type: "GET",
		  success: function(data)
		  {
			  categories = JSON.parse(data);
			  $.each( categories, function( index, value)
			  {
			  var i = 0, j=0;
			  console.log(value.subCategory[i].subcategoryName);
			  		
			  		$("#shopByCategory").append('<div id = '+value.Category+'><h5>'+value.Category+'</h5></div>')
			  		j++;
			  		while(i<value.subCategory.length)
			  			{
			  			 $("#shopByCategory").append('<ul class="multi-column-dropdown"><li><div onclick ="return filterProducts('+value.subCategory[i].subcategoryId+')">'+value.subCategory[i].subcategoryName+'</div></li></ul>')
			  			 i++;
			  			}
	
				  });
		  },
		  error: function(data)
		  {
			  console.log(data);
		  }
	  });
	});

