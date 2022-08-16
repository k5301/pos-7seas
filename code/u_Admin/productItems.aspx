<%@ Page Title="" Language="C#" MasterPageFile="~/u_Admin/adminMaster.master" AutoEventWireup="true" CodeFile="productItems.aspx.cs" Inherits="u_Admin_productItems" %>

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
    .lblRate{
        width:100%;height:100%;font-size:15px;padding:0.75rem 1.5rem;
    }
    .txt{
        width:100%;height:100%;border:hidden;font-size:15px;padding:0.75rem 1.5rem;
    }
    .resetPadding{
        padding:0 !important;
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
		    <h4 class="page-title">Add/Update/Remove Items here...</h4>
		    
	   </div>
     </div>
    <!-- End Breadcrumb-->
            <div class="row">
               
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header text-uppercase">Item Insertion</div>
                        <div class="card-body">
                            <div class="row">
                                <div class ="col-4">
                                    <label>
                                        Select Type
                                    </label>
                                    <asp:DropDownList ID="drpType" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpType_SelectedIndexChanged">
                                        <asp:ListItem Value="1" Text="Restaurant"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Bar"></asp:ListItem>
                                    </asp:DropDownList>
                            
                                </div>
                                <div class ="col-8">
                                    <label>
                                        Select Category
                                    </label>
                                    <asp:DropDownList ID="drpCategory" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpCategory_SelectedIndexChanged">
                                    </asp:DropDownList>
                            
                                </div>
                            </div>
                                    
                                    <hr/>


                            <div class="row">
                                <div class="col-sm-8 pt-sm-2">
                                    
                                    <label>
                                        Enter Item Name
                                    </label>
                                    <div>
                                        <asp:TextBox ID="txtItemName" CssClass="form-control text-uppercase" placeholder="" runat="server"></asp:TextBox>
                                        <label id="in_error" class="error-label d-none">Please Enter the Item Name</label>   
                                    </div>

                                </div>
                                <div class="col-sm-4 pt-3 pt-sm-0 justify-content-center">
                                    <div runat="server" id="divupload">
                                        
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
                                         <asp:Image ID="imgDefault" Visible="false" ImageUrl="../images/category/c2b7011.jpg" runat="server" />
                                       <asp:FileUpload ID="profile_choose" accept="image/*" hidden="hidden" runat="server" />
                                     
                                    </div>
                                    </div> 
                                    <div runat="server" visible="false" id="divshow">
                                        <asp:Image ID="imgUploaded" ImageUrl="" style="width:150px;height:100px" runat="server" />
                                    </div>
                                </div>
                            </div>
                            
                            <hr />

                            <div runat="server" id="divhideRaterow" class="row">
                                <div class="col-6">
                                    <label>
                                        Select Varient Type
                                    </label>
                                    <asp:DropDownList ID="drpVarient" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-6">
                                    
                                    <label>
                                        Enter Rate
                                    </label>
                                    <div>
                                        <asp:TextBox ID="txtRate" CssClass="form-control text-uppercase" placeholder="" runat="server"></asp:TextBox>
                                        <label id="r_error" class="error-label d-none">Please Enter the Rate</label>   
                                    </div>
                                </div>
                            </div>
                            <label id="m_error" class="error-label d-none">Record Already Exists</label> 
                            <hr />
                            <div runat="server" id="divShowInsertbtn">
                            <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Insert" OnClick="btnAdd_Click"/>
                            <asp:Button ID="btnReset" CssClass="btn btn-outline-primary" runat="server" Text="Reset" OnClick="btnReset_Click"/>
                            <asp:Button ID="btnCancel" CssClass="btn btn-outline-primary" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>

                            </div>
                            <div runat="server" id="divShowUpdatebtn" visible="false">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
                            <asp:Button ID="btnCancelUpdate" CssClass="btn btn-outline-primary" runat="server" Text="Cancel" OnClick="btnCancelUpdate_Click"/>

                            </div>

                            
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-6">
                    <div class="card">
                            <div class="card-header text-uppercase">
                                <div class="row">
                                    <div class="col-sm-4 pt-2">
                                        Items List<span><asp:Label ID="lblCount" runat="server" Text="(3)"></asp:Label></span>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="btn-group float-sm-right">
                                            <asp:Button ID="btnDone" type="button" CssClass="btn btn-outline-primary" runat="server" Text="Options" OnClick="btnDone_Click" />
                                            <%--<button id="btnDone" runat="server" type="button" class="btn btn-outline-primary waves-effect waves-light"><i class="fa fa-cog mr-1"></i> Options</button>--%>
                                            <button type="button" class="btn btn-outline-primary dropdown-toggle dropdown-toggle-split waves-effect waves-light" data-toggle="dropdown">
                                            <span class="caret"></span>
                                            </button>
                                            <div class="dropdown-menu">
                                                <asp:LinkButton ID="lnkDeletion" CssClass="dropdown-item" runat="server" style="text-transform:none" OnClick="lnkDeletion_Click">Deletion</asp:LinkButton>
                                                <div class="dropdown-divider"></div>
                                                <asp:LinkButton ID="lnkUpdateRates" CssClass="dropdown-item" runat="server" style="text-transform:none" OnClick="lnkUpdateRates_Click">Update Rates</asp:LinkButton>
                                                <div class="dropdown-divider"></div>
                                                <asp:LinkButton ID="lnkUpdateItem" CssClass="dropdown-item" runat="server" style="text-transform:none" OnClick="lnkUpdateItem_Click">Update Name-Icon</asp:LinkButton>
                                                <div class="dropdown-divider"></div>
                                                <asp:LinkButton ID="lnkAddVarient" CssClass="dropdown-item" runat="server" style="text-transform:none" OnClick="lnkAddVarient_Click">Add Item Varient</asp:LinkButton>
                                              <%--<a href="javaScript:void();" class="dropdown-item">Action</a>
                                              <a href="javaScript:void();" class="dropdown-item">Another action</a>
                                              <a href="javaScript:void();" class="dropdown-item">Something else here</a>
                                              <div class="dropdown-divider"></div>
                                              <a href="javaScript:void();" class="dropdown-item">Separated link</a>--%>
                                            </div>
                                          </div>
                                        <asp:Button ID="btnEnableDeletion" Visible="false" CssClass="btn btn-outline-primary float-right" runat="server" Text="Deletion" OnClick="btnEnableDeletion_Click"/>
                                        <asp:Button ID="btnEnableUpdation" Visible="false" CssClass="btn btn-outline-primary float-right mr-2" runat="server" Text="Updation" OnClick="btnEnableUpdation_Click"/>

                                    </div>
                                </div>


                            </div>

                        <div class="card-body">

                            <div class="table-responsive hideScrollbar">
                                <div id="divItemsgrd" runat="server">
                                    
                              <asp:GridView   DataKeyNames="rscId"   AutoGenerateColumns="false" CssClass="table border" ID="grdItems" runat="server">
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
                                            <asp:Label ID="lblrscId" runat="server" Text='<%#Bind("rscId") %>'></asp:Label>
                                            <asp:Label ID="lblrcId" runat="server" Text='<%#Bind("rcId") %>'></asp:Label>
                                            <asp:Label ID="lblvarId" runat="server" Text='<%#Bind("varId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Item Name" HeaderStyle-CssClass="grdHeader">
                                        <ItemTemplate>
                                            
                                            <asp:Label ID="lblscIcon" runat="server" style="font-size:14px;" Visible="false" Text='<%#Bind("scIcon") %>'></asp:Label>
                                            
                                            <a id="Image" href='<%#Bind("scIcon") %>' data-fancybox="images" data-caption="Image of Category" style="color:black" title="Image" runat="server">
                                                <asp:Label ID="lblctitle" class="lightbox-thumb img-thumbnail" runat="server" style="font-size:15px;font-weight:500;border:none;margin:0;padding:0;" Text='<%#Bind("sctitle") %>'></asp:Label>
                                            </a>
                                            </ItemTemplate>
                                         <%--<FooterStyle Width="100px"/>
                                         <HeaderStyle Width="100px"/>
                                         <ItemStyle Width="100px" />--%>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Varient" HeaderStyle-CssClass="grdHeader">
                                            <ItemTemplate>
                                                <asp:Label ID="lblvarient" runat="server" style="font-size:14px;" Text='<%#Bind("varient") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterStyle Width="100px"/>
                                            <HeaderStyle Width="100px"/>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        
                                    <asp:TemplateField HeaderText="Rate" HeaderStyle-CssClass="grdHeader">
                                            <ItemTemplate>
                                                <div runat="server" id="divlblRate" class="txt">
                                                    <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Rate") %>'></asp:Label>

                                                </div>
                                                <asp:TextBox ID="txtRate"  Visible="false" CssClass="txt" runat="server" Text='<%#Bind("Rate") %>' ></asp:TextBox>

                                            </ItemTemplate>
                                            <FooterStyle Width="100px"/>
                                            <HeaderStyle Width="100px"/>
                                            <ItemStyle CssClass="resetPadding" Width="100px" />
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
                                    <div runat="server" id="divUpdateRates" visible="false" class="row mt-3">
                                        <div class="col">
                                            
                                        <asp:Button ID="btnUpdateRates" CssClass="btn btn-primary float-right" runat="server" Text="Update" OnClick="btnUpdateRates_Click"/>
                                        </div>
                                    </div>

                                </div>
                                
                                <div id="divItemList" visible="false" runat="server">
                                     <label>
                                        Select Category
                                    </label>
                                    <asp:DropDownList ID="drpCategory2" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpCategory2_SelectedIndexChanged">
                                    </asp:DropDownList>
                                <br />
                                    <asp:Label ID="lbloscTitle" runat="server" Visible="false" Text=""></asp:Label>
                                    <asp:Label ID="lbloscIcon" runat="server" Visible="false" Text=""></asp:Label>
                              <asp:GridView AutoGenerateColumns="false" CssClass="table border" ID="grdItemsList" runat="server" OnRowEditing="grdItemsList_RowEditing">
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

                                    <asp:TemplateField HeaderText="Item Name" HeaderStyle-CssClass="grdHeader">
                                        <ItemTemplate>
                                            
                                            <asp:Label ID="lblscIcon" runat="server" style="font-size:14px;" Visible="false" Text='<%#Bind("scIcon") %>'></asp:Label>
                                            
                                            <a id="Image" href='<%#Bind("scIcon") %>' data-fancybox="images" data-caption="Image of Category" style="color:black" title="Image" runat="server">
                                                <asp:Label ID="lblsctitle" class="lightbox-thumb img-thumbnail" runat="server" style="font-size:15px;font-weight:500;border:none;margin:0;padding:0;" Text='<%#Bind("sctitle") %>'></asp:Label>
                                            </a>
                                            </ItemTemplate>
                                         <%--<FooterStyle Width="100px"/>
                                         <HeaderStyle Width="100px"/>
                                         <ItemStyle Width="100px" />--%>
                                        </asp:TemplateField>
                                        

                                        
                                     <asp:TemplateField ShowHeader="False" HeaderStyle-CssClass="grdHeader">
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
      
      
      function ierror(x) {

          var itemName = $("#<%= txtItemName.ClientID %>");
          var itemRate = $("#<%= txtRate.ClientID %>");
          if (x == 1) {
              if (itemName.val() == "") {
                  itemName.addClass("error");
                  $("#in_error").removeClass("d-none");
              }
              if (itemRate.val() == "") {
                  itemRate.addClass("error");
                  $("#r_error").html("Please Enter the Rate");
                  $("#r_error").removeClass("d-none");
              }
              if (isNaN(itemRate.val())) {
                  itemRate.addClass("error");
                  $("#r_error").html("Please Enter Valid Rate");
                  $("#r_error").removeClass("d-none");
              }
              
          }
          else if (x == 2) {
              $("#m_error").html("Record Already Exist");
              $("#m_error").removeClass("d-none");
          }
          itemName.focus(function () {
              itemName.removeClass("error");
              $("#in_error").addClass("d-none");
              $("#m_error").addClass("d-none");
          });
          itemRate.focus(function () {
              itemRate.removeClass("error");
              $("#r_error").addClass("d-none");
              $("#m_error").addClass("d-none");
          });
          
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
      function uperror(x) {
          var itemName = $("#<%= txtItemName.ClientID %>");
          if (x == 1) {
              $("#m_error").html("Select the Item First");
              $("#m_error").removeClass("d-none");
          }

          if (x == 2) {
              if (itemName.val() == "") {
                  itemName.addClass("error");
                  $("#in_error").removeClass("d-none");
              }
          }
          itemName.focus(function () {
              itemName.removeClass("error");
              $("#in_error").addClass("d-none");
              $("#m_error").addClass("d-none");
          });
      }

      

  </script>
  
</asp:Content>

