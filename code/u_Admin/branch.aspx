<%@ Page Title="" Language="C#" MasterPageFile="~/u_Admin/adminMaster.master" AutoEventWireup="true" CodeFile="branch.aspx.cs" Inherits="u_Admin_branch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <!--Select Plugins-->
  <link href="../assets/plugins/select2/css/select2.min.css" rel="stylesheet" />
  <style>
    .error-label{
          color:red;
      }
    .error{
        border:1px solid red;
    }
    .form-control-position-right{
        position: absolute;
        top: -8px;
        right: 0;
        left:auto;
        z-index: 2;
        display: block;
        width: 3.5rem;
        height: 3.5rem;
        line-height: 3.5rem;
        text-align: center;
        cursor: pointer;
    }


    .form-control-position-right i.hide-btn::before{
      content: "\f070";
    }  
  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper">
    <div class="container-fluid">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                                                         
      <!--Start Dashboard Content-->
      <div class="row mt-3">
          <asp:Repeater ID="rptBranch" runat="server" OnItemCommand="rptBranch_ItemCommand">
              <ItemTemplate>
              <div class="col-12 col-sm-6 col-xl-3">
                  <div class="card border-info border-left-sm">
                  <div class="card-body">
                      <div class="media align-items-center">
                      <div class="media-body text-left">
                        <h4 class="text-info mb-0">
                            
                            <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("sale") %>'></asp:Label>
                        </h4>
                            
                            <asp:LinkButton ID="lnkTitle" style="color:#666;font-size:18px" CommandArgument='<%#Bind("branchId") %>' runat="server" Text='<%#Bind("branchTitle") %>'></asp:LinkButton>
                            <asp:Label ID="lblBranchId" Visible="false" style="color:black" runat="server" Text='<%#Bind("branchId") %>'></asp:Label>
                        
                      </div>
                      <div class="align-self-center w-circle-icon rounded-circle gradient-scooter">
                        
                          <span>
                              <asp:Label ID="lblCount" CssClass="text-white" runat="server" Text='<%#Bind("mcount") %>'></asp:Label>
                          </span>
                      </div>
                    </div>
                    </div></div>
              <%--<asp:LinkButton ID="lblBranchDetail" CommandArgument='<%#Bind("branchId") %>' runat="server"><div class="card border-info border-left-sm">
                    <div runat="server" class="card-body">
                      <div class="media align-items-center">
                      <div class="media-body text-left">
                        <h4 class="text-info mb-0">
                            
                            <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("sale") %>'></asp:Label>
                        </h4>
                            
                            <asp:Label ID="lblTitle" style="color:#666" runat="server" Text='<%#Bind("branchTitle") %>'></asp:Label>
                            <asp:Label ID="lblBranchId" Visible="false" style="color:black" runat="server" Text='<%#Bind("branchId") %>'></asp:Label>
                        
                      </div>
                      <div class="align-self-center w-circle-icon rounded-circle gradient-scooter">
                        
                          <span>
                              <asp:Label ID="lblCount" CssClass="text-white" runat="server" Text='<%#Bind("mcount") %>'></asp:Label>
                          </span>
                      </div>
                    </div>
                    </div>
                  </div>
              </asp:LinkButton>--%>
              </div>

              </ItemTemplate>
          </asp:Repeater>

        <%--<div class="col-12 col-sm-6 col-xl-3">
          <div class="card border-info border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-info mb-0">4500</h4>
                <span>Total Orders</span>
              </div>
              <div class="align-self-center w-circle-icon rounded-circle gradient-scooter">
                <i class="icon-basket-loaded text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-6 col-xl-3">
          <div class="card border-danger border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
               <div class="media-body text-left">
                <h4 class="text-danger mb-0">7850</h4>
                <span>Total Expenses</span>
              </div>
               <div class="align-self-center w-circle-icon rounded-circle gradient-bloody">
                <i class="icon-wallet text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-6 col-xl-3">
          <div class="card border-success border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-success mb-0">87.5%</h4>
                <span>Total Revenue</span>
              </div>
              <div class="align-self-center w-circle-icon rounded-circle gradient-quepal">
                <i class="icon-pie-chart text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
        --%>
          <div class="col-12 col-sm-6 col-xl-3">
              <asp:LinkButton ID="lnkAddBranch" runat="server" OnClick="lnkAddBranch_Click">
                  <div class="card border-warning border-left-sm">
                    <div class="card-body">
                      <div class="media align-items-center">
                      <div class="media-body text-left">
                        <h4 class="text-warning mb-0">Add Branch</h4>
                        <span style="color:#666">Cost: 3000</span>
                      </div>
                      <div class="align-self-center w-circle-icon rounded-circle gradient-blooker">
                        <i class="icon-plus text-white"></i></div>
                    </div>
                    </div>
                  </div>

              </asp:LinkButton>
        </div>
      </div>
        <!--End Row-->
		  
		  
      <div class="row">
          <div class="col-12">
              <div class="card">
                    <div class="card-body">
                        <div>
                        
                        
                            <h4 class="form-header text-uppercase border-bottom-0">
                            <i class="fa fa-cutlery"></i>
                              Branch Info
                            </h4>
                        
                            <div class="form-group row">
                          
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12">
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="branch_title" class="sr-only">branchTitle</label>
                                                    <asp:Label ID="lblBranchId" Visible="false" runat="server" Text=""></asp:Label>
                                                    <asp:TextBox ID="txtBranchtitle" class="form-control" placeholder="Branch Title" runat="server"></asp:TextBox>
                                                       <label id="bterror" class="error-label d-none">Please enter the Branch Title</label>
								                    <div class="form-control-position">
									                <i class="icon-note"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-12">
                                                <div class="row" style="padding:0">
                                            
                                                <div class="col-sm-3">
                                                    <label style="margin-bottom:0">State</label>
                                                    <div class="form-group">
						                            <label for="drpState" class="sr-only">State</label>
                                                        <asp:DropDownList ID="drpState"  class="form-control single-select" runat="server" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="True">
                                                            
                                                        </asp:DropDownList>
						                        
						                            </div>
                                                
                                                </div>
                                                <div class="col-sm-3">
                                                    <label style="margin-bottom:0">City</label>
                              
                                                      <div class="form-group">
						                                    <label for="drpCity" class="sr-only">City</label>
                                                                <asp:DropDownList ID="drpCity"  class="form-control single-select" runat="server">
                                                            
                                                                </asp:DropDownList>
						                        
						                                </div>
                                                  </div>
                                                
                                                <div class="col-sm-6">
                                                    <label style="margin-bottom:0">Address</label>
                              
                                                  <div class="form-group">
						                            <div class="position-relative has-icon-left">
							                            <label for="txtAddress" class="sr-only">Address</label>
                                                            <asp:TextBox ID="txtBranchAddress" class="form-control" placeholder="Address" runat="server"></asp:TextBox>
								                            <div class="form-control-position">
									                        <i class="icon-location-pin"></i>
								                        </div>
						                            </div>
						                            </div>
                                                </div>

                                            </div>
                                        </div>
                                        
                                        
                                    
                                    </div>

                                
                                </div>
                                
                            
                         
                            </div>

                        </div>
                        
                        <div class="form-footer row border-top-0">
                            
                            <div class="col-12">
                            <asp:LinkButton ID="lnkBranchSave" runat="server" type="submit" class="btn btn-primary float-right ml-2" OnClick="lnkBranchSave_Click">UPDATE</asp:LinkButton>
                            
                                <%--<button type="submit" id="btnSave" class="btn btn-primary float-right ml-2">
                                    <i id="i_saved" class="fa fa-check-square-o"></i>
                                    <span id="span_save">SAVE</span>
                                </button>--%>
                                
                               
                            </div>
                        </div>
                    </div>
                  </div>
          </div>

      </div>
        
        

                                                          
      <!--Start Dashboard Content-->
      <div class="row mt-3">
          <asp:Repeater ID="rptManager" runat="server" OnItemCommand="rptManager_ItemCommand">
              <ItemTemplate>
              <div class="col-12 col-sm-6 col-xl-3">
                  <div class="card border-info border-left-sm">
                  <div class="card-body">
                      <div class="media align-items-center">
                      <div class="media-body text-left">
                        <h4 class="text-info mb-0">
                            
                            <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("sale") %>'></asp:Label>
                        </h4>
                            
                            <asp:LinkButton ID="lnkTitle" style="color:#666;font-size:18px" CommandArgument='<%#Bind("managerId") %>' runat="server" Text='<%#Bind("counterTitle") %>'></asp:LinkButton>
                            <asp:Label ID="lblmanagerId" Visible="false" style="color:black" runat="server" Text='<%#Bind("managerId") %>'></asp:Label>
                        
                      </div>
                      <div class="align-self-center w-circle-icon rounded-circle gradient-scooter">
                        <asp:Image CssClass="text-white" style="width:30px;height:30px" ID="imgProfileManager" ImageUrl="~/u_Admin/assets/images/profile-logo/default.jfif" runat="server" />
                          <%--<span>
                              <asp:Label ID="lblCount" CssClass="text-white" runat="server" Text='<%#Bind("mcount") %>'></asp:Label>
                          </span>--%>
                      </div>
                    </div>
                    </div></div>
              <%--<asp:LinkButton ID="lblBranchDetail" CommandArgument='<%#Bind("branchId") %>' runat="server"><div class="card border-info border-left-sm">
                    <div runat="server" class="card-body">
                      <div class="media align-items-center">
                      <div class="media-body text-left">
                        <h4 class="text-info mb-0">
                            
                            <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("sale") %>'></asp:Label>
                        </h4>
                            
                            <asp:Label ID="lblTitle" style="color:#666" runat="server" Text='<%#Bind("branchTitle") %>'></asp:Label>
                            <asp:Label ID="lblBranchId" Visible="false" style="color:black" runat="server" Text='<%#Bind("branchId") %>'></asp:Label>
                        
                      </div>
                      <div class="align-self-center w-circle-icon rounded-circle gradient-scooter">
                        
                          <span>
                              <asp:Label ID="lblCount" CssClass="text-white" runat="server" Text='<%#Bind("mcount") %>'></asp:Label>
                          </span>
                      </div>
                    </div>
                    </div>
                  </div>
              </asp:LinkButton>--%>
              </div>

              </ItemTemplate>
          </asp:Repeater>

          <div class="col-12 col-sm-6 col-xl-3">
              <asp:LinkButton ID="lnkAddManager" runat="server" OnClick="lnkAddManager_Click">
                  <div class="card border-warning border-left-sm">
                    <div class="card-body">
                      <div class="media align-items-center">
                      <div class="media-body text-left">
                        <h4 class="text-warning mb-0">Add Manager</h4>
                        <span style="color:#666">Cost: 3000</span>
                      </div>
                      <div class="align-self-center w-circle-icon rounded-circle gradient-blooker">
                        <i class="icon-plus text-white"></i></div>
                    </div>
                    </div>
                  </div>

              </asp:LinkButton>
        </div>
      </div>
        <!--End Row-->
		  
		  

      <div class="row">
          <div class="col-12">
              <div class="card">
                    <div class="card-body">
                        <div>
                                <h4 class="form-header text-uppercase border-bottom-0">
                              <i class="fa fa-address-book-o"></i>
                               Manager Profile
                                    <span class="float-right" style="text-transform:none">
                                        Status: <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                    </spa>
                            </h4>
                            
                            <div class="form-group row">
                               
                                <div class="col-12 px-3">
                                    <div class="row">
                                        <div class="col-12">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="txtcountertitle" class="sr-only">counterTitle</label>
                                                    <asp:Label ID="lblmanagerId" Visible="false" runat="server" Text=""></asp:Label>
                                                    <asp:TextBox ID="txtcountertitle" class="form-control" placeholder="Counter Title" runat="server"></asp:TextBox>
                                                    <label id="cterror" class="error-label d-none">Please enter the counter Title</label>
								                    <div class="form-control-position">
									                <i class="icon-note"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        
                                        <div class="col-sm-6">
                                              <div class="form-group">
						                        <div class="position-relative has-icon-left">
							                        <label for="txtusername" class="sr-only">Username</label>
                                                        <asp:TextBox ID="txtusername" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
                                                    <label id="uerror" class="error-label d-none">Please enter the username</label>
								                        <div class="form-control-position">
									                    <i class="icon-user"></i>
								                    </div>
						                        </div>
						                        </div>
                                          </div>
                                        <div class="col-sm-6">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="txtpassword" class="sr-only">Password</label>
                                                        <asp:TextBox ID="txtpassword" class="form-control" type="password" placeholder="Password" runat="server"></asp:TextBox>
                                                <label id="perror" class="error-label d-none">Please enter the password</label>
								                    <div class="form-control-position">
									                    <i class="icon-lock"></i>
								                    </div>
                                                    <div id="show_password" class="form-control-position-right">
									                    <i onclick="showpassword()" class="fas fa-eye" style="color:#999"></i>
								                    </div>
                                                    
                                                    
						                    </div>
						                    </div>
                                        </div>

                                        <div class="col-sm-4">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="txtmanagername" class="sr-only">Name</label>
                                                    <asp:TextBox ID="txtmanagername" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                                    
								                    <div class="form-control-position">
									                <i class="icon-user"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-4">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="txtmanagerphone" class="sr-only">Name</label>
                                                    <asp:TextBox ID="txtmanagerphone" runat="server" class="form-control" placeholder="Phone"></asp:TextBox>
                                                    
								                    <div class="form-control-position">
									                <i class="icon-phone"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>
                                        <div class="col-sm-4">
                              
                                          <div class="form-group">
						                    <div class="position-relative has-icon-left">
							                    <label for="txtmanageremail" class="sr-only">Name</label>
                                                    <asp:TextBox ID="txtmanageremail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                                    
								                    <div class="form-control-position">
									                <i class="icon-envelope"></i>
								                </div>
						                    </div>
						                    </div>
                                        </div>

                                    </div>

                                
                                </div>
                         
                            </div>
                        
                           
                        </div>
                        
                        <div class="form-footer row border-top-0">
                            
                            <div class="col-12">
                                <span class="float-left" style="font-weight:500;font-size:12px">
                                    Valid Upto: <asp:Label ID="lblValidUpto" runat="server" Text=""></asp:Label>
                                </span>

                            <asp:LinkButton ID="lnkManagerSave" runat="server" type="submit" class="btn btn-primary float-right ml-2" OnClick="lnkManagerSave_Click">UPDATE</asp:LinkButton>
                            
                                <%--<button type="submit" id="btnSave" class="btn btn-primary float-right ml-2">
                                    <i id="i_saved" class="fa fa-check-square-o"></i>
                                    <span id="span_save">SAVE</span>
                                </button>--%>
                                
                               
                            </div>
                        </div>
                    </div>
                  </div>
          </div>

      </div>
      
        </ContentTemplate></asp:UpdatePanel>
       <!--End Dashboard Content-->
      <!--start overlay-->
	  <div class="overlay toggle-menu"></div>
	<!--end overlay-->
    </div>
    <!-- End container-fluid-->
    
    </div><!--End content-wrapper-->
   <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->

    <!-- Bootstrap core JavaScript-->
  <script src="../assets/js/jquery.min.js"></script>
  <script src="../assets/js/popper.min.js"></script>
  <script src="../assets/js/bootstrap.min.js"></script>
	
  <!-- simplebar js -->
  <script src="../assets/plugins/simplebar/js/simplebar.js"></script>
  <!-- waves effect js -->
  <script src="../assets/js/waves.js"></script>
  <!-- sidebar-menu js -->
  <script src="../assets/js/sidebar-menu.js"></script>
  <!-- Custom scripts -->
  <script src="../assets/js/app-script.js"></script> 
    
  <!--Select Plugins Js : for providing option to type and select state or city-->
  <script src="../assets/plugins/select2/js/select2.min.js"></script> 
  <!--Sweet Alerts -->
  <script src="../assets/plugins/alerts-boxes/js/sweetalert.min.js"></script>
  <script src="../assets/plugins/alerts-boxes/js/sweet-alert-script.js"></script>
 
  <!-- Index js -->
  <%--<script src="../assets/js/index.js"></script>--%>
  <script src="../assets/js/moment.js"></script>
    <script>


        function berror() {
            var btitle = $("#<%= txtBranchtitle.ClientID %>");
            if (btitle.val() == "") {
                btitle.addClass("error");
                $("#bterror").removeClass("d-none");
            }
            btitle.focus(function () {
                btitle.removeClass("error");
                $("#bterror").addClass("d-none");
            })

            //alert("enter the branch title first");
        }

        function bsave() {
            alert("Branch data saved");
        }

        function merror(x) {
            var countertitle = $("#<%= txtcountertitle.ClientID %>");
            var username = $("#<%= txtusername.ClientID %>");
            var password = $("#<%= txtpassword.ClientID %>");
            if (x == 1) {
                if (countertitle.val() == "") {
                    countertitle.addClass("error");
                    $("#cterror").removeClass("d-none");
                }
                countertitle.focus(function () {
                    countertitle.removeClass("error");
                    $("#cterror").addClass("d-none");
                });
                if (username.val() == "") {
                    username.addClass("error");
                    $("#uerror").html("Please Enter the Username");
                    $("#uerror").removeClass("d-none");
                }
                username.focus(function () {
                    username.removeClass("error");
                    $("#uerror").addClass("d-none");
                });
                if (password.val() == "") {
                    password.addClass("error");
                    $("#perror").removeClass("d-none");
                }
                password.focus(function () {
                    password.removeClass("error");
                    $("#perror").addClass("d-none");
                });

                //alert("enter the branch title first");
            }
            else if (x == 2) {
                username.addClass("error");
                $("#uerror").html("Not Available");
                $("#uerror").removeClass("d-none");
                username.focus(function () {
                    username.removeClass("error");
                    $("#uerror").addClass("d-none");
                });
            }
            
        }

        function verror(x) {
            if (x == 1) {
                alert("You cant Create a New Branch Until You have any invalid manager Account in any Branch");
            }
            else if (x == 2) {
                alert("You cant Create a New Manager Until You have any invalid manager Account in any Branch");
            }
        }



        function msave() {
            alert("Manager Data saved");
        }
        function showpassword(){
            console.log("in");
            const show = document.querySelector("#show_password i");
            const field = document.querySelector("#<%= txtpassword.ClientID %>");
            show.classList.add("hide-btn");
            if (field.type === "password") {
                field.type = "text";
                show.classList.add("hide-btn");
            } else {
                field.type = "password";
                show.classList.remove("hide-btn");
            }
        }

        function pageload() {
            $('.single-select').select2();
        }
        $(document).ready(function () {
            $('.single-select').select2();
            //script of showing password

        });
        $("#branch").addClass("active");

       // __doPostBack('lnkAddBranch', '');
    </script>
</asp:Content>

