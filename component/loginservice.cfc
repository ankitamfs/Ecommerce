<!---
  --- loginservice
  --- ------------
  ---
  --- author: ankita
  --- date:   3/12/19
  --->
<cfcomponent>

	<!---Handling data for succesful Login--->

	<cffunction name="dbHandler" access="public" returntype="Numeric">
		<cfargument name="form" type="struct" required="true">
		<cftry>
			<!--- variable to return result to ensure execution of query--->
			<cfset var check = 0/>
			<cfquery name="checkLogin">

				SELECT Salt, Password, Name, Role
			 	FROM Person
			 	WHERE Email = <cfqueryparam value="#arguments.form.loginID#" cfsqltype="cf_sql_varchar"/>
			</cfquery>

			<cfif checkLogin.RecordCount NEQ 0>
				<cfset var salt = checkLogin["Salt"]/>
				<cfset var queryPassword = checkLogin["Password"]/>

				<cfset var verifyPassword = Hash(form.loginPassword & salt, "SHA-512")/>

				<cfif queryPassword EQ verifyPassword>
					<!---Session creation for Logged In User--->
					<cfset session.loggedInUser = {'name'= checkLogin.Name, 'role'= checkLogin.Role, 'email'= arguments.form.loginID}/>
				<cfelse>
					<cfset check = 1/>
				</cfif>
			</cfif>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:loginservice , function:dbHandler, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn check>
	</cffunction>


	<!---For deletion of session after logout--->

	<cffunction name="sessionlogout" access="public">
		<cftry>
			<cfset StructDelete(session, "loggedInUser")/>
			<cfset StructDelete(cookie,"cfid")/>
			<cfset StructDelete(cookie,"cftoken")/>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:loginservice , function:sessionlogout, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn 1>
	</cffunction>


</cfcomponent>