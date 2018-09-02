<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/User.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="p_User_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="card-action">
        <h2 class="page-header">修改密码<small>/ChangePassword</small></h2>
    </div>
    <div class="card-content">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <asp:ChangePassword ID="ChangePassword1" CssClass="myform" runat="server">
                    <ChangePasswordTemplate>
                        <div class="form-horizontal">
                            <div class="row">
                                <div class="form-group">
                                    <asp:Label ID="CurrentPasswordLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="CurrentPassword">密码:</asp:Label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="CurrentPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="必须填写“密码”" ToolTip="必须填写“密码”" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <asp:Label ID="NewPasswordLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="NewPassword">新密码:</asp:Label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="NewPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="必须填写“新密码”" ToolTip="必须填写“新密码”" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <asp:Label ID="ConfirmNewPasswordLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="ConfirmNewPassword">确认新密码:</asp:Label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="ConfirmNewPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="必须填写“确认新密码”" ToolTip="必须填写“确认新密码”" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="“确认新密码”与“新密码”项必须匹配" ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </div>
                            </div>

                            <div class="row">
                                <div class="row">
                                    <div class="col-sm-11">
                                        <asp:Button ID="CancelPushButton" CssClass="btn btn-default pull-right my-margin-left" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                        <asp:Button ID="ChangePasswordPushButton" CssClass="btn btn-success pull-right" runat="server" CommandName="ChangePassword" Text="更改密码" ValidationGroup="ChangePassword1" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ChangePasswordTemplate>
                </asp:ChangePassword>
            </div>
        </div>
    </div>

</asp:Content>

