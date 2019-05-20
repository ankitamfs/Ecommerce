<!---
  --- sendcustomerqueries
  --- -------------------
  ---
  --- author: ankita
  --- date:   4/19/19
  --->
<cfcomponent>
	<cffunction access="public" name="sendEmail">
		<cfargument name="productName" required="true" type="string">
		<cfargument name="userEmail" required="true" type="string">
		<cfargument name="userQuery" required="true" type="string">

		<cfmail from="from@domain.com" to="ankitamohanty205@gmail.com" subject="Enquiry on #arguments.productName#">
   			#arguments.userQuery#
		</cfmail>

	</cffunction>
</cfcomponent>