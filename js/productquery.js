	$("#send_button").click(function()
			{
				$.ajax
				  ({
					  url: "controller/actionsendqueries.cfm?sendQuery",
					  type: "GET",
					  data: {
				             site: productName
				             },
				             
					  success: function(data)
					  {
						  
							 console.log("successfully sent");
							 
					  },
					  error: function(data)
					  {console.log("error here");
					  }
				  }); 
			})
	 
