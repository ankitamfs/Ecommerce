 <!---\
  --- addproduct
  --- ----------
  ---
  --- author: ankita
  --- date:   3/15/19
  --->


<cfcomponent>
	<!--- Function to add a new product to the database --->
	<cffunction name = "addProduct" access = "public" returntype = "Numeric">
		<cfargument name = "form" type = "struct" required = "true">
		<cftry>
			<!--- check variable to ensure adding of new product --->
			<cfset var check = 1/>
			<cfquery name="formQuery">
				SELECT Name
				FROM Product
				WHERE Name = <cfqueryparam value= #arguments.form.productName# cfsqltype="cf_sql_varchar"/>
			</cfquery>
			<cfif formQuery.RecordCount EQ 0>
				<cfset check = 0/>
				<cfquery name="formQuery">
					INSERT INTO Product (Name, Description, Sub_Category_ID, Product_Price, Quantity, Active)
					VALUES
					(
						<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.productName#" />,
						<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.productDescription#" />,
						<cfqueryparam cfsqltype="CF_SQL_INTEGER" value = "#arguments.form.subcategory#" />,							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#arguments.form.productPrice#" />,
						<cfqueryparam cfsqltype="CF_SQL_INTEGER" value = "#arguments.form.productQuantity#" />,
						<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "Active" />
					)
				</cfquery>
			</cfif>
		<cfcatch type="any" >
			<cfset application.errorObject.catchError("productservice","addProduct", #cfcatch.Type#, #cfcatch.Message#)/>
		</cfcatch>
		</cftry>
			<cfreturn check>
	</cffunction>

	<!---Function to handle the new category to be added--->
	<cffunction name = "addcategory" access = "public" returntype = "Numeric">
		<cfargument name = "categoryName" type = "string" required = "true">
		<cftry>
			<!--- check variable to ensure adding of new category--->
			<cfset var check = 0/>
			<cfquery name="getCategory">
				SELECT Category_ID
				FROM Product_Category
				WHERE Category = <cfqueryparam value= #arguments.categoryName# cfsqltype="cf_sql_varchar"/>
			</cfquery>
			<cfif getCategory.RecordCount EQ 0>
			  <cfquery name="newCategory">
				  INSERT INTO Product_Category (Category)
						VALUES
						(
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.categoryName#" />
						)
			  </cfquery>
			  <cfset check = 1/>
			 </cfif>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:productservice , function:addcategory, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn check />
	</cffunction>

	<!---Function to handle the new sub-category to be added--->
	<cffunction name = "addsubcategory" access = "public" returntype = "Numeric">
		<cfargument name = "subcategoryname" type = "string" required = "true">
		<cfargument name = "categoryid" type = "string" required = "true">
		<cftry>
			<!--- check variable to ensure adding of new sub-category--->
			<cfset var check = 0/>
			<cfquery name="getSubCategory">
				SELECT Sub_Category_ID
				FROM Product_SubCategory
				WHERE Sub_Category = <cfqueryparam value= #arguments.subcategoryname# cfsqltype="cf_sql_varchar"/>
			</cfquery>
			<cfif getSubCategory.RecordCount EQ 0>
				<cfset check = 1/>
			   <cfquery name="newSubCategory">
				  INSERT INTO Product_SubCategory (Sub_Category, Category_ID)
 						VALUES
 						(
							<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.subcategoryname#" />,
 							<cfqueryparam cfsqltype="CF_SQL_integer" value="#arguments.categoryid#" />
 						)
 			  </cfquery>
			 </cfif>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:productservice , function:addsubcategory, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn check>
	</cffunction>

	<!--- Function to send category details through AJAX --->
	<cffunction name = "getCategory" access = "public" returntype="array">
		<cftry>
			<!--- Declaring array to store the category details to be fetched from database --->
			<cfset var categoryDetails = []/>
			<cfquery name="getCategoryDetails">
				SELECT Category, Category_ID
				FROM Product_Category
			</cfquery>

			<!--- counter variable for the array index --->
			<cfset var i = 1/>

			<cfloop query = "getCategoryDetails">
				<cfset categoryDetails[i]['categoryName'] = #getCategoryDetails.Category# />
				<cfset categoryDetails[i]['categoryId'] = #getCategoryDetails.Category_ID# />

				<cfset i++ />
			</cfloop>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:productservice , function:getCategory, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn categoryDetails>
	</cffunction>

	<!--- Function to send sub category details through AJAX --->
	<cffunction name = "getSubCategory" access = "remote" returntype="any">
		<cfargument name="categoryId" required="false" type="Numeric">
		<cftry>
			<!--- declaring array to store the subcatgeory details fetched --->
			<cfset var subcategoryDetails = []/>
			<cfquery name="getSubCategoryDetails">
				SELECT Sub_Category, Sub_Category_ID
				FROM Product_SubCategory
				<cfif arguments.categoryId NEQ 0>
					WHERE Category_ID = <cfqueryparam value= #arguments.categoryId# cfsqltype="cf_sql_integer"/>
				</cfif>
			</cfquery>
			<!--- counter variable for the array index --->
			<cfset var i = 1/>

			<cfloop query = "getSubCategoryDetails">
				<cfset subcategoryDetails[i]['subcategoryName'] = #getSubCategoryDetails.Sub_Category# />
				<cfset subcategoryDetails[i]['subcategoryId'] = #getSubCategoryDetails.Sub_Category_ID# />
				<cfset i++ />
			</cfloop>
		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:productservice , function:getSubCategory, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn subcategoryDetails>
</cffunction>


	<!--- Function to upload the image of any product --->
	<cffunction name = "addImage" access = "public" returntype = "any">
		<cfargument name="productName" type="string" required="true">
		<cfargument name="imageUpload" required="true" type="array">
		<cfargument name="productID" required="true">




<!--- 		<cfdirectory action="create" directory="#expandPath("././images/#arguments.productName#")#"> --->
<!--- 		<cffile action="uploadAll" accept="image/jpeg"  filefield="imageUpload" destination="#expandPath("././images/#arguments.productName#")#" nameconflict="makeunique" result="uploadResult" > -->
<!-- <!--- 		<cfloop index="idx" from="1" to="#arraylen(imageFileArray)#"> ---> --->
<!--- 			<cfdump var="#imageFileArray[idx]#"> --->
<!--- 		</cfloop> --->


<cfdump var="#imageUpload#">
<cfabort>



		<cftry>
			<cfif directoryExists("././images/#arguments.productName#")>
				<!--- Generating a random number --->
				<cfset var randomNumber =  CreateUUID() >
				<!--- Creating a unique filename --->
				<cfset  variables.fileName = #arguments.productName# & '_'& '_' & #randomNumber#/>
				<!--- Checking if File Exists --->
				<cfloop condition ="FileExists('/image/#arguments.productName#/#variables.fileName#') EQ TRUE ">
					<cfset randomNumber =  CreateUUID() >
					<cfset  variables.fileName = #arguments.productName# &'_' & '_' & #randomNumber#/>
				</cfloop>
			<cfelse>
				<cfdirectory action="create" directory="#expandPath("././images/#arguments.productName#")#" mode = "777">
				<!--- Generating a random number --->
				<cfset var randomNumber =  CreateUUID() >
				<!--- Creating a unique filename --->
				<cfset  variables.fileName = #arguments.productName# & '_'& '_' & #randomNumber#/>
				<!--- Checking if File Exists --->
				<cfloop condition ="FileExists('/image/#arguments.productName#/#variables.fileName#') EQ TRUE ">
					<cfset randomNumber =  CreateUUID() >
					<cfset  variables.fileName = #arguments.productName# &'_' & '_' & #randomNumber#/>
				</cfloop>
			</cfif>

			<cfset variables.imagepath = ExpandPath("/") & "images\#arguments.productName#\" & variables.fileName & ".jpg"/>
			<!--- Uploading the image to the server --->
			<cffile action="upload" accept="image/jpeg"  filefield="imageUpload" destination="#variables.imagepath#" result="uploadResult" >
			<!--- Returning the unique file name with path --->


			<cfquery name="insertImage">
				  UPDATE Product
				  SET Product_Img = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value = "#variables.fileName#" />
				  WHERE Name = <cfqueryparam value= #arguments.productName# cfsqltype="cf_sql_varchar"/>
			</cfquery>


		<cfcatch type="any" >
			<cflog application="true" file="ecommerce_error"
			 text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# , Component:productService , function:addImage, Line:#cfcatch.TagContext[1].Line#">
		</cfcatch>
		</cftry>
		<cfreturn true>

	</cffunction>

	<!---to display categories in show by category--->

	<cffunction name="displayCategories" access="remote" returntype="any">
		<!---creating main structure to keep the categorized data--->
		<cfset var shopbycategory = {}/>
		<!---creating child structure to store data category wise--->
		<cfset var categorydetails = {}/>
		<!---creating array to store various sub-categories under one category--->
		<cfset var subcatarray = []/>
		<cftry>
			<cfquery name="category">
				SELECT c.Category, c.Category_ID, s.Sub_Category, s.Sub_Category_ID
				FROM Product_Category AS c
				INNER JOIN Product_SubCategory as s
				ON c.Category_ID = s.Category_ID
				ORDER BY c.Category_ID
			</cfquery>

			<!---creating the varibale to manage the index of the array--->
			<cfset var i = 1/>
			<!---setting the initial category value for categorizing in a proper manner--->
			<cfset var prev = #category.Category_ID#/>

			<cfloop query = "category">
				<!---checking and creating new structure to maintain all the category details--->
				<cfif #category.Category_ID# EQ prev>
					<cfif NOT structKeyExists(categorydetails, "#category.Category_ID#")>
						<cfset structInsert(categorydetails, "Category", "#category.Category#", true)/>
					</cfif>
					<!---creating the array of structures to store sub category details for a particular category--->
					<cfset subcatarray[i]['subcategoryName'] = #category.Sub_Category# />
					<cfset subcatarray[i]['subcategoryId'] = #category.Sub_Category_ID# />
					<!---inserting the array of structures in the immediate parent structure--->
					<cfset structInsert(categorydetails, "subCategory", subcatarray, true)/>
					<!---inserting the category structure in the main parent structure which is to be passed to ajax--->
					<cfset structInsert(shopbycategory, "#category.Category_ID#", categorydetails, true)/>
				 <cfelse>
				    <cfset i=1 />
				    <!---clearing the structure and array to store fresh data--->
					<cfset  categoryDetails={}>
					<cfset  subcatarray = []/>
					<cfset structInsert(categorydetails, "Category", "#category.Category#", true)/>
					<!---creating the array of structures to store sub category details for a particular category--->
					<cfset subcatarray[i]['subcategoryName'] = #category.Sub_Category# />
					<cfset subcatarray[i]['subcategoryId'] = #category.Sub_Category_ID# />
					<!---inserting the array of structures in the immediate parent structure--->
					<cfset structInsert(categorydetails, "subCategory", subcatarray, true)/>
					<!---inserting the category structure in the main parent structure which is to be passed to ajax--->
					<cfset structInsert(shopbycategory, "#category.Category_ID#", categorydetails, true)/>
				</cfif>
				<cfset prev = #category.Category_ID#>
				<cfset i++ />
			</cfloop>
			<cfreturn "#shopbycategory#">
			<cfcatch type="any">
				<cflog
					text = "Exception Error : Type=#cfcatch.type# Message=#cfcatch.message#"
					file = "ecommerce_error"
					log = "error:">
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>