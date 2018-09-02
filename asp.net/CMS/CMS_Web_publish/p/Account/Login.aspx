<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/Default.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="p_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="card">
                    <div class="card-action">
                        <h1 class="page-header text-center">登录</h1>
                    </div>
                    <div class="card-content">
                        <asp:Login ID="Login1" CssClass="myform" runat="server" CreateUserText="注册" CreateUserUrl="~/p/Account/Register.aspx" FailureText="登录失败，请重试">
                            <LayoutTemplate>

                                <div class="form-horizontal">
                                    <div class="row">
                                        <div class="form-group" id="user">
                                            <asp:Label ID="UserNameLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="UserName" CssClass="form-control" placeholder="UserName" runat="server"></asp:TextBox>
                                                <p class='help-block'></p>
                                                <span></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group" id="password">
                                            <asp:Label ID="PasswordLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="Password">密码:</asp:Label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="Password" CssClass="form-control" placeholder="PassWord" runat="server" TextMode="Password"></asp:TextBox>
                                                <p class='help-block'></p>
                                                <span></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="text-center">
                                                <asp:CheckBox ID="RememberMe" CssClass="text-muted" runat="server" Text="下次记住我" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-sm-6 col-sm-offset-3 text-center">
                                                <asp:Button ID="LoginButton" CssClass="btn btn-login btn-success" runat="server" CommandName="Login" Text="登录" ValidationGroup="Login1" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <p class="text-danger">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-6 text-left">
                                                <asp:HyperLink ID="FindPassword_HyperLink" CssClass="text-warning" runat="server" NavigateUrl="~/p/Account/FindPassword.aspx">找回密码</asp:HyperLink>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                                <asp:HyperLink ID="CreateUserLink" CssClass="text-success" runat="server" NavigateUrl="~/p/Account/Register.aspx">注册</asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </LayoutTemplate>
                        </asp:Login>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/App_Themes/Default/myJS.js"></script>
</asp:Content>

