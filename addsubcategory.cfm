<!---Adding subcategory--->
	<div class="modal fade" id="exampleModal5" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<cfif structKeyExists(form,"addsubcategory_button")>
				</cfif>
					<h5 class="modal-title text-center">Add Subcategory</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form  method="post" onsubmit = "return checkSubCategory()">
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -394px">Category<span class = "mandatory">*</span></label>
							<select class="form-control" id="selectCategory" name="selectCategory">
								<option selected style="display:none;color:#eee;">Select Category</option>
							</select>
							<p class="error_form" id="selectcategory_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -316px">Subcategory Name<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" name="subcategoryName" id="subcategoryName" onblur="productsubcategoryname_field()">
							<p class="error_form" id="subcategoryname_error_message"></p>
						</div>
						<div class="right-w3l">
							<input type="submit" name="addsubcategory_button" class="form-control" value="Add Sub-Category" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!---//Adding subcategory--->