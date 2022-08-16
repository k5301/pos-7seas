<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panelLogin.aspx.cs" Inherits="panelLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>POS - Login</title>
    <!--favicon-->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon"/>
    <!-- Bootstrap core CSS-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- animate CSS-->
    <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
    <!-- Icons CSS-->
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <!-- Custom Style-->
    <link href="assets/css/app-style.css" rel="stylesheet"/>
    <style>
        body{
            background:url(images/custom/bg-loginBody.jpg);background-size:cover;background-repeat:no-repeat
        }
        .card-group {
            box-shadow: 0 2px 6px 0 rgba(50,50,50,0.6), 0 2px 6px 0 rgba(75,7,0,0.5);
        }
        .bg-signin2 {
            background-color: rgba(0, 140, 255,0);
            background-image: url(images/custom/bg-login.jfif);
            background-size:cover;
        }
        .text-white {
            color: #ff6500!important;
        }
        .error{
            border:1px solid red;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>--%>
    <div id="wrapper">
        <div class="height-100v d-flex align-items-center justify-content-center">
	        <div class="card-authentication2 mx-auto my-5">
	        <div class="card-group">
	    	    <div class="card mb-0">
	    	        <div class="bg-signin2"></div>
	    		    <div class="card-img-overlay rounded-left my-5">
                        <%--<h1 class="text-white">My Restaurent</h1>--%>
                        <%--<h1 class="text-white">Ipsum Dolor</h1>
                        <p class="card-text text-white pt-3">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>--%>
                    </div>
	    	    </div>

	    	    <div class="card mb-0 ">
                    <div class="card-body"> 
                        <ul class="nav nav-tabs nav-tabs-primary">
                          <li class="nav-item">
                            <a id="admin" class="nav-link active" data-toggle="tab" href="#tabe-1"><i class="icon-menu"></i> <span class="hidden-xs">Admin</span></a>
                          </li>
                          <li class="nav-item">
                            <a id="manager" class="nav-link" data-toggle="tab" href="#tabe-2"><i class="icon-user"></i> <span class="hidden-xs">Branch Member</span></a>
                          </li>
                 
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                          
                            <div id="tabe-1" class="container tab-pane active">
                            <div class="card-content p-3">
	    				    <div class="text-center">
					 		    <img src="assets/images/logo-icon.png"/>
					 	    </div>
					        <div class="card-title text-uppercase text-center py-3">Sign In</div>
					        
						        <div class="form-group">
						        <div class="position-relative has-icon-left">
							        <label for="txtadminusername" class="sr-only">Username</label>
                                        <asp:TextBox ID="txtadminusername" class="form-control" placeholder="Username" required="required" runat="server"></asp:TextBox>
								        <%--<input type="text" id="exampleInputUsername" class="form-control" placeholder="Username"/>--%>
								        <div class="form-control-position">
									    <i class="icon-user"></i>
								    </div>
						        </div>
						        </div>
						        <div class="form-group">
						        <div class="position-relative has-icon-left">
							        <label for="txtadminpassword" class="sr-only">Password</label>
                                        <asp:TextBox ID="txtadminpassword" type="password" class="form-control" placeholder="Password" required="required" runat="server"></asp:TextBox>
							        <%--<input type="password" id="exampleInputPassword" class="form-control" placeholder="Password"/>--%>
							        <div class="form-control-position">
								        <i class="icon-lock"></i>
							        </div>
						        </div>
						        </div>
						        <div class="form-row mr-0 ml-0">
						        <div class="form-group col-6">
							        <div class="icheck-primary">
				                    <input type="checkbox" id="user-checkbox" checked="" />
				                    <label for="user-checkbox">Remember me</label>
							        </div>
							    </div>
							    <div class="form-group col-6 text-right">
							        <a href="authentication-reset-password2.html">Reset Password</a>
							    </div>
						    </div>
                            <asp:LinkButton ID="lnkAdmin" CssClass="d-none" runat="server" OnClick="lnkAdmin_Click">adminLogin</asp:LinkButton>
						    <button type="submit" id="btnAdmin" class="btn btn-outline-primary btn-block waves-effect waves-light">Sign In</button>
						     <div class="text-center pt-3">
						    <%--<p>or Sign in with</p>
						    <a href="javascript:void()" class="btn-social-text btn-outline-facebook waves-effect waves-light m-1"><i class="fa fa-facebook-square"></i> <span>facebook</span></a>
						    <a href="javascript:void()" class="btn-social-text btn-outline-google-plus waves-effect waves-light m-1"><i class="fa fa-google-plus"></i> <span>google+</span></a>--%>
							    <hr>
						    <p class="text-muted mb-0">Do not have an account? <a href="register.aspx"> Register here</a></p>
						    </div>
					    
				        </div>
                          </div>
                          
                            <div id="tabe-2" class="container tab-pane fade">
                              <div class="card-content p-3 mt-4 mb-5">
	    				        <div class="text-center">
					 		        <img src="assets/images/logo-icon.png">
					 	        </div>
					            
                                  <div class="card-title text-uppercase text-center py-3">Sign In</div>
					        
						            <div class="form-group">
						            <div class="position-relative has-icon-left">
							            <label for="txtbmusername" class="sr-only">Username</label>
                                        <asp:TextBox ID="txtbmusername" class="form-control" placeholder="Username" required="required" runat="server"></asp:TextBox>
								            <%--<input type="text" id="bmUsername" class="form-control" placeholder="Username"/>--%>
								            <div class="form-control-position">
									        <i class="icon-user"></i>
								        </div>
						            </div>
						            </div>
						            <div class="form-group">
						            <div class="position-relative has-icon-left">
							            <label for="txtbmpassword" class="sr-only">Password</label>
                                        <asp:TextBox ID="txtbmpassword" type="password" class="form-control" placeholder="Password" required="required" runat="server"></asp:TextBox>
							            <%--<input type="password" id="bmPassword" class="form-control" placeholder="Password"/>--%>
							            <div class="form-control-position">
								            <i class="icon-lock"></i>
							            </div>
						            </div>
						            </div>
						            <div class="form-row mr-0 ml-0">
						            <div class="form-group col-6">
							            <div class="icheck-primary">
				                        <input type="checkbox" id="bm-checkbox" checked="" />
				                        <label for="user-checkbox">Remember me</label>
							            </div>
							        </div>
							        <%--<div class="form-group col-6 text-right">
							            <a href="authentication-reset-password2.html">Reset Password</a>
							        </div>--%>
						        </div>
                                <asp:LinkButton ID="lnkBranch" CssClass="d-none" runat="server" OnClick="lnkBranch_Click">branchLogin</asp:LinkButton>
						        <button type="submit" id="btnBranch" class="btn btn-outline-primary btn-block waves-effect waves-light">Sign In</button>
						        <%--<div class="text-center pt-3">
						        <p>or Sign in with</p>
						        <a href="javascript:void()" class="btn-social-text btn-outline-facebook waves-effect waves-light m-1"><i class="fa fa-facebook-square"></i> <span>facebook</span></a>
						        <a href="javascript:void()" class="btn-social-text btn-outline-google-plus waves-effect waves-light m-1"><i class="fa fa-google-plus"></i> <span>google+</span></a>
							        <hr>
						        <p class="text-muted mb-0">Do not have an account? <a href="authentication-signup2.html"> Sign Up here</a></p>
						        </div>--%>
					    
				            </div>
                              </div>
                          
                        </div>
                      </div>
           
	    		    <%--<div class="card-body">
	    			    <div class="card-content p-3">
	    				    <div class="text-center">
					 		    <img src="assets/images/logo-icon.png">
					 	    </div>
					        <div class="card-title text-uppercase text-center py-3">Sign In</div>
					        
						        <div class="form-group">
						        <div class="position-relative has-icon-left">
							        <label for="exampleInputUsername" class="sr-only">Username</label>
								        <input type="text" id="exampleInputUsername" class="form-control" placeholder="Username">
								        <div class="form-control-position">
									    <i class="icon-user"></i>
								    </div>
						        </div>
						        </div>
						        <div class="form-group">
						        <div class="position-relative has-icon-left">
							        <label for="exampleInputPassword" class="sr-only">Password</label>
							        <input type="password" id="exampleInputPassword" class="form-control" placeholder="Password">
							        <div class="form-control-position">
								        <i class="icon-lock"></i>
							        </div>
						        </div>
						        </div>
						        <div class="form-row mr-0 ml-0">
						        <div class="form-group col-6">
							        <div class="icheck-primary">
				                    <input type="checkbox" id="user-checkbox" checked="" />
				                    <label for="user-checkbox">Remember me</label>
							        </div>
							    </div>
							    <div class="form-group col-6 text-right">
							        <a href="authentication-reset-password2.html">Reset Password</a>
							    </div>
						    </div>
						    <button type="button" class="btn btn-outline-primary btn-block waves-effect waves-light">Sign In</button>
						        <div class="text-center pt-3">
						    <p>or Sign in with</p>
						    <a href="javascript:void()" class="btn-social-text btn-outline-facebook waves-effect waves-light m-1"><i class="fa fa-facebook-square"></i> <span>facebook</span></a>
						    <a href="javascript:void()" class="btn-social-text btn-outline-google-plus waves-effect waves-light m-1"><i class="fa fa-google-plus"></i> <span>google+</span></a>
							    <hr>
						    <p class="text-muted mb-0">Do not have an account? <a href="authentication-signup2.html"> Sign Up here</a></p>
						    </div>
					    
				        </div>
				    </div>--%>
	    	    </div>
                <div class="modal fade" id="signingIn" data-backdrop="static">
                    <div class="modal-dialog modal-sm modal-dialog-centered">
                    <div class="modal-content animated fadeIn" style="background-color:transparent;border:none">
                        <div class="modal-body" style="text-align:center">
                            <div class="spinner-grow" style="width: 5rem; height: 5rem;" role="status">
                                <span class="sr-only">logging Out...</span>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <button type="button" class="btn btn-danger waves-effect waves-light btn-sm d-none" id="alert-error">Click me</button>
	            </div>
	        </div>
	        </div>
    
            <!--Start Back To Top Button-->
        <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
        <!--End Back To Top Button-->
	    </div><!--wrapper-->
	    <%--</ContentTemplate></asp:UpdatePanel>--%>
        <!-- Bootstrap core JavaScript-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
         <!--Sweet Alerts -->
          <script src="assets/plugins/alerts-boxes/js/sweetalert.min.js"></script>
          <script src="assets/plugins/alerts-boxes/js/sweet-alert-script.js"></script>

        <script>
            function pageLoad() {
                $("#signingIn").modal('hide');
            }


            
            $("#<%= txtadminusername.ClientID %>").keyup(function () {
            if ($("#<%= txtadminusername.ClientID %>").val() != "") {
                $("#<%= txtadminusername.ClientID %>").removeClass("error");
            }
            });
            $("#<%= txtadminpassword.ClientID %>").keyup(function () {
                if ($("#<%= txtadminpassword.ClientID %>").val() != "") {
                    $("#<%= txtadminpassword.ClientID %>").removeClass("error");
                }
            });
            $("#<%= txtbmusername.ClientID %>").keyup(function () {
                if ($("#<%= txtbmusername.ClientID %>").val() != "") {
                    $("#<%= txtbmusername.ClientID %>").removeClass("error");
                }
            });
            $("#<%= txtbmpassword.ClientID %>").keyup(function () {
                if ($("#<%= txtbmpassword.ClientID %>").val() != "") {
                    $("#<%= txtbmpassword.ClientID %>").removeClass("error");
                }
            });

               

            

            $("#btnAdmin").click(function () {

                var au = $("#<%= txtadminusername.ClientID %>");
                var ap = $("#<%= txtadminpassword.ClientID %>");
                if (au.val() == "") {
                    au.addClass("error"); au.focus();
                }
                else if (ap.val() == "") {
                    ap.addClass("error"); ap.focus();
                }
                else {
                    //$("#alert-error").click();
                    //$("#signingIn").modal({
                    //    show: true,
                    //    backdrop: 'static',
                    //    keyboard: false
                    //});
                    __doPostBack('lnkAdmin', '');
                }
            });

            $("#btnBranch").click(function () {
                var bu = $("#<%= txtbmusername.ClientID %>");
                var bp = $("#<%= txtbmpassword.ClientID %>");
                if (bu.val() == "") {
                    bu.addClass("error"); bu.focus();
                }
                else if (bp.val() == "") {
                    bp.addClass("error"); bp.focus();
                }
                else {
                    //$("#signingIn").modal({
                    //    show: true,
                    //    backdrop: 'static',
                    //    keyboard: false
                    //});
                    __doPostBack('lnkBranch', '');
                }
            });
            
            $("#alert-error").click(function () {
                console.log("by");
                swal("Somthing Wrong!", "You have entered wrong username or password!,", "error");
            });


            function wrongCredential() {
                //console.log("in");
                //$("#signingIn").modal('hide');
                //$("#alert-error").click();
                alert("Wrong username or Password");
            }

            function manager() {
                $("#manager").click();
                $("#<%= txtbmpassword.ClientID %>").focus();
            }

            function fap() {
                 $("#<%= txtadminpassword.ClientID %>").focus();
            }
        </script>

    </div>
    </form>
</body>
</html>
