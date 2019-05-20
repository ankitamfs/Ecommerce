
<cfcomponent>

	<cffunction name="catchError" access="public">
		<cfargument name = "componentName" type = "string" required = "true">
		<cfargument name = "functionName" type = "string" required = "true">
		<cfargument name = "exceptionType" type = "string" required = "true">
		<cfargument name = "diagnosticMessage" type = "string" required = "true">

		<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #arguments.exceptionType#,Diagnostics: #arguments.diagnosticMessage# ,
			 		Component:#arguments.componentName# , function:#arguments.functionName#, Line:#cfcatch.TagContext[1].Line#">
	</cffunction>

</cfcomponent>