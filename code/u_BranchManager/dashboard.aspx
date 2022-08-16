<%@ Page Title="" Language="C#" MasterPageFile="~/u_BranchManager/managerMaster.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="u_BranchManager_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/css/standard.css" rel="stylesheet" />
    <style>
        .card-bill {
            margin-top: 10px;
            height: 650px;
            margin-bottom: 10px;
        }

        .card-item {
            margin-top: 10px;
            height: 350px;
        }

        .card-stack {
            margin-top: 5px;
            height: 260px;
            margin-bottom: 10px;
        }

        .card-new {
            margin-top: 5px;
            height: 260px;
            margin-bottom: 10px;
        }

        #divItems .col-4 {
            padding-left: 10px;
            padding-right: 10px;
        }

            #divItems .col-4 .card {
                margin-bottom: 15px;
            }

                #divItems .col-4 .card .card-body {
                    text-align: center
                }

        #divOrderStack .row .col-4 {
            padding: 0 8px;
        }

            #divOrderStack .row .col-4 .card {
                margin-bottom: 15px;
            }

        .icon-size {
            width: 100%;
            height: 100px;
            background-size: cover;
        }

        .tableNo {
            width: 50px;
        }

        .span-tag {
            font-size: 10px;
        }

            .span-tag span {
                font-size: 12px;
            }

        .drpp {
            width: 80px;
        }

        .card .table td, .card .table th {
            padding: 3px 10px;
        }

        .btni {
            font-size: 12px;
            /*color:black;*/
            border: 1px solid rgba(0,0,0,0.4);
            padding: 2px;
            border-radius: 50%;
        }

        .categoryIcon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            vertical-align: middle;
            border-style: none;
        }

        .list-group-item {
            padding: 0.5rem;
        }

        .content-wrapper {
            padding-bottom: 0;
        }
        .form-base {
        font-size: .9rem;
        width:50px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="container-fluid">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <asp:Label ID="lblRestaurantId" runat="server" Visible="false" Text=""></asp:Label>
                        <asp:Label ID="lblBranchId" runat="server" Visible="false" Text=""></asp:Label>
                        <asp:Label ID="lblOnDateChk" runat="server" Visible="false" Text=""></asp:Label>

                        <div class="col-lg-4 col-md-5" id="ticket">
                            <asp:Label ID="lblodrId" runat="server" Visible="false" Text=""></asp:Label>
                            <asp:Label ID="lblTax" runat="server" Visible="false" Text=""></asp:Label>
                            <asp:Label ID="lblVat" runat="server" Visible="false" Text=""></asp:Label>
                            <div runat="server" id="divShowBillInfo" class="card card-bill">
                                <div class="card-header text-uppercase">
                                    <span id="info">Bill Info</span>
                                    <span style="float: right; text-transform: none">
                                        <span style="font-size: 12px" id="ord">OrderNo: </span>
                                        <asp:Label ID="lblOnOrderNo" runat="server" Text=""></asp:Label>

                                    </span>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <%--<div class="col-md-12" style="float:left;"> <img style="height:50px; widows:70px;" src="../images/logo/bswLogo.jpg"> 
                                                <div class="col-md-6" style="float:right; font-size:12px; color:maroon; margin-left:20px; ">226, D-14, <br>Sec-3, Rohini. </div>

                                            </div>
                                            
                                            <br><br /><br>--%>
                                            <div id="sslh" class="row mb-3">
                                                 <div class="col-6">
                                                     <img class="float-right" style="height:50px; widows:70;" src="../images/logo/7seas2.png"/> 
                                                 </div>
                                                 <div class="col-6" style="color:maroon;font-size:12px">
                                                     <span>226, D-14, <br>Sec-3, Rohtak.</span> 
                                                 </div>
                                            </div>

                                            <div class="d-none" style="margin-bottom:3px";>
                                                 <div style="display:flex">
                                                     <img style="height:50px;margin:0px 5px; widows:70;" src="../images/logo/7seas2.png"/>
                                                     <span style="font-weight:700;font-size:12px;"> 226, D-14,<br /> Sec-3, Rohtak.<br />
                                                          <asp:Label ID="lblBillDate" CssClass="bdnone" runat="server" Text=""></asp:Label>
                                                     </span>
                                                     <span class="col-md-6">
                                                            <asp:Label ID="lblBillOrderNo" CssClass="orderNo" runat="server" Text=""></asp:Label>
                                                        </span> 
                                                 </div>
                                            </div>
                                               
                                           
                                            <span id="cname" class="span-tag">Name:
                                                <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label></span>
                                            <span id="dateh" class="span-tag float-right">Date:
                                                <asp:Label ID="lblonDate" runat="server" Text=""></asp:Label></span>
                                        </div>
                                        <div class="col-12">
                                            <span id="contacth" class="span-tag">Contact:
                                                <asp:Label ID="lblCustomerContact" runat="server" Text=""></asp:Label></span>
                                            <span id="mode" class="span-tag float-right">Pay-Method: <span>
                                                <asp:DropDownList ID="drpPaymentMethod" CssClass="drpp" runat="server"></asp:DropDownList></span></span>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <div >

                                            </div>
                                            <div>
                                                <div class="table-responsive styleScrollbar" style="max-height: 300px; background: rgba(230,230,230,0.3)">
                                                    <div runat="server" id="divTheBill">
                                                        <asp:GridView DataKeyNames="billId" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" ID="grdBill" runat="server" OnRowCommand="grdBill_RowCommand">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbillId" Visible="false" runat="server" Text='<%#Bind("billId") %>'></asp:Label>
                                                                        <%# Container.DataItemIndex + 1 %>.
                                                                    </ItemTemplate>

                                                                    <FooterStyle Width="20px" />
                                                                    <HeaderStyle Width="20px" />
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
                                                                        <asp:LinkButton ID="lnkQtyDecrease" CommandName="Decrease" runat="server"><i class="fa fa-minus btni"></i></asp:LinkButton>
                                                                        <asp:Label ID="lblQty" runat="server" Text='<%#Bind("quantity") %>'></asp:Label>
                                                                        <asp:LinkButton ID="lnkQtyIncrease" CommandName="Increase" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Price" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPr" runat="server" Text='<%#Bind("Price") %>'></asp:Label>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPrice" runat="server" Text='<%#Bind("Price") %>'></asp:Label>
                                                                        <asp:Label ID="lblRate" runat="server" Visible="false" Text='<%#Bind("Rate") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkCloss" CommandArgument='<%#Bind("billId") %>' CommandName="Cross" runat="server"><i class="fa fa-close btni"></i></asp:LinkButton>
                                                                    </ItemTemplate>

                                                                    <FooterStyle Width="50px" />
                                                                    <HeaderStyle Width="50px" />
                                                                    <ItemStyle Width="50px" />

                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>

                                                    <div runat="server" id="divStartBill">
                                                        <table class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">#</th>
                                                                    <th scope="col">Item</th>
                                                                    <th scope="col">Var</th>
                                                                    <th scope="col">Qty</th>
                                                                    <th scope="col">Price</th>
                                                                    <th scope="col">#</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <th scope="row">1</th>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <%--<asp:GridView AutoGenerateColumns="false" CssClass="table table-bordered table-striped" ID="GridView1" runat="server" OnRowEditing="grdItemVarients_RowEditing">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Var" HeaderStyle-CssClass="grdHeader">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblrscId" Visible="false" runat="server" Text='<%#Bind("rscId") %>'></asp:Label>
                                                                <asp:Label ID="lblVarient" runat="server" Text='<%#Bind("varient") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Rate" HeaderStyle-CssClass="grdHeader">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Rate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                    
                                                         <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="grdHeader">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkAdd" CausesValidation="False" CommandName="Edit" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                            </ItemTemplate>
                                         
                                                             <FooterStyle Width="50px"/>
                                                             <HeaderStyle Width="50px"/>
                                                             <ItemStyle Width="50px" />

                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>--%>


                                                    <%--<table class="table table-bordered table-striped">
                                              <thead>
                                                <tr>
                                                  <th scope="col">#</th>
                                                  <th scope="col">Item</th>
                                                  <th scope="col">Var</th>
                                                  <th scope="col">Qty</th>
                                                  <th scope="col">Price</th>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <tr>
                                                  <th scope="row">1</th>
                                                  <td>Mango Juice</td>
                                                  <td>Large</td>
                                                  <td>
                                                         <asp:LinkButton ID="LinkButton1" Enabled="false" runat="server"><i class="fa fa-minus btni"></i></asp:LinkButton>
                                                          12
                                                          <asp:LinkButton ID="lnkbtn" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      
                                                      </td>
                                                  <td>300</td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">2</th>
                                                  <td>Chole</td>
                                                  <td>Full</td>
                                                  <td>3</td>
                                                  <td>110</td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">1</th>
                                                  <td>Mango</td>
                                                  <td>Large</td>
                                                  <td>2</td>
                                                  <td>240</td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">2</th>
                                                  <td>Chole</td>
                                                  <td>Full</td>
                                                  <td>3</td>
                                                  <td>340</td>
                                                </tr>
                                                
                                                <tr>
                                                  <th scope="row">1</th>
                                                  <td>Mango</td>
                                                  <td>Large</td>
                                                  <td>2</td>
                                                  <td>190</td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">2</th>
                                                  <td>Chole</td>
                                                  <td>Full</td>
                                                  <td>3</td>
                                                  <td>290</td>
                                                </tr>
                                                
                                                
                                              </tbody>
                                            </table>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3" id="ttl">
                                        <div class="d-none">
                                            <span id="spanTotal" class="float-right" style="font-size: 12px; font-weight: 500">Total :
                                                <asp:Label ID="lblTotal2" runat="server" Text=""></asp:Label></span>
                                        </div>
                                        <div class="col-4">
                                            
                                            <span id="spanTax" class="float-right" style="font-size: 12px; font-weight: 500">GST (<asp:Label ID="lblTaxRate" runat="server" Text="5%"></asp:Label>) :
                                                <asp:Label ID="lblTotalTax" runat="server" Text=""></asp:Label></span>
                                        </div>
                                        <div class="col-4">
                                            <span id="spanVat" class="float-right" style="font-size: 12px; font-weight: 500">Vat (<asp:Label ID="lblVatRate" runat="server" Text="18%"></asp:Label>) :
                                                <asp:Label ID="lblTotalVat" runat="server" Text=""></asp:Label></span>
                                        </div>
                                        <div id="spanTotalh" class="col-4">
                                            <span  class="float-right" style="font-size: 12px; font-weight: 500">Total :
                                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></span>
                                        </div>
                                        <div class="col-12">                                           
                                            <span id="spanTotalAmount" class="float-right" style="font-size: 12px; font-weight: 500">Total Amount :
                                                <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label></span> 
                                            <br />
                                            <span id="spanDiscount" class="float-right" style="font-size: 12px; font-weight: 500">Discount :
                                                <asp:TextBox ID="txtDiscountAmount" style="width:60px;height:20px;" runat="server" Text=""></asp:TextBox>
                                                <asp:Label ID="lblDiscount" class="d-none" runat="server" Text=""></asp:Label>
                                                <asp:ImageButton CssClass="dimg d-none" ID="btnSetDiscount" style="width:auto;height:15px" ImageUrl="~/images/custom/discount.png" runat="server" OnClick="btnSetDiscount_Click" />
                                            </span>
                                            <br />
                                            
                                             <span id="spanAmount" class="float-right" style="font-size: 12px; font-weight: 500">Total Bill :
                                                <asp:Label ID="lblTotalBill" runat="server" Text=""></asp:Label></span>

                                        
                                                                                       
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-12" id="done" style="position:absolute;bottom:10px;right:10px">
                                            <span class="span-tag float-right">

                                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-primary" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                <asp:Button ID="btnSave" CssClass="btn btn-outline-primary" Visible="false" runat="server" Text="Save" OnClick="btnSave_Click" />
                                                <asp:Button OnClientClick="return ptt();" ID="btnOrderDone" CssClass="btn btn-primary" runat="server" Text="Done" OnClick="btnOrderDone_Click" />
                                                <input type="button" style="display: none;" value="bill" id="btnPrint" onclick="ptt()" />
                                            </span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-8 col-md-7">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card card-item">
                                        <div class="card-header text-uppercase">
                                            Products : Category - Items
                                    <span style="float: right; text-transform: none">
                                        <span style="font-size: 12px">Category :</span>
                                        <asp:Label ID="lblSelectedCategoryName" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lblSelectedCategoryId" Visible="false" runat="server" Text="1"></asp:Label>
                                    </span>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-3" style="padding: 0 15px 0 5px">
                                                    <ul class="list-group">
                                                        <li class="list-group-item">
                                                            <span class="user-profile mr-2">
                                                                <asp:Image Style="box-shadow: none" ID="imgSelectedscIcon" ImageUrl="" class="img-circle" alt="" runat="server" />
                                                            </span>
                                                            <asp:Label ID="lblSelectedSubCategoryName" Style="color: black; font-size: 12px; font-weight: 600" runat="server" Text=""></asp:Label>


                                                            <%--<span class="badge badge-primary badge-pill float-right mt-2">14</span>--%>
                                                        </li>
                                                    </ul>


                                                    <div class="table-responsive styleScrollbar" style="max-height: 205px; margin-top: 10px; background: rgba(230,230,230,0.3); padding: 0 1px">
                                                        <asp:GridView AutoGenerateColumns="false" CssClass="table table-bordered table-striped" ID="grdItemVarients" runat="server" OnRowEditing="grdItemVarients_RowEditing">
                                                            <Columns>
                                                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkAdd" CausesValidation="False" CommandName="Edit" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                                    </ItemTemplate>

                                                                    <FooterStyle Width="50px" />
                                                                    <HeaderStyle Width="50px" />
                                                                    <ItemStyle Width="50px" />

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Var" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblrscId" Visible="false" runat="server" Text='<%#Bind("rscId") %>'></asp:Label>
                                                                        <asp:Label ID="lblVarient" runat="server" Text='<%#Bind("varient") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Rate" HeaderStyle-CssClass="grdHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblRate" runat="server" Text='<%#Bind("Rate") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                            
                                                            </Columns>
                                                        </asp:GridView>


                                                        <%--<table class="table table-bordered table-striped">
                                              <thead>
                                                <tr>
                                                  <th scope="col">Var</th>
                                                  <th scope="col">Rate</th>
                                                  <th scope="col">#</th>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <tr>
                                                  <td>Full</td>
                                                  <td>300</td>
                                                  <td><asp:LinkButton ID="LinkButton6" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                  <td>Large</td>
                                                  <td>240</td>
                                                  <td><asp:LinkButton ID="LinkButton7" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                  <td>Large</td>
                                                  <td>240</td>
                                                  <td><asp:LinkButton ID="LinkButton2" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                  <td>Large</td>
                                                  <td>240</td>
                                                  <td><asp:LinkButton ID="LinkButton3" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                  <td>Large</td>
                                                  <td>240</td>
                                                  <td><asp:LinkButton ID="LinkButton4" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                  <td>Large</td>
                                                  <td>240</td>
                                                  <td><asp:LinkButton ID="LinkButton8" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                  <td>Large</td>
                                                  <td>240</td>
                                                  <td><asp:LinkButton ID="LinkButton9" runat="server"><i class="fa fa-plus btni"></i></asp:LinkButton>
                                                      </td>
                                                </tr>
                                                
                                                
                                              </tbody>
                                            </table>--%>
                                                    </div>

                                                </div>

                                                <div class="col-6" style="padding: 0 5px;">

                                                    <div class="table-responsive styleScrollbar" style="height: 275px">
                                                        <div id="divItems" class="row m-0">
                                                            <asp:Repeater ID="rptCategoryItemsList" runat="server" OnItemCommand="rptCategoryItemsList_ItemCommand">
                                                                <ItemTemplate>
                                                                    <div class="col-4">
                                                                        <div class="card card-primary">
                                                                            <asp:ImageButton ID="imgscIcon" ImageUrl='<%#Bind("scIcon") %>' CommandArgument='<%#Bind("scTitle") %>' CssClass="card-img-top icon-size" alt="" runat="server" />
                                                                            <div class="card-body p-0 hideScrollbar" style="width: 100%; overflow: scroll">
                                                                                <%--<asp:Label ID="lblrscId" runat="server" Visible="false" Text='<%#Bind("rscId") %>'></asp:Label>--%>
                                                                                <asp:LinkButton ID="lnksctitle" CssClass="card-title text-primary my-1" Style="font-size: 10px;" CommandArgument='<%#Bind("scTitle") %>' runat="server" Text='<%#Bind("scTitle") %>'></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </ItemTemplate>
                                                            </asp:Repeater>


                                                            <%--<div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="imgIcon" ImageUrl="../assets/images/gallery/1.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="lblsctitle" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/category/7155f64.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label7" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/category/9142a98.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label8" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/category/b0f80f8.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label9" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton4" ImageUrl="~/images/category/9bd6573.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label10" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton5" ImageUrl="~/images/category/7155f64.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label11" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton6" ImageUrl="~/images/category/d42d244.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label12" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton7" ImageUrl="../assets/images/gallery/1.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label13" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton8" ImageUrl="../assets/images/gallery/1.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label14" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton9" ImageUrl="../assets/images/gallery/1.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label15" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                         <div class="card card-primary">
                                                            <asp:ImageButton ID="ImageButton10" ImageUrl="../assets/images/gallery/1.jpg" CssClass="card-img-top icon-size" alt="Card image cap" runat="server" />
                                                             <div class="card-body p-0 hideScrollbar" style="width:100%;overflow:scroll">
                                                                <asp:Label ID="Label16" CssClass="card-title text-primary my-1" style="font-size:10px;" runat="server" Text="Card Sample Title"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                        </div>


                                                    </div>
                                                </div>

                                                <div class="col-3" style="padding-right: 5px">
                                                    <asp:DropDownList ID="drpType" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpType_SelectedIndexChanged">
                                                        <asp:ListItem Value="0" Text="Both"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Restaurant"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Bar"></asp:ListItem>
                                                    </asp:DropDownList>

                                                    <div class="table-responsive styleScrollbar" style="height: 235px">
                                                        <ul class="list-group">
                                                            <asp:Repeater ID="rptCategoryList" runat="server" OnItemCommand="rptCategoryList_ItemCommand">
                                                                <ItemTemplate>
                                                                    <li class="list-group-item">
                                                                        <span class="user-profile mr-2">
                                                                            <asp:ImageButton Style="box-shadow: none" ID="imgcIcon" ImageUrl='<%#Bind("cIcon") %>' CommandArgument='<%#Bind("rcId") %>' class="categoryIcon" alt="" runat="server" />
                                                                        </span>
                                                                        <asp:LinkButton ID="lnkctitle" Style="color: black" CommandArgument='<%#Bind("rcId") %>' Text='<%#Bind("cTitle") %>' runat="server"></asp:LinkButton>
                                                                        <%--<asp:Label ID="lblctitle" style="color:black" runat="server"  Text='<%#Bind("cTitle") %>'></asp:Label>--%>
                                                                        <asp:Label ID="lblSubCategoryCount" CssClass="badge badge-primary badge-pill float-right mt-2" runat="server" Text='<%#Bind("scCount") %>'></asp:Label>
                                                                        <asp:Label ID="lblrcId" runat="server" Visible="false" Text='<%#Bind("rcId") %>'></asp:Label>


                                                                    </li>

                                                                </ItemTemplate>
                                                            </asp:Repeater>


                                                        </ul>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="card card-stack">
                                        <div class="card-header text-uppercase">Orders Stack : <span style="font-size: 12px; float: right; text-transform: none">OrderNo/TabelNo</span></div>
                                        <div class="card-body">
                                            <div id="divOrderStack" class="table-responsive styleScrollbar" style="height: 180px; padding: 0 15px">
                                                <div class="row">
                                                    <asp:Repeater ID="rptOrderStack" runat="server" OnItemCommand="rptOrderStack_ItemCommand">
                                                        <ItemTemplate>
                                                            <div class="col-4">
                                                                <div class="card gradient-orange">
                                                                    <div class="card-body text-center px-1 py-2">
                                                                        <asp:Label ID="lblodrId" runat="server" Visible="false" Text='<%#Bind("odrId") %>'></asp:Label>
                                                                        <asp:LinkButton ID="lnkOrderDetails" class="text-white" CommandArgument='<%#Bind("odrId") %>' Text='<%#Bind("info") %>' runat="server">
                                                                
                                                                        </asp:LinkButton>
                                                                        <%--<span class="text-white">24/1</span>--%>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-8">
                                    <div class="card card-new">
                                        <div class="card-header text-uppercase">New Order <span style="font-size: 12px; float: right; text-transform: none">Customer Info</span></div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-3">
                                                     Order No:
                                                    <asp:Label ID="lblOrderNo" runat="server" Text=""></asp:Label>
                                                    
                                                </div>
                                                <div class="col-3">
                                                    Tabel: <span class="ml-2">
                                                        <asp:TextBox ID="txtTable" CssClass="tableNo form-base" runat="server"></asp:TextBox></span>
                                                  
                                                </div>
                                                <div class="col-3" hidden ="true">
                                                    <span>Tax(%) </span><span><asp:TextBox ID="txtTax" Text="5" CssClass="form-base" runat="server"></asp:TextBox></span>
                                                  
                                                </div>
                                                <div class="col-3" hidden="true">
                                                    <span>Vat(%) </span><span><asp:TextBox ID="txtVat" Text="18" CssClass="form-base" runat="server"></asp:TextBox></span>
                                                    
                                                  
                                                </div>
                                                <div class="col-12">
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <asp:DropDownList ID="drpBtype" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="1" Text="Restaurant"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Bar"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Both"></asp:ListItem>
                                                    </asp:DropDownList>
                                                            
                                                        </div>
                                                        <div class="col-4">
                                                              <asp:TextBox ID="txtCustomerName" CssClass="form-control" placeholder="Customer Name" runat="server"></asp:TextBox> 

                                                        </div>
                                                        <div class="col-4">
                                                            <asp:TextBox ID="txtCustomerPhone" CssClass="form-control" placeholder="Customer Phone" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>
                                                 <div class="col-3 mt-3">
                                                     
                                                     <asp:Button ID="btnMakeOrder" runat="server" CssClass="btn btn-outline-primary" Text="Make Order" OnClick="btnMakeOrder_Click" />
                                                           
                                                </div>
                                                
                                                
                                            </div>
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


                </ContentTemplate>
            </asp:UpdatePanel>

            <%--<div class="row">
               
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header text-uppercase">Category Insertion</div>
                        <div class="card-body">
                            
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-6">
                    <div class="card">
                            <div class="card-header text-uppercase">
                                
                                </div>

                        <div class="card-body">
                            
                        </div>
                    </div>
                </div>
                 
                
            </div>--%>
            <!--End Row-->
            <!--start overlay-->
            <div class="overlay toggle-menu">
            </div>

            <%-- <!--Start Dashboard Content-->
      <div class="row mt-3">
        <div class="col-12 col-lg-6 col-xl-3">
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
        <div class="col-12 col-lg-6 col-xl-3">
          <div class="card border-warning border-left-sm">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-warning mb-0">8400</h4>
                <span>New Users</span>
              </div>
              <div class="align-self-center w-circle-icon rounded-circle gradient-blooker">
                <i class="icon-user text-white"></i></div>
            </div>
            </div>
          </div>
        </div>
      </div>
        <!--End Row-->
		  
		  
      <div class="row">
        <div class="col-12 col-lg-8 col-xl-8">
          <div class="card">
    		   <div class="card-header">
                    Product Sales 
    				<div class="card-action">
    				 <div class="dropdown">
    				 <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
    				  <i class="icon-options"></i>
    				 </a>
    				    <div class="dropdown-menu dropdown-menu-right">
    						<a class="dropdown-item" href="javascript:void();">Action</a>
    						<a class="dropdown-item" href="javascript:void();">Another action</a>
    						<a class="dropdown-item" href="javascript:void();">Something else here</a>
    						<div class="dropdown-divider"></div>
    						<a class="dropdown-item" href="javascript:void();">Separated link</a>
    					 </div>
    				  </div>
                     </div>
    				</div>
                 <div class="card-body">
				   <div class="chart-container-1">
				       <canvas id="dashboard-chart-1"></canvas>
				   </div>
                 </div>
          </div>
        </div>
		
        <div class="col-12 col-lg-4 col-xl-4">
          <div class="card">
		   <div class="card-header">
                Trending Products
				<div class="card-action">
				 <div class="dropdown">
				 <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
				  <i class="icon-options"></i>
				 </a>
				    <div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="javascript:void();">Action</a>
						<a class="dropdown-item" href="javascript:void();">Another action</a>
						<a class="dropdown-item" href="javascript:void();">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void();">Separated link</a>
					 </div>
				  </div>
                 </div>
              </div>
             <div class="card-body">
              <div class="chart-container-1">
                <canvas id="dashboard-chart-2"></canvas>
              </div>
            </div>
          </div>
        </div>
		
      </div>
        <!--End Row-->

      <div class="row">
        <div class="col-lg-12">
          <div class="card">
		  <div class="card-header border-0">
                Recent Orders
				<div class="card-action">
				 <div class="dropdown">
				 <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
				  <i class="icon-options"></i>
				 </a>
				    <div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="javascript:void();">Action</a>
						<a class="dropdown-item" href="javascript:void();">Another action</a>
						<a class="dropdown-item" href="javascript:void();">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void();">Separated link</a>
					 </div>
				  </div>
                 </div>
                </div>
               <div class="table-responsive">
                 <table class="table align-items-center table-flush">
                  <thead>
                   <tr>
                     <th>Product</th>
                     <th>Photo</th>
                     <th>Product ID</th>
                     <th>Status</th>
                     <th>Amount</th>
                     <th>Date</th>
                     <th>Shipping</th>
                   </tr>
                   </thead>
                   <tr>
                    <td>Iphone 5</td>
                    <td><img src="../assets/images/products/01.png" class="product-img" alt="product img"></td>
                    <td>#9405822</td>
                    <td><span class="badge gradient-quepal text-white shadow">Paid</span></td>
                    <td>$ 1250.00</td>
                    <td>03 Feb 2020</td>
					<td><div class="progress shadow" style="height: 6px;">
                          <div class="progress-bar gradient-quepal" role="progressbar" style="width: 100%"></div>
                        </div></td>
                   </tr>

                   <tr>
                    <td>Earphone GL</td>
                    <td><img src="../assets/images/products/02.png" class="product-img" alt="product img"></td>
                    <td>#8304620</td>
                    <td><span class="badge gradient-blooker text-white shadow">Pending</span></td>
                    <td>$ 1500.00</td>
                    <td>05 Feb 2020</td>
					<td><div class="progress shadow" style="height: 6px;">
                          <div class="progress-bar gradient-blooker" role="progressbar" style="width: 60%"></div>
                        </div></td>
                   </tr>

                   <tr>
                    <td>HD Hand Camera</td>
                    <td><img src="../assets/images/products/03.png" class="product-img" alt="product img"></td>
                    <td>#4736890</td>
                    <td><span class="badge gradient-bloody text-white shadow">Failed</span></td>
                    <td>$ 1400.00</td>
                    <td>06 Feb 2020</td>
					<td><div class="progress shadow" style="height: 6px;">
                          <div class="progress-bar gradient-bloody" role="progressbar" style="width: 70%"></div>
                        </div></td>
                   </tr>

                   <tr>
                    <td>Clasic Shoes</td>
                    <td><img src="../assets/images/products/04.png" class="product-img" alt="product img"></td>
                    <td>#8543765</td>
                    <td><span class="badge gradient-quepal text-white shadow">Paid</span></td>
                    <td>$ 1200.00</td>
                    <td>14 Feb 2020</td>
					<td><div class="progress shadow" style="height: 6px;">
                          <div class="progress-bar gradient-quepal" role="progressbar" style="width: 100%"></div>
                        </div></td>
                   </tr>
                   <tr>
                    <td>Sitting Chair</td>
                    <td><img src="../assets/images/products/06.png" class="product-img" alt="product img"></td>
                    <td>#9629240</td>
                    <td><span class="badge gradient-blooker text-white shadow">Pending</span></td>
                    <td>$ 1500.00</td>
                    <td>18 Feb 2020</td>
					<td><div class="progress shadow" style="height: 6px;">
                          <div class="progress-bar gradient-blooker" role="progressbar" style="width: 60%"></div>
                        </div></td>
                   </tr>
                   <tr>
                    <td>Hand Watch</td>
                    <td><img src="../assets/images/products/05.png" class="product-img" alt="product img"></td>
                    <td>#8506790</td>
                    <td><span class="badge gradient-bloody text-white shadow">Failed</span></td>
                    <td>$ 1800.00</td>
                    <td>21 Feb 2020</td>
					<td><div class="progress shadow" style="height: 6px;">
                          <div class="progress-bar gradient-bloody" role="progressbar" style="width: 40%"></div>
                        </div></td>
                   </tr>
				   
                 </table>
               </div>
          </div>
        </div>
      </div>
        <!--End Row-->

      <div class="row">
         <div class="col-12 col-lg-7 col-xl-8">
           <div class="card">
		     <div class="card-header">Top Selling Country
				 <div class="card-action">
				 <div class="dropdown">
				 <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
				  <i class="icon-options"></i>
				 </a>
				    <div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="javascript:void();">Action</a>
						<a class="dropdown-item" href="javascript:void();">Another action</a>
						<a class="dropdown-item" href="javascript:void();">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void();">Separated link</a>
					 </div>
				  </div>
                 </div>
				</div>
              <div class="card-body">
                 <div class="row">
                   <div class="col-lg-7 col-xl-8 border-right">
                     <div id="dashboard-map" style="height: 274px"></div>
                   </div>
                   <div class="col-lg-5 col-xl-4">

                     <p><i class="flag-icon flag-icon-us mr-1"></i> USA <span class="float-right">70%</span></p>
                     <div class="progress" style="height: 7px;">
                          <div class="progress-bar bg-primary progress-bar-striped" role="progressbar" style="width: 70%"></div>
                      </div>

                      <p class="mt-3"><i class="flag-icon flag-icon-ca mr-1"></i> Canada <span class="float-right">65%</span></p>
                      <div class="progress" style="height: 7px;">
                          <div class="progress-bar bg-danger progress-bar-striped" role="progressbar" style="width: 65%"></div>
                      </div>

                      <p class="mt-3"><i class="flag-icon flag-icon-gb mr-1"></i> England <span class="float-right">60%</span></p>
                      <div class="progress" style="height: 7px;">
                          <div class="progress-bar bg-success progress-bar-striped" role="progressbar" style="width: 60%"></div>
                        </div>

                      <p class="mt-3"><i class="flag-icon flag-icon-au mr-1"></i> Australia <span class="float-right">55%</span></p>
                      <div class="progress" style="height: 7px;">
                          <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 55%"></div>
                        </div>

                      <p class="mt-3"><i class="flag-icon flag-icon-in mr-1"></i> India <span class="float-right">50%</span></p>
                      <div class="progress" style="height: 7px;">
                          <div class="progress-bar bg-info progress-bar-striped" role="progressbar" style="width: 50%"></div>
                        </div>

                   </div>
                 </div>
              </div>
            </div>
         </div>

         <div class="col-12 col-lg-5 col-xl-4">
            <div class="card">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-primary mb-0">45,85,240</h4>
                <span>Total Likes</span>
              </div>
			  <div class="align-self-center w-circle-icon rounded gradient-violet">
                <i class="icon-like text-white"></i></div>
            </div>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <div class="media align-items-center">
			  <div class="media-body text-left">
                <h4 class="text-danger mb-0">78,50,325</h4>
                <span>Comments</span>
              </div>
               <div class="align-self-center w-circle-icon rounded gradient-ibiza">
                <i class="icon-speech text-white"></i></div>
            </div>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <div class="media align-items-center">
              <div class="media-body text-left">
                <h4 class="text-dark mb-0">25,40,354</h4>
                <span>Total Shares</span>
              </div>
			  <div class="align-self-center w-circle-icon rounded gradient-royal">
                <i class="icon-share text-white"></i></div>
            </div>
            </div>
          </div>

         </div>
      </div>
        <!--End Row-->

      <div class="row">
        <div class="col-12 col-lg-4 col-xl-4">
          <div class="card">
            <div class="card-header">
              Last Week Revenue
            <div class="card-action">
             <div class="dropdown">
             <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
              <i class="icon-options"></i>
             </a>
              <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="javascript:void();">Action</a>
                <a class="dropdown-item" href="javascript:void();">Another action</a>
                <a class="dropdown-item" href="javascript:void();">Something else here</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void();">Separated link</a>
               </div>
              </div>
             </div>
            </div>
            <div class="card-body">
			  <div class="chart-container-2">
                  <canvas id="dashboard-chart-3"></canvas>
			   </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 col-xl-4">
            <div class="card">
              <div class="card-header">
                Orders Summary
              <div class="card-action">
               <div class="dropdown">
               <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
                <i class="icon-options"></i>
               </a>
                <div class="dropdown-menu dropdown-menu-right">
                  <a class="dropdown-item" href="javascript:void();">Action</a>
                  <a class="dropdown-item" href="javascript:void();">Another action</a>
                  <a class="dropdown-item" href="javascript:void();">Something else here</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="javascript:void();">Separated link</a>
                 </div>
                </div>
               </div>
              </div>
              <div class="card-body">
			    <div class="chart-container-2">
                  <canvas id="dashboard-chart-4"></canvas>
				</div>
              </div>
            </div>
        </div>
		<div class="col-12 col-lg-4 col-xl-4">
            <div class="card">
              <div class="card-header">
                Top Selling Categories
              <div class="card-action">
               <div class="dropdown">
               <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
                <i class="icon-options"></i>
               </a>
                <div class="dropdown-menu dropdown-menu-right">
                  <a class="dropdown-item" href="javascript:void();">Action</a>
                  <a class="dropdown-item" href="javascript:void();">Another action</a>
                  <a class="dropdown-item" href="javascript:void();">Something else here</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="javascript:void();">Separated link</a>
                 </div>
                </div>
               </div>
              </div>
              <div class="card-body">
			    <div class="chart-container-2">
                  <canvas id="dashboard-chart-5"></canvas>
				</div>
              </div>
            </div>
        </div>
      </div>
        <!--End Row-->
	  --%>
            <!--End Dashboard Content-->
            <!--start overlay-->
            <div class="overlay toggle-menu"></div>
            <!--end overlay-->
        </div>
        <!-- End container-fluid-->

    </div>
    <!--End content-wrapper-->
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
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
    <%--<script src="../assets/js/index.js"></script>--%>
    <script src="../assets/js/moment.js"></script>
    <script>
        $("body").addClass("hideScrollbar");

        $("#dashboard").addClass("active");

        $("#wrapper").addClass("toggled");

        function pageLoad() {
            var discount = $("#<%= txtDiscountAmount.ClientID %>");
            var lbldiscount = $("#<%= lblDiscount.ClientID %>");
            var total = $("#<%= lblTotalAmount.ClientID %>");
            var amount = $("#<%= lblTotalBill.ClientID %>");
            discount.on("keyup", function () {
                console.log("total : ", total.text() + " discount : " + discount.val());
                lbldiscount.text(discount.val());
                amount.text(total.text() - discount.val());
            });
        }

        /* const $btnPrint = document.querySelector("#btnPrint");*/
        function pt() {
            var gridrows = document.getElementById("ContentPlaceHolder1_grdBill");

            console.log(gridrows);
            var row = gridrows.getElementsByTagName("tr");

            for (var i = 0; i < row.length; i++) {
                //alert("hi")
                row[i].cells[0].style.display = "none";
                row[i].cells[6].style.display = "none";
            }

            var divContents = document.getElementById("ticket").innerHTML;
            var a = window.open('', '', 'height=700, width=600');
            a.document.write('<html><head><style> th{font-size:8px;} #ttl{margin-left:125px;} #info,#mode,#cname,#done,#ContentPlaceHolder1_lblOnOrderNo,#ord{display:none;} span{padding:5px; font-style:bold; font-size:10px;} th{text-transform:uppercase}td{border-left:1px solid black; border-top:0px;border-bottom:0px;  border-right:1px solid black;border-left-style:dashed;border-right-style:dashed; ;font-size:8px; padding:4px;}</style> </head>');
            a.document.write('<body ><div style="float:left; width:7%;"><img style="height:50px; width:80px;" src="../images/logo/7seas2.png" ></img></div> <div style="width:93%;font-size:10px;float:left"><h3 style="color:Maroon;text-align:left; margin-top:4px; margin-left:25px; font-size:11px; padding-top:4px;margin-right:20px;margin-left:55px;">226, D-14,<br> Sec-3, Rohtak. </h3></div><br><br><br><br>');

            a.document.write(divContents);
            a.document.write('<h5 style="text-align:left; margin-left:25px;">THANK FOR VISIT!!!<br><span style="font-size:8px;margin-left:10px;">HAPPY TO SEE YOU AGAIN</span></h5> </body></html>');
            a.document.close();
            a.print();
         //   a.close();
        }

        //function ptt() {
        //    var gridrows = document.getElementById("ContentPlaceHolder1_grdBill");

        //    console.log(gridrows);
        //    var row = gridrows.getElementsByTagName("tr");

        //    for (var i = 0; i < row.length; i++) {
        //        //alert("hi")
        //        row[i].cells[0].style.display = "none";
        //        row[i].cells[6].style.display = "none";
        //    }

        //    var divContents = document.getElementById("ticket").innerHTML;
        //    var a = window.open('', '', 'height=700, width=600');
        //    a.document.write('<html><head><style> th{font-size:8px;} #ttl{margin-left:110px;} #info,#mode,#cname,#done,#ContentPlaceHolder1_lblOnOrderNo,#ord{display:none;} span{padding:5px; font-style:bold; font-size:10px;} th{text-transform:uppercase}td{border-left:1px solid black; border-top:0px;border-bottom:0px;  border-right:1px solid black;border-left-style:dashed;border-right-style:dashed; ;font-size:8px; padding:4px;}</style> </head>');
        //    a.document.write('<body>');

        //    a.document.write(divContents);
        //    a.document.write('<h5 style="text-align:left; margin-left:25px;">THANK FOR VISIT!!!<br><span style="font-size:8px;margin-left:10px;">HAPPY TO SEE YOU AGAIN</span></h5> </body></html>');
        //    //a.document.close();
        //    a.print();
        //    a.close();
        //}

        function ptt() {
            
            var style = '#sslh,#contacth,#dateh,#spanTotalh{display:none;} ';

            var script = '<script> ';
            script = script + 'var gridrows = document.getElementById("ContentPlaceHolder1_grdBill");var row = gridrows.getElementsByTagName("tr");for (var i = 0; i < row.length; i++) {row[i].cells[0].style.display = "none";row[i].cells[6].style.display = "none";}</script' + '>';
            var discount = $("#<%= txtDiscountAmount.ClientID %>");
            var total = $("#<%= lblTotal.ClientID %>");
            var tax = $("#<%= lblTotalTax.ClientID %>");
            var vat = $("#<%= lblTotalVat.ClientID %>");

            var totalAmount = $("#<%= lblTotalAmount.ClientID %>");
            var amount = $("#<%= lblTotalBill.ClientID %>");
            
            if (tax.text() == "" || tax.text() == "0") {
                style = style + '#spanTax{display:none;}';
            }
            if (vat.text() == "" || vat.text() == "0") {
                style = style + '#spanVat{display:none;}';
            }
            if (total.text() == totalAmount.text()) {
                style = style + '#spanTotal{display:none;}';
            }

            if (discount.val() == "" || discount.val() == "0" || totalAmount.text()==amount.text()) {
                style = style + '#spanAmount,#spanDiscount{display:none;}';
            }
           // var script = '<script src="../assets/js/jquery.min.js"></scr' + 'ipt><script src="assets/js/printBill.js"></scr' + 'ipt>';

            var divContents = document.getElementById("ticket").innerHTML;
            var a = window.open('', '', 'height=700, width=600');
            a.document.write('<html><head><style>table{width:227px} .orderNo{float: right;font-size: 16px;color:grey;margin-left: 5px;padding:10px;border: 1px solid grey;border-radius: 50%;} .orderNo span{padding:0;font-size:20px;font-weight:700;} #ContentPlaceHolder1_lblDiscount{display:inline-block;} .bdnone{display:inline-block;margin:-2px 0 0 -6px;} th{font-size:8px;} #spanTax{margin-left:124px;} #spanVat{margin-left:114px;} #spanTotalAmount{margin-left:111px;} #spanTotal{margin-left:152px;} #spanDiscount{margin-left:134px;} #spanAmount{margin-left:131px;} #info,.dimg,#billdate,#mode,#cname,#cphone,#done,#ContentPlaceHolder1_lblOnOrderNo,#ord,#ContentPlaceHolder1_txtDiscountAmount{display:none;} span{padding:5px; font-style:bold; font-size:10px;} th{text-transform:uppercase} td{border-left:1px solid black; border-top:0px;border-bottom:0px;  border-right:1px solid black;border-left-style:dashed;border-right-style:dashed;font-size:8px; padding:4px;}' + style + '</style> </head>');
            a.document.write('<body>');

            a.document.write(divContents);
            a.document.write('<h5 style="text-align:left; margin-left:45px;margin-top:10px">THANK FOR VISIT!!!<br><span style="font-size:8px;margin-left:10px;">HAPPY TO SEE YOU AGAIN</span></h5>' + script + '</body></html>');
                // a.document.close();
           a.print();
           a.close();
        }

    </script>
</asp:Content>
