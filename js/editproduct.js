//variables to check returned value as per validations
var error_productprice = false;
var error_productdescription = false;

//storing the data entered in the form fields
var productprice = $("#editPrice");
var productdescription = $("#editDescription");

//validating for the amount entered for the price of the products
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

//validating for the description of the products
function checkDescription(value,error,error_id)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
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
		
		error = true;
	
}
//checking the validation when the user tries to edit a product
function checkNew()
{
	checkPrice(productprice.val(),error_productprice,"editPrice_error_message");
	checkDescription(productdescription.val(),error_productdescription,"editDescription_error_message");
	
	if(error_productprice == false)
		{
			return false;
		}
}

function editPrice_field()
{
	error_productprice = checkPrice(productprice.val(),error_productprice,"editPrice_error_message");
}

function editDescription_field()
{
	error_productdescription = checkDescription(productdescription.val(),error_productdescription,"editDescription_error_message");
}
