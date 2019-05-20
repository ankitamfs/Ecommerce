<!---
  --- editproductservice
  --- ------------------
  ---
  --- author: ankita
  --- date:   4/17/19
  --->
<cfcomponent>


	<!--- Function to product details through AJAX --->
	<cffunction name = "getProducts" access = "public" returntype="any">
		<!--- declaring array to save the details of all the products --->
		<cftry>
			<cfset var productDetails = []/>
			<cfquery name="getProductDetails">
				SELECT Name, Product_ID, Product_Img
				FROM Product
			</cfquery>

			<!--- counter variable to set the index for the array being created--->
			<cfset var i = 1/>

			<cfloop query = "getProductDetails">
				<cfset productDetails[i]['productName'] = #getProductDetails.Name# />
				<cfset productDetails[i]['productId'] = #getProductDetails.Product_ID# />
				<cfset productDetails[i]['productImage'] = #getProductDetails.Product_Img# />
				<cfset i++ />
			</cfloop>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:editproductservice , function:getProducts, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>

		<cfreturn productDetails>
	</cffunction>

	<!---to update the product information in the database--->

	<cffunction access="public" name="updateDetails">
		<cfargument name="form" type="struct" required="true">
		<cftry>
			<cfquery name = "updateProductDetails">
				UPDATE Product
				SET Description = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.editProductDescription#" />,
					Product_Price = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.editProductPrice#" />,
					Quantity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.editProductQuantity#" />,
					Active = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.productStatus#" />
				WHERE Product_ID = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.editProduct#" />
			</cfquery>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:editproductservice , function:updateDetails, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>

	</cffunction>

	<!---to update the product information in the database--->

	<cffunction access="public" name="updatePrice" returntype="Numeric">
		<cfargument name="price" type="string" required="true">
		<cfargument name="productId" type="string" required="true">
		<cftry>
			<cfquery name = "updatePriceDetails">
				UPDATE Product
				SET Product_Price = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.price#" />
				WHERE Product_ID = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.productId#" />
			</cfquery>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:editproductservice , function:updatePrice, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn 1/>
	</cffunction>

	<!---to update the product information in the database--->

	<cffunction access="public" name="updateDescription" returntype="Numeric">
		<cfargument name="description" type="string" required="true">
		<cfargument name="productId" type="string" required="true">
		<cftry>
			<cfquery name = "updatePriceDetails">
				UPDATE Product
				SET Description = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.description#" />
				WHERE Product_ID = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.productId#" />
			</cfquery>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:editproductservice , function:updateDescription, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn 1/>
	</cffunction>

</cfcomponent>