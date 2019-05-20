<!---
  --- Authenticate
  --- ------------
  ---
  --- author: ankita
  --- date:   2/11/19
  --->
<cfcomponent>

	<cfset variables.error = {}/>

		<!---Validation function for checking letters--->

		<cffunction name = "checkLetters" access = "public" returntype = "struct">
			<cfargument name="inputValue" type="string" required ="true">
			<cfargument name="inputName" type="string" required="true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfif isValid("regex",arguments.inputValue,"^[a-zA-Z]+$")>
					<cfset error = {#arguments.inputName# = ""}/>
				<cfelse>
					<cfset error = {#arguments.inputName# = "Sorry, this field cannot be empty"}/>
				</cfif>
			<cfelse>
				<cfset error = {#arguments.inputName# = "Sorry, This field is required"}/>
			</cfif>
			<cfreturn error>
		</cffunction>

		<!---Validation function for checking password--->

		<cffunction name="checkPassword" access="public" returntype="struct">
			<cfargument name="inputValue" type="string" required ="true">
			<cfargument name="inputName" type="string" required="true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfset reg = "^[A-Za-z0-9_!@##$%]{8,65}$" />
				<cfif isValid("regex",arguments.inputValue, reg)>
					<cfset error = {#arguments.inputName# = ""}/>
				<cfelse>
					<cfset error = {#arguments.inputName# = "Please enter your password in valid format"}/ >
				</cfif>
			<cfelse>
				<cfset error = {#arguments.inputName# = "Sorry, This field is required"}/>
			</cfif>
			<cfreturn error>
		</cffunction>

		<!---Validation function for checking confirm password --->

		<cffunction name="checkRepassword" access="public" returntype="struct">
			<cfargument name="inputValue1" type="string" required ="true">
			<cfargument name="inputValue2" type="string" required ="true">
			<cfargument name="inputName" type="string" required="true">
			<cfif len(trim(arguments.inputValue1)) GT 0>
				<cfif arguments.inputValue1 EQ arguments.inputValue2>
					<cfset error = {#arguments.inputName# = ""}/>
				<cfelse>
					<cfset error = {#arguments.inputName# = "The passwords don't match"}/>
				</cfif>
			<cfelse>
				<cfset error = {#arguments.inputName# = "Sorry, This field is required"}/>
			</cfif>
			<cfreturn error>
		</cffunction>

		<!---Validation function for checking email address --->

		<cffunction name="checkEmail" access="public" returntype="struct">
			<cfargument name="inputValue" type="string" required ="true">
			<cfargument name="inputName" type="string" required="true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfif isValid("email",arguments.inputValue)>
					<cfset error = {#arguments.inputName# = ""}/>
				<cfelse>
					<cfset error = {#arguments.inputName# = "Please enter a valid email address"}/>
				</cfif>
			<cfelse>
				<cfset error = {#arguments.inputName# = "Sorry, This field is required"}/>
			</cfif>
			<cfreturn error>
		</cffunction>

		<!---Validation function for checking phone number --->

		<cffunction name = "checkPhone" access = "public" returntype = "struct">
			<cfargument name = "inputValue" type = "String" required = "true">
			<cfargument name = "inputName" type = "String" required = "true">
			<cfif len(trim(arguments.inputValue)) GT 0 and len(trim(arguments.inputValue)) EQ 10>
				<cfif isValid("regex",arguments.inputValue,"^[0-9]*$")>
					<cfset error[arguments.inputName] = "">
				<cfelse>
					<cfset error[arguments.inputName] = "Sorry, This field cannot contain characters"/>
				</cfif>
			<cfelse>
				<cfset error[arguments.inputName] = "Sorry, This field is required"/>
			</cfif>
			<cfreturn error>
		</cffunction>



		<!---Validation function for checking address --->

		<cffunction name = "checkAddress" access = "public" returntype = "struct">
			<cfargument name = "inputValue" type = "string" required = "true">
			<cfargument name = "inputName" type = "string" required = "true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfif isValid("regex",arguments.inputValue,"^\d{1,3}?\d{0,3}\s[a-zA-Z]{2,30}\s[a-zA-Z]{2,15}")>
					<cfset error[arguments.inputName] = "">
				<cfelse>
					<cfset error[arguments.inputName] = "You've entered an invalid address" >
				</cfif>
			<cfelse>
				<cfset error[arguments.inputName] = "Sorry, This field is required">
			</cfif>
			<cfreturn error>
		</cffunction>

		<!---Validation function for checking pincode --->

		<cffunction name = "checkPincode" access = "public" returntype = "struct">
			<cfargument name = "inputValue" type = "String" required = "true">
			<cfargument name = "inputName" type = "String" required = "true">
			<cfif len(trim(arguments.inputValue)) GT 0 and len(trim(arguments.inputValue)) EQ 6>
				<cfif isValid("regex",arguments.inputValue,"^[0-9]*$")>
					<cfset error[arguments.inputName] = "">
				<cfelse>
					<cfset error[arguments.inputName] = "Sorry, This field cannot contain characters" >
				</cfif>
			<cfelse>
				<cfset error[arguments.inputName] = "Sorry, This field is required">
			</cfif>
			<cfreturn error>
		</cffunction>



</cfcomponent>