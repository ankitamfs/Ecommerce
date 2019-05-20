<!--- Login modal --->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center">Log In</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="#" method="post" onsubmit = "return user_validate()">
						<div class="form-group">
							<label class="col-form-label">Login ID<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" placeholder="Your registered Email ID" name="loginID" id="loginname" onchange = "loginname_field()">
							<p class="error_form" id="login_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Password<span class = "mandatory">*</span></label>
							<input type="password" class="form-control" name="loginPassword" id="loginpassword" onchange = "loginpassword_field()">
							<p class="error_form" id="loginpassword_error_message"></p>
						</div>
						<div class="right-w3l">
							<input type="submit" name="login_button" class="form-control" value="Log in" >
						</div>
						<p class="text-center dont-do mt-3">Don't have an account?
							<a href="#" data-toggle="modal" data-target="#exampleModal2">
								Register Now</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
<!--- //login modal--->

<!--- Registration modal --->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Register</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="#" method="post" onsubmit = "return validate()">
						<div class="form-group">
							<label class="col-form-label">Your Name<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" id="name" name="Name" onchange="name_field()">
							 <p class="error_form" id="name_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Email<span class = "mandatory">*</span></label>
							<input type="email" class="form-control"  name="Email" id="email" onblur="email_field()">
							 <p class="error_form" id="email_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Password<span class = "mandatory">*</span></label>
							<input type="password" class="form-control"  name="Password" id="password1" onblur="password_field()">
							 <p class="error_form" id="password_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Confirm Password<span class = "mandatory">*</span></label>
							<input type="password" class="form-control" name="ConfirmPassword" id="password2" onblur="repassword_field()">
							 <p class="error_form" id="repassword_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Contact Number<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" name="ContactNumber" id="Contact" maxlength="10" onblur="phone_field()">
							 <p class="error_form" id="phone_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Address<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" placeholder="Door No, Street, Address " name="address" id="address" onblur="address_field()">
							 <p class="error_form" id="address_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">City<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" placeholder="" name="city" id="city" onblur="city_field()">
							 <p class="error_form" id="city_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">State<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" placeholder="" name="state" id="state" onblur="state_field()">
							 <p class="error_form" id="state_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Country<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" placeholder="" name="country" id="country" onblur="country_field()">
							 <p class="error_form" id="country_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label">Pincode<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" placeholder="" maxlength="6" name="pincode" id="pincode" onblur="pincode_field()">
							 <p class="error_form" id="pincode_error_message"></p>
						</div>


						<div class="right-w3l">
							<input type="submit" name="submit_button" class="form-control" value="Register">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!--- //Registration Modal --->