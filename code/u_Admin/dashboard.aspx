<%@ Page Title=""  EnableEventValidation="false" Language="C#" MasterPageFile="~/u_Admin/adminMaster.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="u_Admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="assets/css/standard.css" rel="stylesheet"/>
    <style>
         .card .table td,.card .table th{
            padding:3px 10px;
        }
         .btni{
             font-size:9px;
         }

         .content-wrapper{
            padding-bottom:0;
        }
         .card{
             margin-bottom:15px;
         }
         .lnk{
             color:#999;
         }
         .lnkCom:hover{
             color:#20c473;
         }
         .lnkStk:hover{
             color:blue;
         }
         .lnkCan:hover{
             color:#f54ea2;
         }
         .drp{
             width:100px;
         }

         .input-border{
             border:1px solid rgb(236,236,253);
         }
         .btnd{
            font-size:12px;
            /*color:black;*/
            border:1px solid rgba(0,0,0,0.4);
            padding:2px;
            border-radius:50%;
        }
         .drpp{
            width:80px;
        }
         .form-base {
            font-size: .9rem;
            font-weight: 400;
            padding:3px;
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div class="content-wrapper">
    <div class="container-fluid">
        <asp:Label ID="lblodrStatusList" Visible="false" runat="server" Text="1"></asp:Label>

      <!--Start Dashboard Content-->
	  
      <div class="row mt-3">
        <div class="col-12 col-lg-6 col-xl-3">
          <div class="card border-success border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-success mb-0"><asp:Label ID="lblIncome" runat="server" Text=""></asp:Label></h4>
                <span>
                    Total Income
                    <%--<asp:LinkButton ID="lnkodrComplete" CssClass="lnk lnkCom" runat="server" OnClick="lnkodrComplete_Click">Orders Completed</asp:LinkButton>--%>
                </span>
              </div>
              <div class="align-self-center w-circle-icon rounded-circle gradient-quepal">
                <i class="icon-wallet text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
          <div class="col-12 col-lg-6 col-xl-3">
          <div class="card border-info border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-info mb-0"><asp:Label ID="lblOrdersCount" runat="server" Text=""></asp:Label></h4>
                <span>
                    Total Orders
                    <%--<asp:LinkButton ID="lnkodrStack" CssClass="lnk lnkStk" runat="server" OnClick="lnkodrStack_Click">Orders InStack</asp:LinkButton>--%>
                </span>
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
                <h4 class="text-danger mb-0">
                    <asp:Label ID="lblManagersCount" runat="server" Text=""></asp:Label></h4>
                <span>
                    Total Managers
                    <%--<asp:LinkButton ID="lnkodrCanceled" CssClass="lnk lnkCan" runat="server" OnClick="lnkodrCanceled_Click">Orders Canceled</asp:LinkButton>--%>

                </span>
              </div>
               <div class="align-self-center w-circle-icon rounded-circle gradient-bloody">
                <i class="icon-user text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
        
        <div class="col-12 col-lg-6 col-xl-3">
          <div class="card border-warning border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h5 class="text-warning mb-0">Valid Upto</h5>
                <asp:Label ID="lblValidUpto" runat="server" Text=""></asp:Label>
              </div>
              <div class="align-self-center w-circle-icon rounded-circle gradient-blooker">
                <i class="icon-bell text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
      </div>
        
        <div class="row">


       <div class="col-md-7">
           <div class="card">
               <div class="card-header text-uppercase">Orders List
                   <span style="float:right;text-transform:none">
                       <span>Branch</span>
                       <asp:DropDownList ID="drpBranch" CssClass="drp input-border" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpBranch_SelectedIndexChanged"></asp:DropDownList>
                       <span class="ml-2">Manager</span>
                       <asp:DropDownList ID="drpManager" CssClass="drp input-border" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpManager_SelectedIndexChanged"></asp:DropDownList>

                       <span class="ml-2">
                           <span style="cursor:pointer" id="spanChooseDate">Date</span> 
                            <asp:TextBox ID="txtDatepicker" style="width:100px;height:20px" CssClass="text-center input-border" runat="server"></asp:TextBox>
                       </span>
                        <span>
                            <asp:LinkButton CssClass="" ID="lnkSearchOnDate" runat="server" OnClick="lnkSearchOnDate_Click"><i class="icon-refresh"></i></asp:LinkButton>
                        </span>
                    </span>
               </div>
            <div class="card-body pt-0">
                

                <%--<div class="row mb-2">
                    <div class="col-12">
                    <div class="float-left">
                        <span class="p-1 mr-0 input-border">Date</span>
                        <span>
                            <asp:TextBox ID="autoclose_datepicker" style="width:100px" CssClass="text-center input-border" runat="server"></asp:TextBox>
                       </span>
                        <span>
                            <asp:LinkButton CssClass="input-border" style="padding:3px" ID="lnkSearchOnDate" runat="server"><i class="icon-refresh"></i></asp:LinkButton>
                        </span>
                    </div>
                    <div class="float-right">
                        <div id="dateragne-picker">
                         <div class="input-daterange input-group">
                          <input type="text" style="width:100px" class="form-control" name="start" />
                          <div class="input-group-prepend">
                           <span class="input-group-text">to</span>
                          </div>
                          <input type="text" class="form-control" name="end" />
                         </div>
                       </div>

                    </div>

                    </div>
                </div> --%>

                <asp:DropDownList ID="drpPM" CssClass="form-base float-right" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpPM_SelectedIndexChanged">
                    <%--<asp:ListItem Value="0" Text="Pay Method"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Cash"></asp:ListItem>
                    <asp:ListItem Value="2" Text="PayTM"></asp:ListItem>
                    <asp:ListItem Value="3" Text="PhonePay"></asp:ListItem>
                    <asp:ListItem Value="4" Text="GPay"></asp:ListItem>
                    <asp:ListItem Value="5" Text="Card"></asp:ListItem>
                    <asp:ListItem Value="6" Text="Swiggy"></asp:ListItem>
                    <asp:ListItem Value="7" Text="Zomato"></asp:ListItem>--%>
                </asp:DropDownList>
                <asp:DropDownList ID="drpBtype" CssClass="form-base float-right mr-2" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="drpBType_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Bill Type"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Restaurant"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Bar"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Both"></asp:ListItem>
                </asp:DropDownList>

                <div class="table-responsive styleScrollbar" style="height:362px;background:rgba(230,230,230,0.3)">
                    <asp:GridView DataKeyNames="odrId" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" ID="grdOrdersList" runat="server" OnRowCommand="grdOrdersList_RowCommand">
                        <Columns>
                                <asp:TemplateField HeaderText="OdrNo" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblodrId" Visible="false" runat="server" Text='<%#Bind("odrId") %>'></asp:Label>
                                    <asp:Label ID="lblorderNo" runat="server" Text='<%#Bind("orderNo") %>'></asp:Label>
                                </ItemTemplate>
                                         
                                    <FooterStyle Width="20px"/>
                                    <HeaderStyle Width="20px"/>
                                    <ItemStyle Width="20px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Customer Name" Visible="false" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblcustomerName" CssClass="" runat="server" Text='<%#Bind("customerName") %>'></asp:Label>
                                    <asp:Label ID="lbltime" Visible="false" CssClass="" runat="server" Text='<%#Bind("Time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Customer Contact" Visible="false" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblcustomerContact" runat="server" Text='<%#Bind("customerPhone") %>'></asp:Label>
                                    <%--<asp:Label ID="lblpaymentMethod" Visible="false" runat="server" Text='<%#Bind("paymentMethod") %>'></asp:Label>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="For" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblBillType" runat="server" Text='<%#Bind("bType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Bill" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Text='<%#Bind("Total") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tax" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblTaxRate" runat="server" Visible="false" Text='<%#Bind("tax") %>'></asp:Label>
                                    <asp:Label ID="lblTaxAmount" runat="server" Text='<%#Bind("taxAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Vat" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblVatRate" runat="server" Visible="false" Text='<%#Bind("vat") %>'></asp:Label>
                                    <asp:Label ID="lblVatAmount" runat="server" Text='<%#Bind("vatAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Discount" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblDiscount" runat="server" Text='<%#Bind("discount") %>'></asp:Label>
                                    <asp:Label ID="lblTotalAmount" Visible="false" runat="server" Text='<%#Bind("totalAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="In" HeaderStyle-CssClass="grdHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblInpocket" runat="server" Text='<%#Bind("income") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Method" HeaderStyle-CssClass="grdHeader">
                                
                                <ItemTemplate>
                                    <asp:Label ID="lblpmId" runat="server" Visible="false" Text='<%#Bind("pmId") %>'></asp:Label>
                                    <asp:Label ID="lblpaymentMethod" runat="server" Text='<%#Bind("paymentMethod") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
        
                            <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="grdHeader">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDetail" CommandArgument='<%#Bind("odrId") %>' CommandName="info" runat="server"><i class="fa fa-info-circle"></i></asp:LinkButton>
                            </ItemTemplate>
                                         
                                <FooterStyle Width="50px"/>
                                <HeaderStyle Width="50px"/>
                                <ItemStyle Width="50px" />

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>                        
                </div>
                <div class="row mt-3">
                    <div class="col-3">
                        <span class="float-right" style="font-size:12px;font-weight:500">Bill : <asp:Label ID="lblTotalBill" runat="server" Text="0"></asp:Label></span>
                    </div>
                    <div class="col-2">
                        <span class="float-right" style="font-size:12px;font-weight:500">Tax : <asp:Label ID="lblTotalTaxAmount" runat="server" Text="0"></asp:Label></span>
                    </div>
                    <div class="col-2">
                        <span class="float-right" style="font-size:12px;font-weight:500">Vat : <asp:Label ID="lblTotalVatAmount" runat="server" Text="0"></asp:Label></span>
                    </div>
                    <div class="col-2">
                        <span class="float-right" style="font-size:12px;font-weight:500">Dis. : <asp:Label ID="lblTotalDiscount" runat="server" Text="0"></asp:Label></span>
                    </div>
                    <div class="col-2">
                        <span class="float-right" style="font-size:12px;font-weight:500">In : <asp:Label ID="lblTotalAmount" style="font-size:14px" runat="server" Text="0"></asp:Label></span>
                    </div>
                </div>         
                            
            </div>
           </div>
            
        </div>

      <div class="col-md-5">
                    <asp:Label ID="lblodrId" runat="server" Visible="false" Text=""></asp:Label>
                    <div class="card card-bill">
                        <div class="card-header text-uppercase">Order Info
                            <span style="float:right;text-transform:none">
                                <span style="font-size:12px">OrderNo: </span><asp:Label ID="lblOrderNo" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <span class="span-tag">Name: <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label></span>
                                    <span class="span-tag float-right">Time: <asp:Label ID="lblTime" runat="server" Text=""></asp:Label></span>
                                </div>
                                <div class="col-12">
                                    <span class="span-tag">Contact: <asp:Label ID="lblCustomerContact" runat="server" Text=""></asp:Label></span>
                                    <span class="span-tag float-right">Pay-Method: 
                                        <span>
                                        <asp:Label ID="lblPaymentMethod" Visible="false" runat="server" Text=""></asp:Label>
                                            <asp:DropDownList ID="drpPaymentMethod" CssClass="form-base drpp" runat="server"></asp:DropDownList>
                                                                                  
                                        </span></span>
                                </div>
                            </div>
                            <div class="table-responsive styleScrollbar mt-3" style="height:300px;background:rgba(230,230,230,0.3)">
                                    
                                <asp:GridView DataKeyNames="billId" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" ID="grdBill" OnRowCommand="grdBill_RowCommand" runat="server">
                                        <Columns>
                                                <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="grdHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbillId" Visible="false" runat="server" Text='<%#Bind("billId") %>'></asp:Label>
                                                    <%# Container.DataItemIndex + 1 %>.
                                                </ItemTemplate>
                                         
                                                    <FooterStyle Width="20px"/>
                                                    <HeaderStyle Width="20px"/>
                                                    <ItemStyle Width="20px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Item" HeaderStyle-CssClass="grdHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemName" CssClass="text-lowercase" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Var" HeaderStyle-CssClass="grdHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVarient" runat="server" Text='<%#Bind("varient") %>'></asp:Label>
                                                    <asp:Label ID="lblType" Visible="false" runat="server" Text='<%#Bind("type") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="qty" HeaderStyle-CssClass="grdHeader">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkQtyDecrease" CommandName="Decrease" runat="server"><i class="fa fa-minus btnd"></i></asp:LinkButton>
                                                    <asp:Label ID="lblQty" runat="server" Text='<%#Bind("quantity") %>'></asp:Label>
                                                    <asp:LinkButton ID="lnkQtyIncrease" CommandName="Increase" runat="server"><i class="fa fa-plus btnd"></i></asp:LinkButton>
                                                      
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Price" HeaderStyle-CssClass="grdHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%#Bind("Price") %>'></asp:Label>
                                                    <asp:Label ID="lblRate" runat="server" Visible="false" Text='<%#Bind("Rate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="grdHeader">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkCloss" CommandArgument='<%#Bind("billId") %>' CommandName="Cross" runat="server"><i class="fa fa-close btnd"></i></asp:LinkButton>
                                                </ItemTemplate>
                                         
                                                    <FooterStyle Width="50px"/>
                                                    <HeaderStyle Width="50px"/>
                                                    <ItemStyle Width="50px" />

                                            </asp:TemplateField>
    
                                        </Columns>
                                    </asp:GridView>
                                   
                                <div class="row m-0 mt-3">
                                        <div class="col-12">
                                            <span class="float-right" style="font-size: 12px; font-weight: 500">Total:
                                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></span><br />
                                            <span class="float-right" style="font-size: 12px; font-weight: 500">Tax(<asp:Label ID="lblTaxRate" runat="server" Text=""></asp:Label>%):
                                                <asp:Label ID="lblTotalTax" runat="server" Text=""></asp:Label></span><br />
                                            <span class="float-right" style="font-size: 12px; font-weight: 500">Vat(<asp:Label ID="lblVatRate" runat="server" Text=""></asp:Label>%):
                                                <asp:Label ID="lblTotalVat" runat="server" Text=""></asp:Label></span><br />
                                            
                                            <span class="float-right" style="font-size: 12px; font-weight: 500">Discount: <asp:TextBox style="width:60px" ID="txtDiscount" runat="server" Text="0"></asp:TextBox></span>

                                        </div>
                                    </div>          
                                            
                            </div>
                                  
                            <div class="row mt-3">
                                <div class="col-12">
                                <span>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" OnClick="lnkUpdate_Click"><i class="icon-notebook"></i></asp:LinkButton>
                                </span>

                                <span class="float-right" style="font-size:16px;font-weight:500">Total: <asp:Label ID="lblTotalBillAmount" runat="server" Text="0"></asp:Label></span>

                                </div>
                            </div>
                            <%--<div class="row mt-3">
                                <div class="col-12">
                                <span class="span-tag float-right">
                                    
                                    <asp:Button ID="btnCancel" CssClass="btn btn-outline-primary" runat="server" Text="Cancel Order" OnClick="btnCancel_Click"/>
                                    <asp:Button ID="btnOrderDone" CssClass="btn btn-primary" runat="server" Text="Order Done" OnClick="btnOrderDone_Click"/>
                                </span>

                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                  
		
        </div>  
  

      <!--start overlay-->
	  <div class="overlay toggle-menu"></div>
	<!--end overlay-->
    </div>
    <!-- End container-fluid-->
    
    </div>
        
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <!--End content-wrapper-->
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
  <script src="../assets/js/index.js"></script>
  <script src="../assets/js/moment.js"></script>
    
    <!--Bootstrap Datepicker Js-->
    <script src="../assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <script>
        function pageLoad() {
            $("#<%= txtDatepicker.ClientID %>").datepicker({
                autoclose: true,
                todayHighlight: true
            });
        }


        $('#default-datepicker').datepicker({
        todayHighlight: true
        });

        $("#<%= txtDatepicker.ClientID %>").datepicker({
            autoclose: true,
            todayHighlight: true
        });

        

        

        $('#inline-datepicker').datepicker({
            todayHighlight: true
        });

        $('#dateragne-picker .input-daterange').datepicker({
        });

    </script>
</asp:Content>

