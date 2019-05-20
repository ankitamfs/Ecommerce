<!---Checking if the form has been submitted --->
<cfif structKeyExists(form,"submit_button")>

	<!---Calling all the validation functions --->
	<cfset variables.formError = {}/>
	<cfset variables.validateObject = createObject("component","component.authenticate")/>

	<cfset error = validateObject.checkLetters(form.Name,"loginError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkEmail(form.Email,"emailError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkPassword(form.Password,"passwordError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkRepassword(form.ConfirmPassword,form.Password,"repasswordError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkPhone(form.ContactNumber,"phoneError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkAddress(form.address,"addressError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkLetters(form.city,"cityError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkLetters(form.state,"stateError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkLetters(form.country,"countryError")/>
	<cfset StructAppend(formError,error,true)/>

	<cfset error = validateObject.checkPincode(form.pincode,"pincodeError")/>
	<cfset StructAppend(formError,error,true)/>

	<!---Checking presence of error--->

	<cfset variables.flag = 0/>

	<cfloop collection="#formError#" item="key">
		<cfif #formError[key]# NEQ "">
			<cfset flag=1/>
		</cfif>
	</cfloop>

	<cfif flag EQ 0>
		<!---Hanlding data for successful registration--->
		<cfinvoke component = "component.registrationservice" method = "dbHandler" returnVariable="check">
			<cfinvokeargument name="form" value=#form#>
		</cfinvoke>
		<cfif check EQ 1>
			<cfoutput>
				<h3 class="error_form">
					User Already Exists! Use a different email address.
				</h3>
			</cfoutput>
		<cfelse>
			<cfoutput>
				<h3 class="error_form">
					You have been successfully Registered. Please Login!
				</h3>
			</cfoutput>
		</cfif>
	</cfif>

</cfif>