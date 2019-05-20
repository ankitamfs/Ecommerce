
	
		
		var error_name = false;
		var error_password = false;
		var error_repassword = false;
		var error_phone = false;
		var error_email = false;
		var error_address = false;
		var error_city = false;
		var error_state = false;
		var error_pincode = false;
		var error_country = false;
		
		
		
		var name1 = $("#name");
		var password = $("#password1");
		var repassword = $("#password2");
		var email = $("#email");
		var phone = $("#Contact");
		var address = $("#address");
		var city = $("#city");
		var state = $("#state");
		var country = $("#country");
		var pincode = $("#pincode");
		
		
		
		function check_letter(value,error_id,error)
		{
			if(value == "")
			{
				document.getElementById(error_id).innerHTML = 'Field cannot be empty';
				return false;
			}
			else
			{
				if(!(/^[a-zA-Z]+$/.test(value)))
				{
					document.getElementById(error_id).innerHTML = 'Enter only characters';
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
		
		function check_email(value,error_id,error)
		{
			if(value == "")
			{
				document.getElementById(error_id).innerHTML = 'Field cannot be empty';
			}
			else
			{
				if(!( /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)))
				{
					document.getElementById(error_id).innerHTML = 'Enter valid email';
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
		
		function check_password(value,value2,error_id,error)
		{
			if(value=="")
			{
				document.getElementById(value2).setAttribute('readonly', true);
				document.getElementById(error_id).innerHTML = 'Field cannot be empty';
			}
			else
			{
				if(!(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(value)))
				{
					document.getElementById(error_id).innerHTML = 'Password should contain atleast 8 characters and should include a number,a special char and an uppercase and a lowercase letter';
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
		
		function check_repassword(value1,value2,error_id,error)
		{
			if(value1 == "")
			{
				document.getElementById(error_id).innerHTML = 'Field cannot be empty';
			}
			else
			{
				if(value1 != value2)
				{
					document.getElementById(error_id).innerHTML = 'Passwords do not match';
				}
				else
			  	{
			  		document.getElementById(error_id).innerHTML = '';
			  		return true;
			  	}
				error = true;
			}
			
		}
		
		function check_number(value,error_id,error)
		{
			if(value == "")
			{
				document.getElementById(error_id).innerHTML = 'Field cannot be empty';
			}
			else
			{
				if(!( /^[0-9]*$/.test(value)))
				{
					document.getElementById(error_id).innerHTML = 'Enter valid number';
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
		
		function check_address(value,error_id,error)
		{
			if(value == "")
			{
				document.getElementById(error_id).innerHTML = 'Field cannot be empty';
			}
			else
			{
				if(!( /^\d{1,3}?\d{0,3}\s[a-zA-Z]{2,30}\s[a-zA-Z]{2,15}/.test(value)))
				{
					document.getElementById(error_id).innerHTML = 'Enter valid address';
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
		
		function validate()
		{
			check_letter(name1.val(),"name_error_message",error_name);
			check_email(email.val(),"email_error_message",error_email);
			check_number(phone.val(),"phone_error_message",error_phone);
			check_password(password.val(),"password2","password_error_message",error_password);
			check_repassword(repassword.val(),password.val(),"repassword_error_message",error_repassword);
			check_address(address.val(),"address_error_message",error_address);
			check_letter(city.val(),"city_error_message",error_city);
			check_letter(state.val(),"state_error_message",error_state);
			check_letter(country.val(),"country_error_message",error_country);
			check_number(pincode.val(),"pincode_error_message",error_pincode);
			
			if(error_name == false || error_password == false ||
					error_repassword == false || error_phone == false || error_email == false ||
					error_address == false || error_city == false || error_state == false || 
					error_country == false || error_pincode == false)
				{
					return false;
				}
		}
		
		function name_field()
		{
			error_name = check_letter(name1.val(),"name_error_message",error_name);
		}

		function password_field()
		{
			error_password = check_password(password.val(),"password2","password_error_message",error_password);
			if(password.value != "")
			{
				document.getElementById("password2").removeAttribute("readonly");
			}
			else
			{
				document.getElementById("password2").setAttribute('readonly', true);
			}
		}

		function repassword_field()
		{
			error_repassword = check_repassword(repassword.val(),password.val(),"repassword_error_message",error_repassword);
		}

		function email_field()
		{
			error_email = check_email(email.val(),"email_error_message",error_email);
		}

		function phone_field()
		{
			error_phone = check_number(phone.val(),"phone_error_message",error_phone);
		}
		
		function address_field()
		{
			error_address = check_address(address.val(),"address_error_message",error_address);
		}
		function city_field()
		{
			error_city = check_letter(city.val(),"city_error_message",error_city);
		}
		function state_field()
		{
			error_state = check_letter(state.val(),"state_error_message",error_state);
		}
		function country_field()
		{
			error_country = check_letter(country.val(),"country_error_message",error_country);
		}
		function pincode_field()
		{
			error_pincode = check_number(pincode.val(),"pincode_error_message",error_pincode);
		}

	