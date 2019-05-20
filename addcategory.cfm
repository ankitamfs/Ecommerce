<!---Adding category--->
	<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="#" method="post" onsubmit = "return checkCategory()">
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -339px">Category Name<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" name="categoryName" id="categoryName" onblur="productcategoryname_field()">
							<p class="error_form" id="categoryname_error_message"></p>
						</div>
						<div class="right-w3l">
							<input type="submit" name="addcategory_button" class="form-control" value="Add Category" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!---//Adding category--->
