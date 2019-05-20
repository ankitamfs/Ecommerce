<cfif structKeyExists(url,"sendQuery") AND structkeyExists(session,'loggedInUser')>

	<cfinvoke component="sendcustomerqueries" method="sendEmail">
		<cfinvokeargument name="productName" value="#url.site#">
		<cfinvokeargument name="userEmail" value="#session.loggedInUser.email#">
		<cfinvokeargument name="userQuery" value="#form.productQuery#">
	</cfinvoke>

</cfif>