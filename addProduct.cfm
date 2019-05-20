<!---Adding products--->

	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="#" method="post" onsubmit = "return checkProduct()" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -353px">Product Name<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" name="productName" id="productName" onblur="productname_field()">
							<p class="error_form" id="productname_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -327px">Product Category<span class = "mandatory">*</span></label>
							<select class="form-control" id="category" name="category" onblur="productcategory_field()">
								<option selected style="display:none;color:#eee;">Select Category</option>
							</select>
							<p class="error_form" id="productcategory_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -293px">Product Sub-Category<span class = "mandatory">*</span></label>
							<select class="form-control" id="subcategory" name="subcategory" onblur="productsubcategory_field()">
								<option selected style="display:none;color:#eee;">Select Sub-Category</option>
							</select>
							<p class="error_form" id="productsubcategory_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -308px">Product Description</label>
							<input type="text" class="form-control" name="productDescription" id="productDescription">
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -358px">Product Price<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" name="productPrice" id="productPrice" onblur="productprice_field()">
							<p class="error_form" id="productprice_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -330px">Product Quantity<span class = "mandatory">*</span></label>
							<input type="text" class="form-control" name="productQuantity" id="productQuantity" onblur="productquantity_field()">
							<p class="error_form" id="productquantity_error_message"></p>
						</div>
						<div class="form-group">
							<label class="col-form-label" style="margin-left: -37px">Upload Image</label>
							<input type="file" name="imageupload" id="imageupload"accept="image/*" multiple>
						</div>
						<div class="form-group" id"thumbnail"></div>
						<div class="form-group">
							<input type="hidden" name="imagefile" id="imagefile">
						</div>
						<div class="right-w3l">
							<input type="submit" name="addproduct_button" id="addproduct_button" class="form-control" value="Add Product" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!---//Adding products--->