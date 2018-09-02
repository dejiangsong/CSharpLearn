<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/User_RoleManage.master" AutoEventWireup="true" CodeFile="AddRole.aspx.cs" Inherits="p_User_Administer_AddRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="card-content">
        <div class="row">
            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                <button class="close" data-dismiss="alert"><span>×</span></button>
                <strong>为用户分配权限</strong>
                <p>
                    先搜索用户，再从搜索结果中选择后，在下拉列表中选择要添加指定的权限
                </p>
            </div>
        </div>


        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="form-horizontal">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="col-xs-9">
                                    <asp:TextBox ID="Search_TextBox" CssClass="form-control" placeHolder="输入要搜寻的名字" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-xs-3">
                                    <asp:Button ID="Search_Button" CssClass="btn btn-primary" runat="server" Text="查询" OnClick="Search_Button_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:ListBox ID="SearchResult_ListBox" CssClass="form-control" runat="server"></asp:ListBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:DropDownList ID="Roles_DropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="row">
                            <div class="col-sm-12">
                                <asp:Button ID="AddUserToRole_Button" CssClass="btn btn-success pull-right" runat="server" Text="添加" OnClick="AddUserToRole_Button_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

