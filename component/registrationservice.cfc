<!---
  --- registration
  --- ------------
  ---
  --- author: ankita
  --- date:   3/8/19
  --->
<cfcomponent>

		<!---Function for authenticated sending of data to database--->

		<cffunction name = "dbHandler" access = "public" returntype = "Numeric">
			<cfargument name = "form" type = "struct" required = "true">
			<cftry>
				<!--- check variable to ensure query execution --->
				<cfset var check = 1/>
				<cfquery datasource="mystore" name="formQuery">
					SELECT Email
					FROM Person
					WHERE Email = <cfqueryparam value= #arguments.form.Email# cfsqltype="cf_sql_varchar"/>
				</cfquery>
				<cfif formQuery.RecordCount EQ 0>
					<cfset check = 0/>
					<cfset var salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
					<cfset var hashedPassword = Hash(form.Password & salt, "SHA-512")/>
					<cfquery result="myResult">
						INSERT INTO Person (Name, Email, Password, Phone_no, Salt)
						VALUES
						(
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.form.Name#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.form.Email#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#hashedPassword#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.form.ContactNumber#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#salt#" />
						)
					</cfquery>
					<cfset variables.countryResult = ""/>
					<cfquery datasource="mystore" name="formQuery">
						SELECT Country_ID
						FROM Country
						WHERE Country_Name = <cfqueryparam value= #arguments.form.country# cfsqltype="cf_sql_varchar"/>
					</cfquery>
					<cfif formQuery.RecordCount EQ 0>
						<cfquery result="countryDetails">
							INSERT INTO Country (Country_Name)
							VALUES
							(
								<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.form.country#" />
							)
						</cfquery>
						<cfset countryResult = #countryDetails.generatedKey#>
					<cfelse>
							<cfset countryResult = formQuery["Country_ID"]>
					</cfif>
					<cfset variables.stateResult = ""/>
					<cfquery datasource="mystore" name="formQuery">
						SELECT State_ID
						FROM State
						WHERE State_Name = <cfqueryparam value= #arguments.form.state# cfsqltype="cf_sql_varchar"/>
					</cfquery>


					<cfif formQuery.RecordCount EQ 0>
						<cfquery result="stateDetails">
							INSERT INTO State (State_Name,Country_ID)
							VALUES
							(
								<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.form.state#" />,
								<cfqueryparam cfsqltype="CF_SQL_INTEGER" value = "#countryResult#" />
							)
						</cfquery>
						<cfset stateResult = #stateDetails.generatedKey#>
					<cfelse>
							<cfset stateResult = formQuery["State_ID"]>
					</cfif>
					<cfquery datasource="mystore" name="formQuery">
						INSERT INTO Address (Address, City, State_ID, Person_ID)
						VALUES
						(
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.address#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.city#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#stateResult#" />,
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#myResult.generatedKey#" />
						)
					</cfquery>
				</cfif>
			<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:registrationservice , function:dbHandler, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
			<cfreturn check>
		</cffunction>

</cfcomponent>
