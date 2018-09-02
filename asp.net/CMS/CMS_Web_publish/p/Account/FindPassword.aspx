<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/Default.master" AutoEventWireup="true" CodeFile="FindPassword.aspx.cs" Inherits="p_System_FindPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="container">

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <asp:PasswordRecovery ID="PasswordRecovery1" CssClass="myform" runat="server" QuestionFailureText="未能验证您的答案请重试" QuestionInstructionText="要接收您的密码，请回答下列问题" GeneralFailureText="您恢复密码的尝试失败，请重试" AnswerRequiredErrorMessage="需要答案" SuccessText="您的密码已发送给您" UserNameRequiredErrorMessage="必须填写“用户名”" UserNameInstructionText="要接收您的密码，请输入您的用户名" UserNameFailureText="无法访问您的信息，请重试">
                    <UserNameTemplate>
                        <div class="card">
                            <div class="card-action">
                                <h1 class="page-header text-center">忘记密码</h1>
                            </div>
                            <div class="card-content form-horizontal">
                                <div class="row text-center">
                                    <p>输入您的用户名，用以接收您的密码</p>
                                </div>

                                <div class="row">
                                    <div class="form-group">
                                        <asp:Label ID="UserNameLabel" CssClass="control-label col-sm-2 text-right" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-1 text-danger text-danger">
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="row text-center">
                                    <div class="text-danger">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </div>
                                </div>

                                <div class="row text-center" style="padding: 15px">
                                    <asp:Button ID="SubmitButton" CssClass="btn btn-primary" runat="server" CommandName="Submit" Text="提交" ValidationGroup="PasswordRecovery1" />
                                </div>

                            </div>
                        </div>
                    </UserNameTemplate>
                </asp:PasswordRecovery>
            </div>

        </div>


    </div>

</asp:Content>

