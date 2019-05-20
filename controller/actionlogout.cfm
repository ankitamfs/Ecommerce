<!---Handling the Logout Functionality--->

<cfinvoke component = "component.loginservice" method="sessionlogout" returnvariable="flag">
</cfinvoke>
<cfif flag EQ 1>
	<cflocation url="../index.cfm" addtoken="false"/>
</cfif>
