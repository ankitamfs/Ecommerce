<!--- Creating objects of required components  --->
<cfset validateObject= createObject("component","component.productauthenticate")/>
<cfset dbObject= createObject("component","component.productservice")/>
<!--- Checking if the user has tried to add a new category --->
<cfif structKeyExists(form,"addcategory_button")>

 	<!--- Creating structure to store all the errors, if any --->
	<cfset variables.emptyError = {}/>
	<!--- Calling function to check if the fields are empty, to avoid insertion of null values--->
	<cfset error = validateObject.checkEmptyField(form.categoryName,"productCategoryError")/>
	<cfset StructAppend(emptyError,error,true)/>


	<cfif emptyError["productCategoryError"] EQ "">
		<cfset variables.checkvalue = dbObject.addcategory(form.categoryName)/>
	</cfif>

	<cfif variables.checkvalue EQ 0>
		<cfoutput>
			<h3 class="error_form">
				Category Already Exists! Please enter a different Category.
			</h3>
		</cfoutput>
	<cfelse>
		<cfoutput>
			<h3 class="error_form">
				Category added!
			</h3>
		</cfoutput>
	</cfif>
</cfif>

<!--- Checking if the user has tried to add a new sub-category --->
<cfif structKeyExists(form,"addsubcategory_button")>
	<!--- Creating structure to store all the errors, if any --->
	<cfset variables.emptyError = {}/>
	<!---Function to check if the fields in add-sub-category are empty, to avoid insertion of null values--->
	<cfset error = validateObject.checkEmptyField(form.subcategoryName,"productSubCategoryError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkEmptyField(form.selectCategory,"productSelectCategoryError")/>
	<cfset StructAppend(emptyError,error,true)/>
	<cfif emptyError["productSubCategoryError"] EQ "" AND emptyError["productSelectCategoryError"] EQ "">
		<cfset variables.checkvalue = dbObject.addsubcategory(form.subcategoryName,form.selectCategory)/>
	</cfif>
</cfif>

<!--- Checking if the user has tried to add a new product --->
<cfif structKeyExists(form,"addproduct_button")>

	<!--- Creating structure to store all the errors, if any --->
	<cfset variables.emptyError = {}/>
	<!---Function to check if the fields are empty, to avoid insertion of null values in product table--->
	<cfset error = validateObject.checkEmptyField(form.productName,"productNameError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkEmptyField(form.category,"productCategoryError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkEmptyField(form.subcategory,"productSubCategoryError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkProductPrice(form.productPrice,"productPriceError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset error = validateObject.checkProductQuantity(form.productQuantity,"productQuantityError")/>
	<cfset StructAppend(emptyError,error,true)/>

	<cfset variables.flag = 0/>

	<cfloop collection="#emptyError#" item="key">
		<cfif emptyError[key] NEQ "">
			<cfset flag = 1/>
		</cfif>
	</cfloop>



	<cfif flag EQ 0>
		<!--- Sending product details to the database by invoking the required function --->
		<!--- <cfinvoke component = "component.productservice" method = "addProduct" returnVariable="check"> --->
<!--- 			<cfinvokeargument name="form" value=#form#> --->
<!--- 		</cfinvoke> --->
		<!--- <cfif check EQ 1> --->
<!--- 			<cfoutput> --->
<!--- 				<h3 class="error_form"> --->
<!--- 					Please use a different Product Name. --->
<!--- 				</h3> --->
<!--- 			</cfoutput> --->
<!--- 		<cfelse> --->
<!--- 			<cfoutput> --->
<!--- 				<h3 class="error_form"> --->
<!--- 					Product recorded! --->
<!--- 				</h3> --->
<!--- 			</cfoutput> --->
<!--- 		</cfif> --->
	</cfif>

	<!--- Uploading the Image to the server --->
	<!--- <cfif #form.imageupload# NEQ ""> --->
<!--- 		<cfset variables.addImage = dbObject.addImage(form.productName,form.imageUpload,48)/> --->
<!--- 	</cfif> --->

<cfif structKeyExists(form,"imagefile")>
	<cfdump var="Here">
	<cfdump var="#form.imagefile#">
</cfif>


</cfif>

<!--- To recieve the array of images --->

<!--- To respond with data to the ajax call to show categories dynamically --->
<cfif structKeyExists(url,"getCategories") OR structKeyExists(url,"getCategory")>
		<cfset variables.returnCategory = dbObject.getCategory()/>
		<cfset variables.categoryJson = SerializeJSON(returnCategory)/>
		<cfoutput>#categoryJson#</cfoutput>
</cfif>

<!--- To respond with data to the ajax call to show sub-categories dynamically --->
<cfif structKeyExists(url,"handleCategories")>
		<cfset variables.returnSubCategory = dbObject.getSubCategory(#url.site#)/>
		<cfset variables.subCategoryJson = SerializeJSON(returnSubCategory)/>
		<cfoutput>#subCategoryJson#</cfoutput>
</cfif>

<!--- To respond with data to the ajax call to show categories dynamically for the fiter --->
<cfif structKeyExists(url,"getData")>
		<cfset variables.returnData = dbObject.displayCategories()/>
		<cfset variables.dataJson = SerializeJSON(returnData)/>
		<cfoutput>#dataJson#</cfoutput>
</cfif>


