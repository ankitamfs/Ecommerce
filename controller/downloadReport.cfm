<!--- Invoking the function to get product details from the database --->
<cfinvoke component = "component.downloadservice" method="generatePdf" returnvariable="check">
</cfinvoke>
<!--- Generating a PDF document that would contain the product details --->
<cfdocument format="PDF" saveAsName="ProductDetail.pdf">
<!--- Declaring the heading of the PDF document --->
<cfdocumentitem type="header">
<h1 style="text-align:center;">Product Detail</h1>
</cfdocumentitem>
<!--- Caching the data returned by invoking the function --->
<cfset totalProducts = check/>
<!--- Creating the table format to display the product details --->
<table>
<tr bgcolor="#EEEEEE">
<th height="40px" >ProductName</th>
<th height="40px" >Price</th>
<th height="40px" >CategoryName</th>
<th height="40px" >SubCategoryName</th>
<!--- Displaying Quantity/Status of Availabilty of the Products according to the logged in user --->
<cfif structkeyExists(session,'loggedInUser') AND session.loggedInUser.role EQ "Admin">
	<th height="40px" >Quantity</th>
<cfelse>
	<th height="40px" >Status</th>
</cfif>
<th height="40px" >Description</th>
</tr>

<!--- Managing the layout and displaying the data per product --->
<cfif ArrayLen(totalproducts) GT 0>
<cfset field = 1/>
	<cfoutput>
	<cfloop array="#totalproducts#" index="i">
	 	<cfif (field MOD 2 EQ 0)>
			<tr bgcolor="white">
		<cfelse>
			<tr bgcolor="lightgrey">
		</cfif>

	   <td>#i.productName#</td>
	   <td>Rs.#i.productPrice/1#</td>
	   <td>#i.productCategory#</td>
	   <td>#i.productSubCategory#</td>

	   <cfif structkeyExists(session,'loggedInUser') AND session.loggedInUser.role EQ "Admin">
		  <td>#i.productQuantity#</td>
	   <cfelse>
		  <td>#i.productStatus#</td>
	   </cfif>

	   <td>#i.productDescription#</td>
	   </tr>
	   <cfset field++/>
	</cfloop>
   </cfoutput>

<cfelse>

  <td>NO Products</td>

</cfif>
</table>

<cfdocumentitem type="footer">
<h1 style="text-align:center;">Page <cfoutput>#cfdocument.currentPageNumber#</cfoutput> of <cfoutput>#cfdocument.totalPageCount#</cfoutput></h1>
</cfdocumentitem>

</cfdocument>
