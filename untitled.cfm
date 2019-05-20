<!-- for pagination -->
	<ul class="pagination flex-wrap mt-50 mb-70 justify-content-center" id="pagination-demo" style = "margin-top: -62px"></ul>


	<script type="text/javascript" src="js/pagination.js"></script>
	<script >
		$('#pagination-demo').twbsPagination({
		totalPages: 35,
		visiblePages: 7,
		onPageClick: function (event, page) {
		$('#page-content').text('Page ' + page);
		}
		});
	</script>

	<!-- for pagination -->

<!---Filter--->
<cfquery name="filterProduct">
SELECT p.ProductID,p.ProductName,p.ListPrice,ph.ImageSource,s.SubcategoryName,c.CategoryName,p.Quantity,p.ProductDetail,p.active
FROM Product AS p
INNER JOIN ProductPhoto AS ph ON p.ProductID = ph.ProductID
INNER JOIN ProductSubCategory AS s ON p.ProductSubCategoryID = s.ProductSubCategoryID
INNER JOIN ProductCategory AS c ON s.ProductCategoryID = c.ProductCategoryID
WHERE ph.PrimaryImg = 1
<cfif arguments.searchParam NEQ "">
AND p.ProductName LIKE <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="%#arguments.searchParam#%">
</cfif>
<cfif arguments.categoryId NEQ "">
AND c.ProductCategoryID IN (#categoryId#)
</cfif>
<cfif arguments.subCategoryId NEQ "">
AND s.ProductSubCategoryID IN (#subCategoryId#)
</cfif>
<cfif arguments.minPrice NEQ "" >
AND p.ListPrice >= #arguments.minPrice#
</cfif>
<cfif arguments.maxPrice NEQ "">
AND p.ListPrice <= #arguments.maxPrice#
</cfif>
<cfif arguments.active NEQ "all">
AND p.active = #arguments.active#
</cfif>
ORDER BY p.ProductID
</cfquery>


<!---fetch images--->
<cffunction name ="insertProductDetailWithAllImage" access="remote">
<cfargument name="productName" type="string" required="true">
<cfargument name="productQuantity" type="numeric" required="true">
<cfargument name="productPrice" type="numeric" required="true">
<cfargument name="productSubCategoryId" type="numeric" required="true">
<cfargument name="productActive" type="numeric" required="true">
<cfargument name="productDetail" type="string" required="true">
<cfargument name="length" type="numeric" required="true">
<cfargument name="deletedImagesIndex" type="string" required="true">
<cfargument name="primaryImage" type="any" required="true">
<cftry>
<cfset var totalImages = arguments.length>
<cfset var deletedImageIndex = listToArray(arguments.deletedImagesIndex)>
<cfset var primaryImageIndex = arguments.primaryImage>
<!---#### This variable holds error message####--->
<cfset var imageError = arraynew(1)>
<!--- #### If images are added to the form####--->
<cfif totalImages NEQ 0 AND totalImages NEQ ArrayLen(deletedImageIndex)>
<cfset totalImages = totalImages-1>
<!--- #### Looping to all images####--->
<cfloop from="0" to="#totalImages#" index="i">
<cfif arrayFind( deletedImageIndex, i) EQ 0>
<cfset imageFile = "file_"&i>
<cfif i EQ primaryImageIndex>
<!--- #### If primary so set 1 else 0 #### --->
<cfset var isPrimary = true>
<cfelse>
<cfset var isPrimary = false>
</cfif>
<!--- #### Uploading image file to temp directory #### --->
<cfset ArrayAppend(imageError, imageUploadToTempDirectory(imagefile, isPrimary)) >
</cfif>
</cfloop>
<!--- #### Image has Error then return with error message####--->
<cfif isError>
<cfdirectory action="delete" recurse="true" directory="#expandPath("./uploads")#">
<cfreturn imageError>
<!---#### Else ####--->
<cfelse>
<!---#### Adding Product Details to databse####--->
<cfset var productId = insertProduct(ReReplaceNoCase(arguments.productName,"\b(\w)","\u\1","ALL"), arguments.productQuantity, arguments.productPrice, arguments.productSubCategoryId, arguments.productActive, ReReplaceNoCase(arguments.productDetail,"\b(\w)","\u\1","ALL"))/>
<!--- #### List all uploaded image files from a temp directory ####--->
<cfdirectory action="list" directory="#expandPath("./uploads")#" recurse="false" name="ImageList">
<cfloop query="ImageList">
<!--- Upload Image to main directory--->
<cfset var imageName = imageUploadToServer(arguments.productName, productId, name)>
</cfloop>
</cfif>
<!---#### If form has no image ####--->
<cfelse>
<!--- ####Add product Details to database ####--->
<cfset var productId = insertProduct(ReReplaceNoCase(arguments.productName,"\b(\w)","\u\1","ALL"), arguments.productQuantity, arguments.productPrice, arguments.productSubCategoryId, arguments.productActive, ReReplaceNoCase(arguments.productDetail,"\b(\w)","\u\1","ALL"))/>
<cfset isPrimary = 1>
<!--- #### Add a default image ####--->
<cfset imageName = "image/product-img/default_product_image.jpg">
<cfset var product = insertProductPhoto(productId, isPrimary, imageName)>
</cfif>
<!--- #### Delete the Temporay Directory####--->
<cfif directoryExists("#expandPath("./uploads")#")>
<cfdirectory action="delete" recurse="true" directory="#expandPath("./uploads")#">
</cfif>
<!--- #### if Success return 1####--->
<cfset var noError = 1>
<cfreturn noError>
<cfcatch type="any">
<!--- #### If any error occured log to file and return 0####--->
<cfset var iserror = 0>
<cflog application="true" file="ecommerce_error"
text="Exception error -- Exception type: #cfcatch.Type#,Diagnostics: #cfcatch.Message# ,Line:#cfcatch.TagContext[1].Line#">
<cfreturn isError>
</cfcatch>
</cftry>
</cffunction>

---------------------------------------------------------------------------------------------------------------

PDF


<cfdocument format="PDF" saveAsName="ProductDetail.pdf">

<cfdocumentitem type="header">
<h1 style="text-align:center;">Product Detail</h1>
</cfdocumentitem>
<cfset namesOfFilters = session.filterNames>
<cfset totalProducts = session.outputProduct>
<table>
<table>
<tr bgcolor="#CCCCCC" ><th height="40px">Applied Filters:</th></tr>
<cfif namesOfFilters["CategoryName"] NEQ "">
<tr>
<td>Category</td>
<td><cfoutput>#namesOfFilters["CategoryName"]#</cfoutput></td>
</tr>
</cfif>
<cfif namesOfFilters["SubCategoryName"] NEQ "">
<tr>
<td>SubCategory</td>
<td><cfoutput>#namesOfFilters["SubCategoryName"]#</cfoutput></td>
</tr>
</cfif>
<cfif namesOfFilters["MinimumPrice"] NEQ "">
<tr>
<td>MinimumPrice</td>
<td><cfoutput>#namesOfFilters["MinimumPrice"]#</cfoutput></td>
</tr>
</cfif>
<cfif namesOfFilters["MaximumPrice"] NEQ "">
<tr>
<td>Maximum Price</td>
<td><cfoutput>#namesOfFilters["MaximumPrice"]#</cfoutput></td>
</tr>
</cfif>

<tr>
<td>Active</td>
<cfif namesOfFilters["Active"] EQ 1>
<td>Active Products</td>
<cfelseif namesOfFilters["Active"] EQ 0>
<td>Inactive Products</td>
<cfelse>
<td>Active and Inactive Products</td>
</cfif>
</tr>

</table>
</table>
<table>
<tr bgcolor="#EEEEEE">
<th height="40px" >ProductName</th>
<th height="40px" >Price</th>
<th height="40px" >CategoryName</th>
<th height="40px" >SubCategoryName</th>
<th height="40px" >Quantity</th>
<th height="40px" >Active</th>
<th height="40px" >Detail</th>
</tr>
<cfif totalProducts.recordCount GT 0>
<cfoutput query="totalProducts">
<cfif (totalProducts.currentRow MOD 2 EQ 0)>
<tr bgcolor="white">
<cfelse>
<tr bgcolor="lightgrey">
</cfif>

<td>#ProductName#</td>
<td>Rs.#ListPrice/1#</td>
<td>#CategoryName#</td>
<td>#SubcategoryName#</td>
<td>#Quantity#</td>
<td>#active#</td>
<td>#ProductDetail#</td>
</tr>
</cfoutput>
<cfelse>
<td>NO Products</td>
</cfif>
</table>
<cfdocumentitem type="footer">
<h1 style="text-align:center;">Page <cfoutput>#cfdocument.currentPageNumber#</cfoutput> of <cfoutput>#cfdocument.totalPageCount#</cfoutput></h1>
</cfdocumentitem>
</cfdocument>
