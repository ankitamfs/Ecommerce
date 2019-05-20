<!--- Creating an object of the component to use the function required for ajax calls --->
<cfset productDisplay= createObject("component","component.displayproductservice")/>

<!--- To respond with data to the ajax call to show products dynamically --->
<cfif structKeyExists(url,"getAllProducts")>
	<cfset variables.returnAllProducts = productDisplay.getProductDetails("",0,0)/>
	<cfset variables.allProductJson = SerializeJSON(returnAllProducts)/>
	<cfoutput>#allProductJson#</cfoutput>
</cfif>

<!---getting data through ajax, sending it to the function and then returning the collected and serialized data to ajax--->
<cfif structKeyExists(url,"searchProducts")>
	<cfset variables.returnSearchedProducts = productDisplay.getProductDetails(#url.site#,0,0)/>
	<cfset variables.searchedProductJson = SerializeJSON(returnSearchedProducts)/>
	<cfoutput>#searchedProductJson#</cfoutput>
</cfif>

<!---getting data through ajax, sending it to the function and then returning the collected and serialized data to ajax according to the category selected--->
<cfif structKeyExists(url,"filterProducts")>
	<cfset variables.returnfilterProducts = productDisplay.getProductDetails("",#url.site#,0)/>
	<cfset variables.filterProductsJson = SerializeJSON(returnfilterProducts)/>
	<cfoutput>#filterProductsJson#</cfoutput>
</cfif>
