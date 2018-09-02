<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/State_Cutters.master" AutoEventWireup="true" CodeFile="Trouble.aspx.cs" Inherits="p_State_Cutters_Trouble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <asp:ListView ID="Cutters_ListView" runat="server">
        <ItemTemplate>
            <div class="container">
                <div class="card">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="card-image">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("实图") %>' />
                            </div>
                        </div>

                        <div class="col-sm-9">
                            <div class="card-content">
                                <div class="row">



                                    <div class="col-sm-6">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">编号：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <asp:HyperLink ID="NumberDynamicHyperLink" CssClass="text-left" runat="server" NavigateUrl='<%# "~/p/Manage/Cutters/CuttersInfoDetail.aspx?number=" + Eval("编号") %>' Text='<%# Eval("编号") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">类别：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <asp:Label ID="CutterClassLabel" runat="server" Text='<%# Eval("类别") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">详细类别：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <asp:Label ID="CutterDetailClassLabel" runat="server" Text='<%# Eval("详细") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">材料：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <asp:Label ID="CutterMaterialLabel" runat="server" Text='<%# Eval("材料") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">位置：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("位置") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="col-sm-3">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">状态：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <asp:Label ID="WorkStatusLabel" runat="server" Text='<%# Eval("状态") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <p class="col-sm-4 control-label my-padding-right-0">磨损程度：</p>
                                                    <div class="col-sm-8">
                                                        <p class="form-control-static">
                                                            <%-- TODO --%>
                                                            <%--<div id="wearProgress">
                                                                <div class="progress">
                                                                    <div class="progress-bar progress-bar-striped active" style="width: 0%">
                                                                        <asp:Label ID="WearProcessLabel" runat="server" Text='<%# Eval("磨损") %>' />
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                            <asp:Label ID="WearProcessLabel" runat="server" Text='<%# Eval("磨损") %>' />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="row">
                            <div class="col-sm-12" style="font-size: x-large">
                                <a data-toggle="collapse" href="#eventCollapse">
                                    <div class="card-image text-center">
                                        <span class="glyphicon glyphicon-chevron-down"></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div id="eventCollapse" class="row collapse">
                            <div class="col-sm-12">
                                <div class="card-content text-danger">
                                    <asp:Label ID="EventLabel" runat="server" Text='<%# Eval("故障日志") %>' />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <div class="container">
                <div class="card">
                    <div class="card-content">
                        <p class="text-danger">无数据</p>
                    </div>
                </div>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>

</asp:Content>

