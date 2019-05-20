<!--- Creating object of the components to call the functions as per the requirements --->
<cfset validateObject= createObject("component","component.productauthenticate")/>
<cfset editObject= createObject("component","component.editproductservice")/>
<cfset getData = createObject("component","component.productservice")/>

<!--- Checking if the user has requested to make some changes to the eisting products --->
<cfif structKeyExists(form,"savechanges_button")>

	<cfset variables.emptyError = {}/>

	<cfset error = validateObject.checkEmptyField(form.editProduct,"productNameError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkProductPrice(form.editProductPrice,"productPriceError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkProductQuantity(form.editproductQuantity,"productQuantityError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset variables.flag = 0/>

	<cfloop collection="#emptyError#" item="key">
		<cfif emptyError[key] NEQ "">
			<cfset flag = 1/>
		</cfif>
	</cfloop>

	<cfif flag EQ 0>
		<!---Updating product details in the database --->
		<cfinvoke component = "component.editproductservice" method = "updateDetails">
			<cfinvokeargument name="form" value=#form#>
		</cfinvoke>
	</cfif>

</cfif>

<!--- <!--- to display the category names in edit listings ---> --->
<!--- <cfif structKeyExists(url,"getCategories")> --->
<!--- 		<cfset variables.returnCategory = getData.getCategory()/> --->
<!--- 		<cfset variables.categoryJson = SerializeJSON(returnCategory)/> --->
<!--- 		<cfoutput>#categoryJson#</cfoutput> --->
<!--- </cfif> --->
<!--- <!--- to display the sub category names in edit listings ---> --->
<!--- <cfif structKeyExists(url,"handleCategories")> --->
<!--- 		<cfset variables.returnSubCategory = getData.handleCategories(#url.site#)/> --->
<!--- 		<cfset variables.subCategoryJson = SerializeJSON(returnSubCategory)/> --->
<!--- 		<cfoutput>#subCategoryJson#</cfoutput> --->
<!--- </cfif> --->
<!--- <!--- to display the product names in edit listings ---> --->
<!--- <cfif structKeyExists(url,"getProducts")> --->
<!--- 		<cfset variables.returnProduct = getData.getProductDetails(#url.site#)/> --->
<!--- 		<cfset variables.productJson = SerializeJSON(returnProduct)/> --->
<!--- 		<cfoutput>#productJson#</cfoutput> --->
<!--- </cfif> --->

<!--- Checking if the user has requested to make some changes to the existing products --->
<cfif structKeyExists(form,"editPrice_button")>

	<cfset error = validateObject.checkProductPrice(form.editPrice,"productPriceError")/>

	<cfset variables.flag = 0/>
	<cfif error.productPriceError NEQ "">
		<cfset flag = 1/>
	</cfif>

	<cfif flag EQ 0>
		<!---Updating the new product details in the database --->
		<cfset variables.priceUpdate = editObject.updatePrice(#form.editPrice#,#url.productId#) />
	</cfif>
</cfif>

<cfif structKeyExists(form,"editDescription_button")>

	<cfset error = validateObject.checkEmptyField(form.editDescription,"productDescriptionError")/>

	<cfset variables.flag = 0/>
	<cfif error.productDescriptionError NEQ "">
		<cfset flag = 1/>
	</cfif>

	<cfif flag EQ 0>
		<!---Updating the new product details in the database --->
		<cfset variables.descriptionUpdate = editObject.updateDescription(#form.editDescription#,#url.productId#) />
	</cfif>
</cfif>
