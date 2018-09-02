<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/User_RoleManage.master" AutoEventWireup="true" CodeFile="RoleManage.aspx.cs" Inherits="p_User_Administer_RoleManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">



    <div class="card-content">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="form-horizontal">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="col-xs-9">
                                    <asp:TextBox ID="RoleName_TextBox" CssClass="form-control" placeHolder="输入要添加的角色名" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-xs-3">
                                    <asp:Button ID="AddRole_Button" CssClass="btn btn-primary" runat="server" Text="添加角色" OnClick="AddRole_Button_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="col-xs-9">
                                    <asp:ListBox ID="Roles_ListBox" CssClass="form-control" runat="server"></asp:ListBox>
                                </div>
                                <div class="col-xs-3">
                                    <asp:Button ID="DeleteRole_Button" CssClass="btn btn-danger" runat="server" Text="删除角色" OnClick="DeleteRole_Button_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

