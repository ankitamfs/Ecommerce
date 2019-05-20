<!---
  --- downloadservice
  --- ---------------
  ---
  --- author: ankita
  --- date:   4/17/19
  --->
<cfcomponent>

<!--- To generate the PDF containing all the product details --->
 <cffunction name="generatePdf" access="public" returntype="array">
	<cftry>
		<!--- declaring array to record details for each product --->
		<cfset getProducts = []/>

			<cfquery name="getProductInfo">
				Select p.Name, p.Description, p.Product_Price, p.Product_ID, p.Quantity, p.Active, s.Sub_Category, c.Category
				FROM Product as p
				INNER JOIN Product_SubCategory as s
				ON p.Sub_Category_ID = s.Sub_Category_ID
				INNER JOIN Product_Category as c
				ON s.Category_ID = c.Category_ID
				WHERE p.Product_Img IS NOT NULL
			</cfquery>

			<!--- Setting the counter variable for array index--->
			<cfset var i = 1/>

			<cfloop query = "getProductInfo">
				<cfset getProducts[i]['productName'] = #getProductInfo.Name# />
				<cfset getProducts[i]['productDescription'] = #getProductInfo.Description# />
				<cfset getProducts[i]['productPrice'] = #getProductInfo.Product_Price#/1 />
				<cfset getProducts[i]['productQuantity'] = #getProductInfo.Quantity# />
				<cfset getProducts[i]['productStatus'] = #getProductInfo.Active# />
				<cfset getProducts[i]['productSubCategory'] = #getProductInfo.Sub_Category# />
				<cfset getProducts[i]['productCategory'] = #getProductInfo.Category# />

				<cfset i++ />
			</cfloop>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:downloadservice , function:generatePdf, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn getProducts>
 </cffunction>

</cfcomponent>