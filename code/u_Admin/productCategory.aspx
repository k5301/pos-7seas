<%@ Page Title="" Language="C#" MasterPageFile="~/u_Admin/adminMaster.master" AutoEventWireup="true" CodeFile="productCategory.aspx.cs" Inherits="u_Admin_productCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="assets/css/imageupload.css" rel="stylesheet"/>
  <link href="assets/css/standard.css" rel="stylesheet"/>
    <style>
    .error-label{
        color:red;
    }
    .error{
        border:1px solid red;
    }
    .form-base {
        font-size: .9rem;
        font-weight: 400;
        padding:3px;
        cursor:pointer;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
        

     <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumb-->
     <div class="row pt-2 pb-2 mb-3">
        <div class="col-12">
		    <h4 class="page-title">Add/Update/Remove Products category here...</h4>
		    
	   </div>
     </div>
    <!-- End Breadcrumb-->
            <div class="row">
               
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header text-uppercase">Category Insertion</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-8 pt-sm-2">
                                    <div class="row mb-2">
                                        <div class="col-7">
                                            <label>
                                                Choose Category Type
                                            </label>
                                        </div>
                                        <div class="col-5">
                                            <asp:DropDownList ID="drpType" CssClass="float-right form-base" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpType_SelectedIndexChanged">
                                                <asp:ListItem Value="1" Text="Restaurant"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Bar"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <asp:TextBox ID="txtCategoryName" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox>
                                        <label id="cn_error" class="error-label d-none">Please Enter the Category Name</label>   
                                    </div>

                                </div>
                                <div class="col-sm-4 pt-3 pt-sm-0 justify-content-center">
                                     <div class="img-container">
                                      <div id="profile-wrapper" class="img-wrapper">
                                        <div class="img-main">
                                            <img id="profile-img" style="background-size:cover" class="img-alt" src="" alt="" />
                                        </div>
                                        <div class="content1">
                                          <div class="img-icon">
                                            <img id="default" class="img-alt" style="width:50px;height:50px" src="assets/images/profile-logo/defaultlogo.png" alt="" />
                                          </div>
                                          <div class="img-text">Icon</div>
                                        </div>
                                        <div id="profile-cancel" class="img-cancel">
                                          <i class="icon-close"></i>
                                        </div>
                                        <div class="img-choose" id="choose-profile" style="cursor:pointer"><i class="icon-picture m-auto"></i></div>
                                      </div>
                                         <asp:Button ID="btnIsicon" runat="server" Text="removefile" CssClass="d-none" OnClick="btnIsicon_Click" />
                                         <asp:Label ID="lblisIcon" runat="server" CssClass="d-none" Text=""></asp:Label>
                                         <asp:Label ID="lblcIcon" runat="server" Visible="false" Text=""></asp:Label>
                                         <asp:Image ID="imgDefault" Visible="false" ImageUrl="../images/category/c2b7011.jpg" runat="server" />
                                       <asp:FileUpload ID="profile_choose" accept="image/*" hidden="hidden" runat="server" />
                                     
                                    </div>
                                </div>
                            </div>
                            
                            <hr />
                            <div class="row">
                                <div class="col-12">

                                </div>
                            </div>
                                <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Insert" OnClick="btnAdd_Click"/>
                                <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Visible="false" Text="Update" OnClick="btnUpdate_Click"/>
                            <asp:Button ID="btnCancel" CssClass="btn btn-outline-primary" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
                            <asp:Button ID="btnCancelUpdate" CssClass="btn btn-outline-primary" Visible="false" runat="server" Text="Cancel" OnClick="btnCancelUpdate_Click"/>
                            
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-6">
                    <div class="card">
                            <div class="card-header text-uppercase">
                                <div class="row">
                                    <div class="col-sm-4 pt-2">
                                        Category List<span><asp:Label ID="lblCount" runat="server" Text="(3)"></asp:Label></span>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:Button ID="btnEnableDeletion" CssClass="btn btn-outline-primary float-right" runat="server" Text="Deletion" OnClick="btnEnableDeletion_Click"/>
                                        <asp:Button ID="btnEnableUpdation" CssClass="btn btn-outline-primary float-right mr-2" runat="server" Text="Updation" OnClick="btnEnableUpdation_Click"/>

                                    </div>
                                </div>


                            </div>

                        <div class="card-body">
                            <asp:Label ID="lblrcId" Visible="false" runat="server" Text=""></asp:Label>

                            <div class="table-responsive hideScrollbar">
                              <asp:GridView   DataKeyNames="rcId"   AutoGenerateColumns="false" CssClass="table border" ID="grdCategory" runat="server"  OnRowEditing="grdCategory_RowEditing">
                                <Columns>
                                     <asp:TemplateField HeaderText="SNo." HeaderStyle-CssClass="grdHeader">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>.
                                        </ItemTemplate>
                                         
                                         <FooterStyle Width="30px"/>
                                         <HeaderStyle Width="30px"/>
                                         <ItemStyle Width="30px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ID" Visible="false" HeaderStyle-CssClass="grdHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrcId" runat="server" Text='<%#Bind("rcId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Category Name" HeaderStyle-CssClass="grdHeader">
                                        <ItemTemplate>
                                            
                                            <asp:Label ID="lblcIcon" runat="server" style="font-size:14px;" Visible="false" Text='<%#Bind("cIcon") %>'></asp:Label>
                                            
                                            <a id="Image" href='<%#Bind("cIcon") %>' data-fancybox="images" data-caption="Image of Category" style="color:black" title="Image" runat="server">
                                                <asp:Label ID="lblctitle" class="lightbox-thumb img-thumbnail" runat="server" style="font-size:15px;font-weight:500;border:none;margin:0;padding:0;" Text='<%#Bind("ctitle") %>'></asp:Label>
                                            </a>
                                            </ItemTemplate>
                                         <%--<FooterStyle Width="100px"/>
                                         <HeaderStyle Width="100px"/>
                                         <ItemStyle Width="100px" />--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False" HeaderStyle-CssClass="grdHeader">
                                         <HeaderTemplate>
                                             <asp:CheckBox ID="ChkAll" CssClass="form-check-inline" runat ="server" AutoPostBack="true" OnCheckedChanged="ChkAll_CheckedChanged"/>
                                            <asp:ImageButton ID="imgDelete" OnClientClick="return confirm('All of Your selected record will be deleted')" ImageUrl="~/u_Admin/assets/images/static/remove.png" runat="server" OnClick="lnkDelete_Click"/>
                                         </HeaderTemplate>
                                        
                                        <ItemTemplate>
                                             
                                            <asp:CheckBox ID="Chk" CssClass="form-check-inline" runat ="server" AutoPostBack="true" OnCheckedChanged="Chk_CheckedChanged" />
                                        </ItemTemplate>
                                         <FooterStyle Width="30px"/>
                                         <HeaderStyle Width="30px"/>
                                         <ItemStyle Width="30px" />
                                    </asp:TemplateField>
                                    
                                     <asp:TemplateField ShowHeader="False" Visible="false" HeaderStyle-CssClass="grdHeader">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                         
                                         <FooterStyle Width="50px"/>
                                         <HeaderStyle Width="50px"/>
                                         <ItemStyle Width="50px" />

                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                                
                            </div>

                        </div>
                    </div>
                </div>
                 
                
            </div>
            <!--End Row-->
            <!--start overlay-->
            <div class="overlay toggle-menu">
            </div>
            <!--end overlay-->
        </div>
        <!-- End container-fluid-->
    </div>
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
  
  <!-- Vector map JavaScript -->
  <script src="../assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
  <script src="../assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
  <!-- Chart js -->
  <script src="../assets/plugins/Chart.js/Chart.min.js"></script>
  <script src="../assets/plugins/Chart.js/Chart.extension.js"></script>
  <!-- Index js -->
  <script src="../assets/js/moment.js"></script>
  <script>
      var custom_profile_btn = $("#choose-profile");
      var main_profile_btn = $("#<%= profile_choose.ClientID %>");
      custom_profile_btn.click(function () {
          //console.log("in");
          main_profile_btn.click();
      });

      main_profile_btn.change(function () {
          const wrapper = document.querySelector("#profile-wrapper");
          const img_src = document.querySelector("#profile-img");
          const cancel_btn = document.querySelector("#profile-cancel");
          var btnIsicon = $("#<%= btnIsicon.ClientID %>");

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
                  btnIsicon.click();
              });
              reader.readAsDataURL(file);
          }
      });
      
      
      function cnerror(x) {

          var cn = $("#<%= txtCategoryName.ClientID %>");
          if (x == 1) {
              if (cn.val() == "") {
                  cn.addClass("error");
                  $("#cn_error").html("Please Enter the Category Name");
                  $("#cn_error").removeClass("d-none");
              }
              
          }
          else if (x == 2) {
              cn.addClass("error");
              $("#cn_error").html("This Category Already exists");
              $("#cn_error").removeClass("d-none");
          }
          cn.focus(function () {
              cn.removeClass("error");
              $("#cn_error").addClass("d-none");
          })
          
      }

      function setlogo(pth) {
          const wrapper = document.querySelector("#profile-wrapper");
          const img_src = document.querySelector("#profile-img");
          img_src.src = pth;
          wrapper.classList.add("active");

          $("#profile-cancel").click(function () {
              //console.log("in");
              //const wrapper = document.querySelector("#profile-wrapper");
              //const img_src = document.querySelector("#profile-img");
              var btnIsicon = $("#<%= btnIsicon.ClientID %>");
              img_src.src = "";
              wrapper.classList.remove("active");
              btnIsicon.click();
          });

      }

  </script>
  
</asp:Content>

