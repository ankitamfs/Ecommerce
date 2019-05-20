<!DOCTYPE html>
<html>

<head>
	<title>StealDeal store</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="StealDeal Store, Shopping site, Great deals"/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>

	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Bootstrap css -->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Main css -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pop-up-box -->
	<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
	<!-- menu style -->
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->

</head>

<body>
	<!-- top-header -->
	<div class="agile-main-top">
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-8 header-right mt-lg-0 mt-2" style="margin-left:494px">
					<!-- header lists -->
					<ul id="headerlist-height" style = "margin-left:339px">
					  	<cfif NOT structkeyExists(session,'loggedInUser')>
						<li class="text-center border-right text-white">
							<a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
						</li>
						<li class="text-center text-white">
							<a href="#" data-toggle="modal" data-target="#exampleModal2" class="text-white">
								<i class="fas fa-sign-out-alt mr-2"></i>Register </a>
						</li>
						<li>
						<cfelse>
							<cfoutput>
								<p id="greeting">
									Welcome,#session.loggedInUser.name#!
								</p>
							</cfoutput>
							<a href="controller/actionlogout.cfm" id="logout">Log Out</a>
						</cfif>
						</li>
					</ul>
					<!-- //header lists -->
				</div>
			</div>
		</div>
	</div>

	<!-- modals -->
	<!-- log in -->
	<cfif NOT structkeyExists(session,'loggedInUser')>
		<cfinclude template = "loginRegister.cfm">
	<!-- log in -->
		<cfif structKeyExists(form,"login_button")>
			<cfinclude template="controller/actionlogin.cfm">
		</cfif>
	<!-- register -->
		<cfif structKeyExists(form,"submit_button")>
			<cfinclude template="controller/actionregister.cfm">
		</cfif>
	</cfif>
	<!-- //modal -->
	<!-- //top-header -->

	<!-- header-bottom-->
	<div class="header-bot">
		<div class="container">
			<div class="row header-bot_inner_wthreeinfo_header_mid">
				<!-- logo -->
				<div class="col-md-3 logo_agile">
					<h1 class="text-center">
						<a href="index.cfm" class="font-weight-bold font-italic">
							<img src="images/logo2.png" alt=" " class="img-fluid"> Steal Deal
						</a>
					</h1>
				</div>
				<!-- //logo -->
				<!-- header-bot -->
				<div class="col-md-9 header mt-4 mb-md-0 mb-4">
					<div class="row">
						<!-- search -->
						<div class="col-10 agileits_search">
							<form class="form-inline" action="#" method="post">
								<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchstring" id="searchstring">
								<button class="btn my-2 my-sm-0" type="submit" name="search" id="search">Search</button>
							</form>
						</div>
						<!-- //search -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- shop locator (popup) -->
	<!-- //header-bottom -->
	<!-- navigation -->
	<div class="navbar-inner">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar-margin">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav text-center mr-xl-5" id="navbar-spacing">
						<li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="index.cfm">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Shop by Category
							</a>
							<div class="dropdown-menu">
								<div class="agile_inner_drop_nav_info p-4">
									<div class="row">
										<div class="col-sm-6 multi-gd-img" id="shopByCategory">
										</div>
									</div>
								</div>
							</div>
						</li>

						<cfif structkeyExists(session,'loggedInUser')>
							<li class="nav-item">
							<a class="nav-link" href="index.cfm?downloadReport">Download Report</a>
							<cfif structkeyExists(url,'downloadReport')>
								<script type="text/javascript">
        							window.open("controller/downloadReport.cfm", '_blank');
   								</script>
							</cfif>
						</li>
							<cfif session.loggedInUser.role EQ "Admin">
							<!--- Including the template for adding new products --->
							<cfinclude template="addProduct.cfm">
							<!--- Including the template for adding new subcategory --->
							<cfinclude template="addsubcategory.cfm">
							<!--- Including the template for adding new category --->
							<cfinclude template="addcategory.cfm">

								<li class="nav-item">
									<a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal4" class="text-white">Add Category</a>
								</li>
								<li class="nav-item">
									<a class="nav-link"  data-toggle="modal" data-target="#exampleModal5" class="text-white">Add Sub-Category</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal3" class="text-white">Add Product</a>
								</li>
							</cfif>
						</cfif>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->

	<!---Including template for server side validations--->
	<cfif structKeyExists(form,"addcategory_button") OR structKeyExists(form,"addproduct_button") OR structKeyExists(form,"addsubcategory_button")>
		<cfinclude template="controller/actionaddproduct.cfm">
	</cfif>

	<cfif structKeyExists(url,"productId")>
		<cfset variables.productId = #url.productId#>
		<cfinvoke component="component.displayproductservice" method="getProductDetails" returnvariable="productInfo">
			<cfinvokeargument name="searchString" value="">
			<cfinvokeargument name="subCategoryId" value=0>
			<cfinvokeargument name="productId" value= #int(url.productId)#>
		</cfinvoke>
	</cfif>


	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			<div class="container">
				<ul class="w3_short">
					<li>
						<a href="index.cfm">Home</a>
						<i id="proname">|</i>
					</li>
					<li><cfoutput>#productInfo[1].productName#</cfoutput></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //page -->

	<!-- Single Page for each product -->
	<div class="banner-bootom-w3-agileits py-5">
		<div class="container py-xl-4 py-lg-2">
			<div class="row">
				<div class="col-lg-5 col-md-8 single-right-left ">
					<div class="grid images_3_of_2">
						<div class="flexslider">
							<ul class="slides">
								<li data-thumb="images/si1.jpg">
									<div class="thumb-image">
										<img src=<cfoutput>"images/#productInfo[1].productName#/#productInfo[1].productImage#.jpg"</cfoutput> data-imagezoom="true" class="img-fluid" alt=""> </div>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-lg-7 single-right-left simpleCart_shelfItem">
					<h3 class="mb-3"><cfoutput>#productInfo[1].productName#</cfoutput></h3>
					<p class="mb-3">
						<cfset variables.price = (#productInfo[1].productPrice#)/1 />
						<span class="item_price"><cfoutput>Rs. #variables.price#</cfoutput></span>
						<cfif structkeyExists(session,'loggedInUser') AND session.loggedInUser.role EQ "Admin"><label class = "fas fa-edit" style="margin-left: 10px;" href="#" data-toggle="modal" data-target="#exampleModal7" class="text-white"></label></cfif>
					</p>
					<div class="product-single-w3l">
						<p class="my-3">
							<i class="far fa-hand-point-right mr-2"></i>
							<label><cfoutput>#productInfo[1].productDescription#</cfoutput>
							<cfif structkeyExists(session,'loggedInUser') AND session.loggedInUser.role EQ "Admin">
							<span class = "fas fa-edit" style="margin-left: 10px;" href="#" data-toggle="modal" data-target="#exampleModal8" class="text-white"></span></label> </cfif>
						</p>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Single Page -->

	<!--- Including validation file --->
	<cfif structKeyExists(form,"editPrice_button") OR structKeyExists(form,"editDescription_button")>
		<cfinclude template="controller/actioneditproduct.cfm">
	</cfif>
	<!--- //Including validation file --->

	<!--- Modal for editing product price --->
	<div class="modal fade" id="exampleModal7" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<form action="#" method="post" onsubmit = "return checkNew()">
						<div class="form-group">
							<label class="col-form-label">Edit Price</label>
							<input type="text" class="form-control" name="editPrice" id="editPrice" onblur="editPrice_field()" value = <cfoutput>#variables.price#</cfoutput>>
							<p class="error_form" id="editPrice_error_message"></p>
						</div>
						<div class="right-w3l">
							<input type="submit" name="editPrice_button" class="form-control" value="Save Changes" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--- //Modal for editing product price --->

	<!--- Modal for editing product description --->
	<div class="modal fade" id="exampleModal8" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<form action="#" method="post" onsubmit = "return checkDescription()">
						<div class="form-group">
							<label class="col-form-label">Edit Description</label>
							<input type="text" class="form-control" name="editDescription" id="editDescription" onblur="editDescription_field()" value = <cfoutput>#productInfo[1].productDescription#</cfoutput>>
							<p class="error_form" id="editDescription_error_message"></p>
						</div>
						<div class="right-w3l">
							<input type="submit" name="editDescription_button" class="form-control" value="Save Changes" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--- //Modal for editing product description --->

	<!--- Modal for editing other product details --->
	<div class="modal fade" id="exampleModal9" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<form action="#" method="post" onsubmit = "">
						<div class="form-group">
							<label class="col-form-label">Edit Description</label>
							<input type="text" class="form-control" name="editDescription" id="editDescription" onblur="editDescription_field()" value = <cfoutput>#productInfo[1].productDescription#</cfoutput>>
							<p class="error_form" id="editDescription_error_message"></p>
						</div>
						<div class="right-w3l">
							<input type="submit" name="editDescription_button" class="form-control" value="Save Changes" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--- //Modal for editing other product details --->


	<!-- js-files -->
	<!-- jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/editproduct.js"></script>
	<!-- //jquery -->

	<!-- nav smooth scroll -->
	<script>
		$(document).ready(function () {
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
	<!-- //nav smooth scroll -->

	<!-- popup modal (for location)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //popup modal (for location)-->

	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

		paypals.minicarts.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
	</script>
	<!-- //cart-js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->

	<!---Add product js--->
	<script src="js/addproduct.js"></script>
	<!---//Add product js--->

	<!---Display product js--->
	<script src="js/displayproducts.js"></script>
	<!---//Display product js--->

	<!---Filter product js--->
	<script src="js/displaycategory.js"></script>
	<!---//Filter product js--->

	<!---Qquery on product js--->
	<script src="js/productquery.js"></script>
	<!---//QUery on product js--->

	<!-- imagezoom -->
	<script src="js/imagezoom.js"></script>
	<!-- //imagezoom -->

	<!-- flexslider -->
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

	<script src="js/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function () {
			$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
			});
		});
	</script>
	<!-- //FlexSlider-->

	<!-- smoothscroll -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
			};
			*/
			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->

</body>

</html>