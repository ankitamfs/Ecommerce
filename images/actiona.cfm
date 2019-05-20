<!--- <cfset variables.captcha = form.g-recaptcha-response> --->
<cfdump var="#form#">
<!--- <cfset variables.secretKey = "6Lc-Pp4UAAAAAFFDKF5xQuTm29eUfznMUi8Gb7N7"> --->
<!--- <cfset captcha = form.token> --->
<!--- <cfset ac = form.action> --->
<cfset ip = CGI.LOCAL_ADDR>
<cfoutput>
	#ip#
</cfoutput>
<!--- <cfset images = form.file> --->
<!--- <cfdump var="#images#"> --->
<cfset imageFileArray = listtoArray(form.imageupload)>
<cfloop index="idx" from="1" to="#arraylen(imageFileArray)#">
	<cfdump var="#imageFileArray[idx]#">

</cfloop>
<!--- <cfset apiURL ='https://www.google.com/recaptcha/api/siteverify?secret='&urlEncodedFormat(#secretKey#) & '&response='& urlEncodedFormat(#captcha#)> --->
<!--- <cfhttp url="#apiURL#" method="get" result="httpResp" timeout="120"> --->
<!---     <cfhttpparam type="header" name="Content-Type" value="application/json" /> --->
<!--- </cfhttp> --->
<!--- <cfset result = deserializeJSON(httpResp.filecontent) /> --->
<!--- <cfif result.success> --->
<!--- 	<cfoutput>"Thanks for submitting the form"</cfoutput> --->
<!--- <cfelse> --->
<!--- 	<cfoutput>"Some Error occuered while submitting the form"</cfoutput> --->
<!--- </cfif> --->
<!--- <cfif not captcha> --->
<!--- 	<cfoutput>"Please check the the captcha form"</cfoutput> --->
<!--- </cfif> --->
