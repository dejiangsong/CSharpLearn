<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/User.master" AutoEventWireup="true" CodeFile="PersonalInfo.aspx.cs" Inherits="p_User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="card-action">
        <h2 class="page-header">个人信息<small>/PersonalInfo</small></h2>
    </div>
    <div class="card-content">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">

                <asp:ListView ID="ListView1" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="用户名,权限,活跃">
                    <EmptyDataTemplate>
                        未加载数据
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <p class="col-sm-3 control-label">用户名：</p>
                                <div class="col-sm-9">
                                    <p class="form-control-static"><asp:Label ID="用户名Label" runat="server" Text='<%# Eval("用户名") %>' /></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <p class="col-sm-3 control-label">权限：</p>
                                <div class="col-sm-9">
                                    <p class="form-control-static"><asp:Label ID="权限Label" runat="server" Text='<%# Eval("权限") %>' /></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <p class="col-sm-3 control-label">邮箱：</p>
                                <div class="col-sm-9">
                                    <p class="form-control-static"><asp:Label ID="邮箱Label" runat="server" Text='<%# Eval("邮箱") %>' /></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <p class="col-sm-3 control-label">活跃日期：</p>
                                <div class="col-sm-9">
                                    <p class="form-control-static"><asp:Label ID="活跃Label" CssClass="form-control-static" runat="server" Text='<%# Eval("活跃") %>' /></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="PersonalInfo" Where="it.[用户名] = @UserName">
        <WhereParameters>
            <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
