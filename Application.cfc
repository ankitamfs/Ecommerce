<!---
  --- Application
  --- -----------
  ---
  --- author: ankita
  --- date:   3/7/19
  --->
<cfcomponent>

	<cfset this.name = "myStoree" />
	<cfset this.sessionManagement=true/>
	<cfset this.clientManagement=true>
	<cfset this.sessionTimeout= CreateTimeSpan(0,0,45,0) />
	<cfset this.datasource= 'mystore'/>
	<cfset this.errorObject= createObject("component","component.errorservice")/>

	 <cffunction name="onApplicationStart" access="public" returntype="boolean">
		 <cfreturn true>
	</cffunction>

	<cffunction name="OnRequestStart">
		<cfreturn true>
	</cffunction>

</cfcomponent>