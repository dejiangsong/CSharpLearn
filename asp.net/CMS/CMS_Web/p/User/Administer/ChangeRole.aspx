<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/User_RoleManage.master" AutoEventWireup="true" CodeFile="ChangeRole.aspx.cs" Inherits="p_User_Administer_ChangeRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">



    <div class="card-content">
        <div class="row">
            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                <button class="close" data-dismiss="alert"><span>×</span></button>
                <strong>权限变更</strong>
                <p>
                    将角色组中的用户，变更角色
                </p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="row">
                    <div class="col-sm-5">
                        <div class="row">
                            <asp:DropDownList ID="Roles_DropDownList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Roles_DropDownList_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="row">
                            <asp:ListBox ID="UserInThisRole_ListBox" CssClass="form-control" runat="server"></asp:ListBox>
                        </div>
                    </div>
                    <div class="col-sm-2 text-center">
                        <asp:Button ID="OK_Button" CssClass="btn btn-primary" runat="server" Text="更改" OnClick="OK_Button_Click" />
                    </div>
                    <div class="col-sm-5">
                        <asp:DropDownList ID="ChangeRole_DropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

