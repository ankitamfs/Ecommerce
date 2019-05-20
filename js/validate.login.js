var error_loginname = false;
var error_loginpassword = false;

var loginname = $("#loginname");
var loginpassword = $("#loginpassword");

function check_loginname(value,error_id,error)
{
	if(value == "")
	{
		document.getElementById(error_id).innerHTML = 'Field cannot be empty';
		return false;
	}
	else
	{
		if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)))
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

function check_loginpassword(value,error_id,error)
{
	if(value=="")
	{
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

function loginname_field()
{
	error_loginname = check_loginname(loginname.val(),"login_error_message",error_loginname);
}

function loginpassword_field()
{
	error_loginpassword = check_loginpassword(loginpassword.val(),"loginpassword_error_message",error_loginpassword);
}


function user_validate()
{
	check_loginname(loginname.val(),"login_error_message",error_loginname);
	check_loginpassword(loginpassword.val(),"loginpassword_error_message",error_loginpassword);
	
	if(error_loginname == false || error_loginpassword == false)
	{
		return false;
	}
}

