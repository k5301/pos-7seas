<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>Rocker - Bootstrap4  Admin Dashboard Template</title>
  <!--favicon-->
  <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon"/>
    
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
  <!--Select Plugins-->
  <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" />
  <!-- simplebar CSS-->
  <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
  <!-- Dropzone css -->
  <link href="assets/plugins/dropzone/css/dropzone.css" rel="stylesheet" type="text/css">
  <!-- Bootstrap core CSS-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Sidebar CSS-->
  <link href="assets/css/sidebar-menu.css" rel="stylesheet"/>
  <!-- Custom Style-->
  <link href="assets/css/app-style.css" rel="stylesheet"/>

  <link href="assets/css/customs/imageupload.css" rel="stylesheet"/>
  <link href="assets/css/customs/standard.css" rel="stylesheet"/>
  <link href="assets/css/customs/app-register.css" rel="stylesheet"/>
  <style>
    label.error.have-alert{
        color:blue;
    }
    .errorhighlight{
        border: 1px solid red !important;
    }
    .fieldset{
        border: 1px solid blue !important;
    }
    :disabled{
        cursor:not-allowed;
    }
  </style>
    
</head>
<body class="hideScrollbar bgimg">
    <form id="signupForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblProfile" runat="server" CssClass="d-none" Text=""></asp:Label>
        <asp:Label ID="lblLogo" runat="server" CssClass="d-none" Text=""></asp:Label>
     <div id="wrapper" class="mh-100">
        <div class="text-center mt-3">
		    <img src="assets/images/logo-icon.png"/><span class="text-warning" style="font-size:30px;font-weight:bolder">Register</span>
	    </div>
      <div class="row mx-lg-5 mx-1 mt-2">
         

         <div class="col-xl-9 col-lg-10 mx-auto">
                  <div class="card">
                    <div class="card-body">
                        <div id="divMain" class="styleScrollbar heightResponsive">
                                <h4 class="form-header text-uppercase">
                              <i class="fa fa-address-book-o"></i>
                               User Profile
                            </h4>
                            <div class="form-group row" style="margin-right:0px">
                          
                                <div class="col-sm-3 px-3  py-sm-0 py-3">
                                    
                                   <div class="img-container">
                                      <div id="profile-wrapper" class="img-wrapper">
                                        <div class="img-main">
                                            <img id="profile-img" style="background-size:cover" class="img-alt" src="" alt="" />
                                        </div>
                                        <div class="content1">
                                          <div class="img-icon">
                                            <img id="default" class="img-alt" style="width:100px;height:100px" src="assets/images/avatars/default.jfif" alt="" />
                                          </div>
                                          <div class="img-text">Profile Image</div>
                                        </div>
                                        <div id="profile-cancel" class="img-cancel">
                                          <i class="fas fa-times"></i>
                                        </div>
                                        <div class="img-choose" id="choose-profile" style="cursor:pointer"><i class="icon-picture m-auto"></i></div>
                                      </div>
                                       
                                       <asp:FileUpload ID="profile_choose" accept="image/*" hidden="hidden" runat="server" />
                                     
                                    </div>
                              </div>
                            

                                <div class="col-sm-9 px-3">
                                    <div class="row">
                                        <div class="col-sm-6">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="user_name" class="sr-only">Name</label>
                                                    <input id="user_name" type="text" class="form-control" placeholder="Name" name="name"/>
								                
								                    <div class="form-control-position">
									                <i class="icon-user"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-6">
                              
                                              <div class="form-group">
						                        <div class="position-relative has-icon-left">
							                        <label for="user_phone" class="sr-only">Phone</label>
                                                    <%--<asp:TextBox ID="txtPhone" type="text" class="form-control" placeholder="Phone" name="phone" runat="server"></asp:TextBox>--%>
                                                    
								                        <input type="text" inputmode="numeric" autocomplete="false" id="user_phone"  class="form-control" name="phone" placeholder="Phone"/>
								                        <div class="form-control-position">
									                    <i class="icon-phone"></i>
								                    </div>
						                        </div>
						                        </div>
                                          </div>
                                        <div class="col-sm-6">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="user_email" class="sr-only">Email</label>
                                                    <input id="user_email" type="email" class="form-control" placeholder="Email" name="emailid"/>
								                    <div class="form-control-position">
									                <i class="icon-envelope"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-6">
                                              <div class="form-group">
						                        <div class="position-relative has-icon-left">
							                        <label for="username" class="sr-only">Username</label>
                                                    <input id="username" type="text" class="form-control" placeholder="Username"  name="username"/>
								                        <div class="form-control-position">
									                    <i class="icon-user"></i>
								                    </div>
						                        </div>
						                        </div>
                                          </div>
                                        <div class="col-sm-6">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="user_password" class="sr-only">Password</label>
                                                    <input id="user_password" type="password" class="form-control" placeholder="Password" name="urpassword"/>
								                    <div class="form-control-position">
									                    <i class="icon-lock"></i>
								                    </div>
                                                    <div id="show_password" class="form-control-position-right">
									                    <i class="fas fa-eye" style="color:#999"></i>
								                    </div>
                                                    
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-6">
                              
                                              <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="user_cpassword" class="sr-only">PasswordCnfm</label>
								                    <input type="password" id="user_cpassword" class="form-control usrPassword" name="confirm_password" placeholder="Password"/>
								                    <div class="form-control-position">
									                    <i class="icon-lock"></i>
								                    </div>
                                                    <div id="show_cpassword" class="form-control-position-right">
									                    <i class="fas fa-eye" style="color:#999"></i>
								                    </div>
                                                    
						                    </div>
						                    </div>
                                          </div>
                                    </div>

                                
                                </div>
                                
                                
                         
                            </div>
                        
                            <h4 class="form-header text-uppercase">
                            <i class="fa fa-cutlery"></i>
                              Restaurant Info
                            </h4>
                        
                            <div class="form-group row" style="margin-right:0px">
                          
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-sm-12">
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="restaurant_title" class="sr-only">Title</label>
                                                    <input id="restaurant_title" class="form-control text-uppercase" type="text" name="title" placeholder="Restaurant Title"/>
								                    <div class="form-control-position">
									                <i class="icon-note"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                                                <div class="row" style="padding:0">
                                            
                                                <div class="col-sm-6">
                                                    <label style="margin-bottom:0">State</label>
                                                    <div class="form-group">
						                            <label for="drpState" class="sr-only">State</label>
                                                        <asp:DropDownList ID="drpState"  class="form-control single-select" runat="server" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="True">
                                                            
                                                        </asp:DropDownList>
						                        
						                            </div>
                                                
                                                </div>
                                                <div class="col-sm-6">
                                                    <label style="margin-bottom:0">City</label>
                              
                                                      <div class="form-group">
						                                    <label for="drpCity" class="sr-only">City</label>
                                                                <asp:DropDownList ID="drpCity"  class="form-control single-select" runat="server">
                                                            
                                                                </asp:DropDownList>
						                        
						                                </div>
                                                  </div>
                                            </div>
                                            </ContentTemplate></asp:UpdatePanel>
                                        </div>
                                        
                                        <div class="col-sm-12">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="txtAddress" class="sr-only">Address</label>
                                                    <input id="restaurant_address" class="form-control" type="text" name="address" placeholder="Address"/>
								                    <div class="form-control-position">
									                <i class="icon-location-pin"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                    
                                    </div>

                                
                                </div>
                                <div class="col-sm-3 px-3  py-sm-0 py-3">
                                    
                                   <div class="img-container">
                                      <div id="logo-wrapper" class="img-wrapper">
                                        <div class="img-main">
                                            <img id="logo-img" style="background-size:cover" class="img-alt" src="" alt="" />
                                        </div>
                                        <div class="content1">
                                          <div class="img-icon">
                                            <img id="default-logo" class="img-alt" style="width:100px;height:100px" src="images/custom/defaultlogo.png" alt="" />
                                          </div>
                                          <div class="img-text">Logo Image</div>
                                        </div>
                                        <div id="logo-cancel" class="img-cancel">
                                          <i class="fas fa-times"></i>
                                        </div>
                                        <div class="img-choose" id="choose-logo" style="cursor:pointer"><i class="icon-picture m-auto"></i></div>
                                      </div>
                                       
                                           <asp:FileUpload ID="logo_choose" accept="image/*" hidden="hidden" runat="server" />
                                      
                                    </div>
                              </div>
                            
                            
                         
                            </div>
                            <h4 class="form-header text-uppercase">
                            <i class="fa fa-envelope"></i>
                              Verification
                            </h4>
                            <div class="form-group row" style="margin-right:0px">
                          
                                        <div class="col-sm-6">
                              
                                          <div class="input-group mb-3">
							                  <div class="input-group-prepend">
								                <button id="btn_otp" class="btn btn-outline-primary" type="button">
                                                    <i id="i_send_otp" class="fa fa-spinner fa-spin d-none"></i> 
                                                    <span id="span_send_otp">Send OTP</span>
								                </button>
							                  </div>
							                  <input id="user_otp" type="text" class="form-control form-control-2" maxlength="6" placeholder="Verify Your Email"/>
                                              
							                  <div class="input-group-append">
								                <button id="btn_verify_otp" class="btn btn-primary" disabled="" type="button">
                                                    <i id="i_verified_otp" class="fas fa-check-circle d-none"></i>
                                                    <i id="i_check_otp" class="fa fa-spinner fa-spin d-none"></i>
                                                    <span id="span_verify_otp">Verify</span>
								                </button>
							                  </div>
							                </div>
                                        </div>
                                        <div class="col-sm-6">
                                                    <button type="button" class="btn btn-warning waves-effect waves-light btn-sm d-none" id="alert-warning">Click me</button>
                                                  <label id="user_otp-error" class="d-none" style="color:#ff0000" for="user_otp">Please enter the otp</label>
                                        </div>
                                    
                                    </div>

                        </div>
                        
                        <div class="form-footer row">
                            <div class="col-sm-6">
                                <div class="form-group">
							    <div class="icheck-primary">
				                <input type="checkbox" id="user-checkbox" name="agree" checked="" />
				                <label for="user-checkbox">I agree <a href="#">Term & Condition</a></label>
                                <button type="button" class="btn btn-info waves-effect waves-light btn-sm d-none" id="alert-info">Click me</button>
							    </div>
							    </div>
                            </div>
                            <div class="col-sm-6">
                            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                                <asp:LinkButton ID="lnkbtnSave" runat="server" type="submit" class="btn btn-primary float-right ml-2 d-none" OnClick="lnkbtnSave_Click"><i class="fa fa-check-square-o"></i> SAVE</asp:LinkButton>
                            </ContentTemplate></asp:UpdatePanel>--%>
                            <asp:LinkButton ID="lnkbtnSave" runat="server" type="submit" class="btn btn-primary float-right ml-2 d-none" OnClick="lnkbtnSave_Click"><i class="fa fa-check-square-o"></i> SAVE</asp:LinkButton>
                            
                                <button type="submit" id="btnSave" class="btn btn-primary float-right ml-2">
                                    <i id="i_saved" class="fa fa-check-square-o"></i>
                                    <span id="span_save">SAVE</span>
                                </button>
                                
                                <button type="button" id="btnBack" onclick="window.location='panelLogin.aspx'" class="btn btn-warning float-right">
                                    <i class="fa fa-times"></i>
                                    <span id="span_back">Go Back</span>
                                </button>

                                <%--<button class="btn btn-primary m-1 d-none" id="btnComplete" disabled="" data-toggle="modal" data-target="#complete">Go</button>--%>
                                  <!-- Modal -->
                                    <div class="modal fade" id="complete" data-backdrop="static">
                                      <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content animated bounceIn">
                                          <%--<div class="modal-header">
                                            <h5 class="modal-title"><i class="fa fa-star"></i> Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                          </div>--%>
                                          <div class="modal-body">
                                             <div class="swal-icon swal-icon--success">
                                                <span class="swal-icon--success__line swal-icon--success__line--long"></span>
                                                <span class="swal-icon--success__line swal-icon--success__line--tip"></span>

                                                <div class="swal-icon--success__ring"></div>
                                                <div class="swal-icon--success__hide-corners"></div>
                                            </div>
                                            <div class="swal-title" style="">Welcome!</div>
                                            <div style="text-align:center">Your Account has been registered, let's Go!</div>
                                              <div class="swal-footer">
                                                    <div class="swal-button-container">
                                                        <button id="btnGo" class="swal-button swal-button--confirm" data-dismiss="modal">Continue to Dashboard</button>                                                    

                                                    </div>

                                                </div>

                                          </div>
                                          <%--<div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                            <button type="button" class="btn btn-primary"><i class="fa fa-check-square-o"></i> Save changes</button>
                                          </div>--%>
                                        </div>
                                      </div>
                                    </div>


                                
                                    <div class="modal fade" id="saving" data-backdrop="static">
                                      <div class="modal-dialog modal-sm modal-dialog-centered">
                                        <div class="modal-content animated fadeIn" style="background-color:transparent;border:none">
                                          <%--<div class="modal-header">
                                            <h5 class="modal-title"><i class="fa fa-star"></i> Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">&times;</span>
                                            </button>
                                          </div>--%>
                                          <div class="modal-body" style="text-align:center">
                                             
                                                  <%--<div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                                                      <span class="sr-only">Loading...</span>
                                                    </div>--%>
                                                    <div class="spinner-grow" style="width: 5rem; height: 5rem;" role="status">
                                                            <span class="sr-only">saving...</span>
                                                    </div>
                                          </div>
                                          <%--<div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                            <button type="button" class="btn btn-primary"><i class="fa fa-check-square-o"></i> Save changes</button>
                                          </div>--%>
                                        </div>
                                      </div>
                                    </div>

                                <%--<a href="u_Admin/dashboard.aspx" class="btn btn-warning float-right"><i class="fa fa-times"></i> Go Back</a>--%>
                               
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
                
          <%--<div class="swal-overlay swal-overlay--show-modal" tabindex="-1">
              <div class="swal-modal" role="dialog" aria-modal="true">
                  <div class="swal-icon swal-icon--success">
                    <span class="swal-icon--success__line swal-icon--success__line--long"></span>
                    <span class="swal-icon--success__line swal-icon--success__line--tip"></span>

                    <div class="swal-icon--success__ring"></div>
                    <div class="swal-icon--success__hide-corners"></div>
                </div>
                <div class="swal-title" style="">Welcome!</div>
                <div class="swal-text" style="">Your Account has been registered, let's Go!,</div>
                <div class="swal-footer">
                    <div class="swal-button-container">
                        <button class="swal-button swal-button--confirm">OK</button>

                        <div class="swal-button__loader">
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>

                    </div>

                </div>

              </div>

          </div>--%>

      

          

      </div><!--End Row-->

	  <!--start overlay-->
	  <div class="overlay toggle-menu"></div>
	<!--end overlay-->
    <!-- End container-fluid-->
    
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
	
   
  </div><!--End wrapper-->

  
  <!-- Bootstrap core JavaScript-->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
	
  <!-- simplebar js -->
  <script src="assets/plugins/simplebar/js/simplebar.js"></script>
  <!-- waves effect js -->
  <script src="assets/js/waves.js"></script>
  <!-- sidebar-menu js -->
  <script src="assets/js/sidebar-menu.js"></script>
  <!-- Custom scripts -->
  <script src="assets/js/app-script.js"></script>
  <!-- Dropzone JS  -->
  <script src="assets/plugins/dropzone/js/dropzone.js"></script>  
  <!--Form Validatin Script-->
  <script src="assets/plugins/jquery-validation/js/jquery.validate.min.js"></script>
  <script src="assets/plugins/jquery-validation/js/additional-methods.min.js"></script>
  <!--Select Plugins Js : for providing option to type and select state or city-->
  <script src="assets/plugins/select2/js/select2.min.js"></script> 
  <!--Sweet Alerts -->
  <script src="assets/plugins/alerts-boxes/js/sweetalert.min.js"></script>
  <script src="assets/plugins/alerts-boxes/js/sweet-alert-script.js"></script>

  <script src="assets/js/app.js"></script>
  <script src="assets/js/moment.js"></script>
  <%--<script src="assets/js/app-register.js"></script>--%>
<%--<script>
    const wrapperlogo = document.querySelector("#containerLogo");
    //const fileName = document.querySelector(".file-name1");
    const defaultBtnlogo = document.querySelector("#imgLogo");
    //const customBtnlogo = document.querySelector("#custom-btn");
    const cancelBtnlogo = document.querySelector("#logoCancel i");
    const imglogo = document.querySelector("#logoPic");
    let regExplogo = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
    function defaultBtnActivelogo() {
        
        defaultBtnlogo.click();
    }
    defaultBtnlogo.addEventListener("change", function () {

        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function () {
                const result = reader.result;
                imglogo.src = result;
                console.log(img.src);
                wrapperlogo.classList.add("active");
            };
            cancelBtnlogo.addEventListener("click", function () {
                imglogo.src = "";
                wrapperlogo.classList.remove("active");
            });
            reader.readAsDataURL(file);
        }
        //if (this.value) {
        //  let valueStore = this.value.match(regExp);
        //  fileName.textContent = valueStore;
        //}



    });


</script>--%>
    
    <script>
        $("#btnGo").click(function () {
            
            window.location = "u_Admin/dashboard.aspx";
        });
        //$("#complete").modal('show');
        //$("#saving").modal('show');
        
        function checksubmit() {
            if ($("#btnSave").hasClass("submitted")&&$("#btnSave").attr('disabled')) {
                //console.log("in");
                //$("#alert-success").click();
                $("#complete").modal('show');
                $("#btnSave").attr('disabled', false);
            }
        }

        function pageLoad() {
            $('.single-select').select2();
            checksubmit();
        }

        $(document).ready(function () {
            $('.single-select').select2();
            $('#user_name').focus();


        });
        $().ready(() =>{
            //script to custom info of t and c not agree condition
            $("#alert-info").click(function () {
                swal("Information!", "Make sure to read and agree the Terms and Conditions", "info");
            });
            $("#alert-warning").click(function () {
                swal("Warning!", "Verify your Email first!,", "warning");
            });

            //script of showing Profile image priview on opening the file
            var custom_profile_btn = $("#choose-profile");
            var main_profile_btn = document.querySelector("#profile_choose");
            custom_profile_btn.on("click", function () {
                main_profile_btn.click();
            });
            main_profile_btn.addEventListener("change", function () {
                const wrapper = document.querySelector("#profile-wrapper");
                const img_src = document.querySelector("#profile-img");
                const cancel_btn = document.querySelector("#profile-cancel");

                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function () {
                        const result = reader.result;
                        img_src.src = result;
                        wrapper.classList.add("active");
                    };
                    cancel_btn.addEventListener("click", function () {
                        img_src.src = "";
                        wrapper.classList.remove("active");
                    });
                    reader.readAsDataURL(file);
                }
            
            });

            //script of showing logo image priview on opening the file
            var custom_logo_btn = $("#choose-logo");
            var main_logo_btn = document.querySelector("#logo_choose");
            custom_logo_btn.on("click", function () {
                main_logo_btn.click();
            });
            main_logo_btn.addEventListener("change", function () {
                const wrapper = document.querySelector("#logo-wrapper");
                const img_src = document.querySelector("#logo-img");
                const cancel_btn = document.querySelector("#logo-cancel");

                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function () {
                        const result = reader.result;
                        img_src.src = result;
                        wrapper.classList.add("active");
                    };
                    cancel_btn.addEventListener("click", function () {
                        img_src.src = "";
                        wrapper.classList.remove("active");
                    });
                    reader.readAsDataURL(file);
                }

            });
        
            //script of showing password
            const showp = document.querySelector("#show_password i");
            showp.onclick = (() => {
                const show = showp;
                const field = document.querySelector("#user_password");
                field.focus();
                show.classList.add("hide-btn");
                if (field.type === "password") {
                    field.type = "text";
                    show.classList.add("hide-btn");
                } else {
                    field.type = "password";
                    show.classList.remove("hide-btn");
                }
            });
            //script of showing cpassword
            const showcp = document.querySelector("#show_cpassword i");
            showcp.onclick = (() => {
                const show = showcp;
                const field = document.querySelector("#user_cpassword");
                field.focus();
                show.classList.add("hide-btn");
                if (field.type === "password") {
                    field.type = "text";
                    show.classList.add("hide-btn");
                } else {
                    field.type = "password";
                    show.classList.remove("hide-btn");
                }
            });
            //validator to check emailId is unique or not
            $.validator.addMethod("haveAccount", function (value) {
                var data = { email: value };
                var found = $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        async: false,
                        url: "register.aspx/checkaccount",
                        data: JSON.stringify(data),
                        datatype: "json",
                        success: function (data) {
                            return data;
                        },
                        error: function (error) {

                        }
                    });
                if (found.responseJSON.d == "true") {
                    return false;
                }
                else {
                    return true;
                }
                //return !found.responseJSON.d;
            }, "Already have an account go and login");
            //validator to check user name is available or not
            $.validator.addMethod("avaiUsername", function (value) {
                
                var data = { username: value };
                var found = $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    async: false,
                    url: "register.aspx/checkusername",
                    data: JSON.stringify(data),
                    datatype: "json",
                    success: function (data) {
                        return data;
                    },
                    error: function (error) {

                    }

                });
                //console.log(found);
                //console.log(!found.responseJSON.d);
                if (found.responseJSON.d == "true") {
                    return false;
                }
                else {
                    return true;
                }
                //return !found.responseJSON.d;
            }, "Not Available");
            //setting defaults i.e. border colors
            $.validator.setDefaults({
                highlight: function (element) {
                    $(element).addClass('errorhighlight');
                },
                unhighlight: function (element) {
                    $(element).removeClass('errorhighlight');
                    $(element).addClass('fieldset');
                }
            });
            // validate signup form on keyup and submit
            $("#signupForm").validate({
                invalidHandler: function(form, validator) {
                    var errors = validator.numberOfInvalids();
                    if (errors) {                    
                        validator.errorList[0].element.focus();
                    }
                } ,
                rules: {
                    
                    errorClass: "error have-alert",
                    name: {
                        required: true,
                        minlength: 3,
                        maxlength:40
                    },
                    phone: {
                        required: true,
                        number:true,
                        minlength: 10
                    },
                    emailid: {
                        required: true,
                        email: true,
                        haveAccount: true
                    },
                    username: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                        avaiUsername:true
                    },
                    urpassword: {
                        required: true,
                        minlength: 8,
                        maxlength: 20
                    },
                    confirm_password: {
                        required: true,
                        equalTo: "#user_password"
                    },
                    title: {
                        required: true,
                        minlength: 10,
                        maxlength: 75
                    },
                    address: {
                        required: true
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name",
                        minlength: "Minimum 3 characters",
                        maxlength:"Maximun 40 characters"
                    },
                    phone: {
                        required: "Please enter your 10 digit number",
                        minlength: "Minimum 10 digits",
                        number: "Please enter a valid number"
                    },
                    emailid: {
                        required: "Please enter your email address",
                        email: "Please enter a valid email"
                    },
                    username: {
                        required: "Please enter a username",
                        minlength: "at least 6 characters",
                        maxlength: "at max 20 characters"
                    },
                    urpassword: {
                        required: "Please provide a password",
                        minlength: "at least 8 characters long",
                        maxlength: "at max 20 characters long"
                    },
                    confirm_password: {
                        required: "Please Enter the password",
                        equalTo: "Password Mismatch"
                    },
                    title: {
                        required: "Please Provide your Restaurant Name",
                        minlength: "at least 10 characters",
                        maxlength: "at max 75 characters"
                    },
                    address: {
                        required: "Please provide your Address"
                    }
                }
            });

            function isValid(field) {
                $(field).valid();
            }
            $('#user_name').on("keyup", function () {
                isValid("#user_name");
            });
            $('#user_phone').on("keyup", function () {
                isValid("#user_phone");
            });
            $('#user_email').on("keyup", function () {
                isValid("#user_email");
            });
            $('#username').on("keyup", function () {
                isValid("#username");
            });
            $('#user_password').on("keyup", function () {
                isValid("#user_password");
            });
            $('#user_cpassword').on("keyup", function () {
                isValid("#user_cpassword");
            });
            $('#restaurant_title').on("keyup", function () {
                isValid("#restaurant_title");
            });
            $('#restaurant_address').on("keyup", function () {
                isValid("#restaurant_address");
            });
            //send otp
            $("#btn_otp").on("click", function () {
                //var data = {
                //    //name: $("#user_name").val(),
                //    //phone: $("#user_phone").val(),
                //    //email: $("#user_email").val(),
                //    //title: $("#restaurant_title").val()
                //    admininfo: {
                //        name: "Kunal",
                //        phone: "9306066540",
                //        email: "gkunal@gmail.com",
                //        title: "abc fast food"
                //    }
                //}

                if ($("#user_email").valid() && $("#user_name").valid() && $("#user_phone").valid()) {
                    var data = {
                        record: {
                            name: $("#user_name").val(),
                            phone: $("#user_phone").val(),
                            email: $("#user_email").val(),
                            title: $("#restaurant_title").val()
                        }
                    };
                    //console.log(data);
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        async: true,
                        url: "register.aspx/sendotp",
                        //data: "{'admininfo':" + JSON.stringify(data) + "}",
                        data: JSON.stringify(data),
                        datatype: "json",
                        beforeSend: function () {

                            $("#i_send_otp").removeClass("d-none");
                            $("#btn_otp").attr('disabled', true);
                            $("#span_send_otp").text("Sending..");
                        },
                        success: function (response) {
                            //console.log(response);
                        },
                        complete: function () {
                            setTimeout(function () {
                                $("#i_send_otp").addClass("d-none");
                                $("#btn_otp").attr('disabled', false);
                                $("#span_send_otp").text("RESEND");
                                $("#user_otp").attr('placeholder', "Enter the OTP");
                                $("#user_otp").focus();
                                $("#btn_verify_otp").attr('disabled', false);
                                
                            }, 2000);
                        },
                        error: function (error) {
                            //if (!navigator.onLine) {
                            //    window.location = "errors-404-error.html";
                            //}
                            //alert('error : ' + error);
                            console.log(error);

                        }
                    });

                }
                else if (!$("#user_email").valid()) { $("#user_email").focus() }
                else if (!$("#user_name").valid()) { $("#user_name").focus() }
                else if (!$("#user_phone").valid()) { $("#user_phone").focus() }
                


                //$("#i_send_otp").removeClass("d-none");
                //$("#btn_otp").attr('disabled', true);
                //$("#span_send_otp").text("Sending..");
                //setTimeout(function () {
                //    $("#i_send_otp").addClass("d-none");
                //    $("#btn_otp").attr('disabled', false);
                //    $("#span_send_otp").text("RESEND");
                //    $("#user_otp").attr('placeholder', "Enter the OTP");
                //    $("#user_otp").focus();
                //}, 1000);
            });
            //validate otp
            $("#user_otp").on("keyup", function () {
                //console.log("in");
                if (!$("#user_otp-error").hasClass("d-none")) {
                    $("#user_otp-error").addClass("d-none")
                }
                if ($("#user_otp").val().length == 0) {
                    $("#user_otp-error").removeClass("d-none");
                    $("#user_otp-error").text("Please enter the otp");
                   
                    return;
                }
                if ($("#user_otp").val().length < 6) {
                    $("#user_otp-error").removeClass("d-none");
                    $("#user_otp-error").text("Complete the 6 characters");
                    return;
                }
            });
            //verify otp
            $("#btn_verify_otp").on("click", function () {
                
                if ($("#user_otp").val() == "") {
                    $("#user_otp-error").removeClass("d-none");
                    $("#user_otp").focus();
                    return;
                }
                if ($("#user_otp").val().length < 6) {
                    $("#user_otp-error").removeClass("d-none");
                    $("#user_otp-error").text("Complete the 6 characters");
                    $("#user_otp").focus();
                    return;
                }
                var data = { otp: $("#user_otp").val(), email: $("#user_email").val() };
                //var data = { otp: "234356", email: "gkunal13579@gmail.com" };
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    async: true,
                    url: "register.aspx/checkotp",
                    data: JSON.stringify(data),
                    datatype: "json",
                    beforeSend: function () {
                        $("#i_check_otp").removeClass("d-none");
                        $("#btn_otp").attr('disabled', true);
                        $("#btn_verify_otp").attr('disabled', true);
                        $("#span_verify_otp").text("cheking..");
                    },
                    success: function (response) {
                        console.log(response.d);
                        if (response.d == "true") {
                            setTimeout(function () {
                                $("#i_check_otp").addClass("d-none");
                                $("#i_verified_otp").removeClass("d-none");
                                $("#span_verify_otp").text("Verified");
                                $("#user_otp").attr('disabled', true);
                                $("#user_name").attr('disabled', true);
                                $("#user_phone").attr('disabled', true);
                                $("#user_email").attr('disabled', true);
                                $("#user_otp-error").addClass("verified");
                            }, 1000);


                        }
                        else {
                            setTimeout(function () {
                                $("#i_check_otp").addClass("d-none");
                                $("#i_verified_otp").addClass("d-none");
                                $("#span_verify_otp").text("Verify");
                                $("#user_otp").attr('disabled', false);
                                $("#btn_verify_otp").attr('disabled', false);
                                $("#btn_otp").attr('disabled', false);
                                $("#user-name").attr('disabled', false);
                                $("#user-phone").attr('disabled', false);
                                $("#user-email").attr('disabled', false);

                                $("#user_otp-error").removeClass("d-none");
                                $("#user_otp-error").text("Wrong OTP!");
                            }, 1000);
                        }
                    },
                    complete: function (response) {
                        
                    },
                    error: function (error) {

                    }

                });
                //console.log(match);
                //console.log(match.responseJSON.d);
                //if (match.responseJSON.d == "true") {
                //    $("#i_check_otp").addClass("d-none");
                //    $("#i_verified_otp").removeClass("d-none");
                //    $("#span_verify_otp").text("Verified");
                //    $("#user_otp").attr('disabled', true);
                //    $("#user_name").attr('disabled', true);
                //    $("#user_phone").attr('disabled', true);
                //    $("#user_email").attr('disabled', true);
                //    $("#user_otp-error").addClass("verified");
                //}
                //else {
                //    $("#i_check_otp").addClass("d-none");
                //    $("#i_verified_otp").addClass("d-none");
                //    $("#span_verify_otp").text("Verify");
                //    $("#user_otp").attr('disabled', false);
                //    $("#btn_verify_otp").attr('disabled', false);
                //    $("#user-name").attr('disabled', false);
                //    $("#user-phone").attr('disabled', false);
                //    $("#user-email").attr('disabled', false);
                //    $("#user_otp-error").removeClass("d-none");
                //    $("#user_otp-error").text("Wrong OTP!");

                //}
                //$("#i_send_otp").removeClass("d-none");
                //$("#btn_otp").attr('disabled', true);
                //$("#span_send_otp").text("Sending..");
                //setTimeout(function () {
                //    $("#i_send_otp").addClass("d-none");
                //    $("#btn_otp").attr('disabled', false);
                //    $("#span_send_otp").text("RESEND");
                //    $("#user_otp").attr('placeholder', "Enter the OTP");
                //    $("#user_otp").focus();
                //}, 1000);
            });

            //submit data do postback
            $("#btnSave").on("click", function (e) {
                e.preventDefault();
                //$("#btnSave").attr('data-toggle', 'modal');
                //$("#btnSave").attr('data-target','#complete');

                //how to call _dopostback in ajax
                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json",
                //    async: false,
                //    url:__doPostBack('lnkbtnSave', JSON.stringify(admin)),
                //    data: {},
                //    datatype: "json",
                //    beforeSend: function () {
                //        //$("#alert-warning").click();
                //        alert("doing");
                //        $("#btnSave").attr('disabled',true)
                //    },
                //    success: function (response) {
                //        $(document).ready(function () {
                //            setTimeout(function () {
                //                alert("success");
                //                $("#alert-warning").click();
                //            }, 5000);
                //        });
                //    },
                //    complete: function (response) {
                //    },
                //    error: function (error) {
                //    }
                //});

                if ($("#signupForm").valid()) {
                    if (!$("#user_otp-error").hasClass("verified")) {
                        //e.preventDefault();
                        $("#alert-warning").click();
                        //$("#user_otp-error").removeClass("d-none");
                        //$("#user_otp-error").text("Verify the OTP first");
                        return;
                    }

                    else if ($("#user-checkbox").prop('checked') != true) {
                        //alert("hello");
                        //e.preventDefault();
                        $("#alert-info").click();
                        return;
                    }

                    else {
                        $("#saving").modal({
                            show: true,
                            backdrop: 'static',
                            keyboard:false
                        });
                        $("#i_saved").addClass("d-none");
                        $("#btnSaving").removeClass("d-none");
                        $("#btnSave").attr('disabled', true);
                        $("#btnBack").attr('disabled', true);
                        $("#btnSave").text("Saving..");
                        let date = moment();

                        var pp = "0";
                        if ($("#profile-wrapper").hasClass("active")) {
                            pp = "1";
                        }
                        var lp = "0";
                        if ($("#logo-wrapper").hasClass("active")) {
                            lp = "1";
                        }

                        var admin = {
                            name: $("#user_name").val(),
                            phone: $("#user_phone").val(),
                            email: $("#user_email").val(),
                            username: $("#username").val(),
                            password: $("#user_password").val(),
                            profilepic: pp,
                            firmtitle: $("#restaurant_title").val().toUpperCase(),
                            firmicon: lp,
                            state: "",
                            city: "",
                            address: $('#restaurant_address').val(),
                            date_started: date.format("YYYY-MM-DD"),
                            date_registered: date.format("YYYY-MM-DD"),
                            date_expiry: date.add(1,'Y').format("YYYY-MM-DD")
                            //name: "kunal",
                            //phone: "9306066540",
                            //password: "1234"
                        }
                
                        setTimeout(function () {
                            __doPostBack('lnkbtnSave', JSON.stringify(admin));
                        }, 100);
                    }
                }
                    
            });
        });
        function fun() {
            $("#btnSave").addClass("submitted");
            $("#btnSave").attr('disabled', true);
        }



        //data is send and recievd in json format in __dopostback
        //function done(record) {
        //    var data = JSON.parse(record);
        //    $("#btnSave").addClass("submitted");
        //    $("#btnSave").attr('disabled', true);
        //    //$("#alert-warning").click();
        //    //alert("hey i am fired afun : mr." + data.name);
        //    //console.log(data);
            
        //}
    </script>
</form>
</body>
</html>
