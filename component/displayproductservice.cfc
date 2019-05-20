<!---
  --- displayproductservice
  --- ---------------------
  ---
  --- author: ankita
  --- date:   4/2/19
  --->
<cfcomponent>

<cffunction name="getProductDetails" access="public" returntype="array">
	<cfargument name="searchString" type="string" required="false">
	<cfargument name="subCategoryId" type="Numeric" required="false">
	<cfargument name="productId" type="Numeric" required="false">
		<cftry>
			<!---array to store product data--->
			<cfset var getProducts = []/>
			<cfset var getProductDetails = {}/>

			<cfquery name = "getProductDetails">
				SELECT *
				FROM Product
				<cfif NOT arguments.searchString EQ "" OR NOT arguments.subCategoryId EQ 0 OR NOT arguments.productId EQ 0>
					WHERE 1 = 1
					<cfif NOT arguments.searchString EQ "">
						AND Name LIKE '%#arguments.searchString#%'
					</cfif>
					<cfif NOT arguments.subCategoryId EQ 0>
						AND Sub_Category_ID = <cfqueryparam value= #arguments.subCategoryId# cfsqltype="cf_sql_integer"/>
					</cfif>
					<cfif NOT arguments.productId EQ 0>
						AND Product_ID = <cfqueryparam value= #arguments.productId# cfsqltype="cf_sql_integer"/>
					</cfif>
				<cfelse>
					WHERE 1=1
				</cfif>
				<cfif NOT (structkeyExists(session,'loggedInUser') AND session.loggedInUser.role EQ "Admin")>
					 AND Active = 'Active'
				</cfif>
			</cfquery>



			<!--- Setting the counter variable for array index--->
			<cfset var i = 1/>

			<cfloop query = "getProductDetails">
				<cfset getProducts[i]['productName'] = #getProductDetails.Name# />
				<cfset getProducts[i]['productDescription'] = #getProductDetails.Description# />
				<cfset getProducts[i]['productPrice'] = #getProductDetails.Product_Price#/1 />
				<cfset getProducts[i]['productImage'] = #getProductDetails.Product_Img# />
				<cfset getProducts[i]['productId'] = #getProductDetails.Product_ID# />
				<cfset getProducts[i]['productActive'] = #getProductDetails.Active# />
				<cfset getProducts[i]['productQuantity'] = #getProductDetails.Quantity# />

				<cfset i++ />
			</cfloop>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:displayproductservice , function:getProductDetails, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn getProducts>
	</cffunction>

</cfcomponent>
