<cfif structKeyExists(form,"login_button")>

	<!---Invoking functions for validations --->
	<cfset variables.loginError = {}/>
	<cfset validateObject= createObject("component","component.authenticate")/>

	<cfset error = validateObject.checkEmail(form.loginID,"loginerror")/>
	<cfset StructAppend(loginError,error,true)/>

	<cfset error = validateObject.checkPassword(form.loginPassword,"passworderror")/>
	<cfset StructAppend(loginError,error,true)/>

	<!---CHecking presence of errors--->

	<cfset variables.flag = 0/>

	<cfloop collection="#loginError#" item="key">
		<cfif #loginError[key]# NEQ "">
			<cfset flag=1/>
		</cfif>
	</cfloop>

	<cfif flag EQ 0>
		<!---Handling Credentials for login--->
		<cfinvoke component = "component.loginservice" method = "dbHandler" returnVariable="check">
			<cfinvokeargument name="form" value=#form#>
		</cfinvoke>

		<cfif check EQ 1>
			<cfoutput>
				<h3 class="error_form">
					Invalid Credentials! Please Login Again.
				</h3>
			</cfoutput>
		<cfelse>
			<cflocation addtoken="false" url="index.cfm">
		</cfif>

	</cfif>
</cfif>
