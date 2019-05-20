<!---
  --- productauthenticate
  --- -------------------
  ---
  --- author: ankita
  --- date:   3/14/19
  --->
<cfcomponent>

	<cfset variables.error = {}/>

	<!---Validation function for checking product name and category --->

	<cffunction name = "checkEmptyField" access = "public" returntype = "struct">
		<cfargument name = "inputValue" type = "String" required = "true">
		<cfargument name = "inputName" type = "String" required = "true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfset error[arguments.inputName] = "">
			<cfelse>
				<cfset error[arguments.inputName] = "Sorry, This field is required">
			</cfif>
		<cfreturn error>
	</cffunction>

	<!---validation function for checking product price--->

	<cffunction name = "checkProductPrice" access = "public" returntype = "struct">
		<cfargument name = "inputValue" type = "String" required = "true">
		<cfargument name = "inputName" type = "String" required = "true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfif reFind("^[0-9]+(\.[0-9]+)?$", inputValue)>
					<cfset error[arguments.inputName] = "">
				<cfelse>
					<cfset error[arguments.inputName] = "Sorry, This field needs to have valid price" >
				</cfif>
			<cfelse>
				<cfset error[arguments.inputName] = "Sorry, This field is required">
			</cfif>
		<cfreturn error>
	</cffunction>

	<!---validation function for checking product quantity--->

	<cffunction name = "checkProductQuantity" access = "public" returntype = "struct">
		<cfargument name = "inputValue" type = "String" required = "true">
		<cfargument name = "inputName" type = "String" required = "true">
			<cfif len(trim(arguments.inputValue)) GT 0>
				<cfif reFind("^[0-9]*$", inputValue)>
					<cfset error[arguments.inputName] = "">
				<cfelse>
					<cfset error[arguments.inputName] = "Sorry, This field needs to have valid price" >
				</cfif>
			<cfelse>
				<cfset error[arguments.inputName] = "Sorry, This field is required">
			</cfif>
		<cfreturn error>
	</cffunction>

</cfcomponent>