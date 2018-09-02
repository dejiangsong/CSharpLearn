<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/Default.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="p_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="container">

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="card">
                    <div class="card-action text-center">
                        <h1 class="page-header">注册</h1>
                    </div>
                    <div class="card-content">
                        <asp:CreateUserWizard ID="CreateUserWizard1" CssClass="myform" runat="server">
                            <WizardSteps>
                                <asp:CreateUserWizardStep runat="server">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="form-group" id="user">
                                                    <asp:Label ID="UserNameLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="UserName" CssClass="form-control" placeholder="UserName" runat="server"></asp:TextBox>
                                                        <p class='help-block'></p>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="必须填写“用户名”" ToolTip="必须填写“用户名”" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group" id="password">
                                                    <asp:Label ID="PasswordLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="Password">密码:</asp:Label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="Password" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        <p class='help-block'></p>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="必须填写“密码”" ToolTip="必须填写“密码”" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group" id="confirm">
                                                    <asp:Label ID="ConfirmPasswordLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="ConfirmPassword">确认密码:</asp:Label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="ConfirmPassword" CssClass="form-control" placeholder="Confirm" runat="server" TextMode="Password"></asp:TextBox>
                                                        <p class='help-block'></p>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="必须填写“确认密码”" ToolTip="必须填写“确认密码”" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group" id="email">
                                                    <asp:Label ID="EmailLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="Email" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
                                                        <p class='help-block'></p>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="必须填写“电子邮件”" ToolTip="必须填写“电子邮件”" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- 安全问题 --%>
                                            <%--<div class="row">
                                        <div class="form-group" id="question">
                                            <asp:Label ID="QuestionLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="Question">安全问题:</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="Question" CssClass="form-control" placeholder="Question" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="必须填写“安全提示问题”" ToolTip="必须填写“安全提示问题”" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                <span></span>
                                                <p class='help-block'></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group" id="answer">
                                            <asp:Label ID="AnswerLabel" CssClass="col-sm-3 control-label text-right" runat="server" AssociatedControlID="Answer">安全答案:</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="Answer" CssClass="form-control" placeholder="Answer" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="必须填写“安全答案”" ToolTip="必须填写“安全答案”" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                <span></span>
                                                <p class='help-block'></p>
                                            </div>
                                        </div>
                                    </div>--%>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-11 col-sm-offset-1">
                                                        <p class="text-danger">
                                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <CustomNavigationTemplate>
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-6 col-sm-offset-4 text-center">
                                                    <asp:Button ID="StepNextButton" CssClass="btn btn-login btn-success" runat="server" CommandName="MoveNext" Text="创建" ValidationGroup="CreateUserWizard1" />
                                                </div>
                                            </div>
                                        </div>
                                    </CustomNavigationTemplate>
                                </asp:CreateUserWizardStep>






                                <asp:CompleteWizardStep runat="server">
                                    <ContentTemplate>
                                        <div class="jumbotron">
                                            <h1>完成</h1>
                                            <p>已成功创建新的账号</p>
                                            <p>
                                                <asp:Button ID="ContinueButton" CssClass="btn btn-login btn-primary btn-lg" runat="server" CausesValidation="False" CommandName="Continue" Text="继续" ValidationGroup="CreateUserWizard1" />
                                            </p>
                                        </div>
                                    </ContentTemplate>
                                </asp:CompleteWizardStep>
                            </WizardSteps>
                        </asp:CreateUserWizard>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
