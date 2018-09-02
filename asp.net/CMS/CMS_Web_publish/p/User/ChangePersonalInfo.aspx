<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/User.master" AutoEventWireup="true" CodeFile="ChangePersonalInfo.aspx.cs" Inherits="p_User_ChangePersonalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="card-action">
        <h2 class="page-header">修改信息<small>/ChangePersonalInfo</small></h2>
    </div>
    <div class="card-content">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">

                <asp:ListView ID="ListView1" runat="server" DataKeyNames="用户名,权限,活跃" DataSourceID="EntityDataSource1" Style="margin-bottom: 0px">
                    <EditItemTemplate>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <p class="col-sm-3 control-label">邮箱：</p>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="邮箱TextBox" CssClass="form-control" runat="server" Text='<%# Bind("邮箱") %>' />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Button ID="CancelButton" CssClass="btn btn-default pull-right my-margin-left" runat="server" CommandName="Cancel" Text="取消" />
                                    <asp:Button ID="UpdateButton" CssClass="btn btn-success pull-right" runat="server" CommandName="Update" Text="保存" />
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>未返回数据</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <p class="col-sm-3 control-label">邮箱：</p>
                                <div class="col-sm-9">
                                    <asp:Label ID="邮箱Label" CssClass="form-control" runat="server" Text='<%# Eval("邮箱") %>' />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Button ID="EditButton" CssClass="btn btn-default pull-right" runat="server" CommandName="Edit" Text="编辑" />
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>


    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EnableUpdate="True" EntitySetName="PersonalInfo" EntityTypeFilter="" Select="" Where="it.[用户名]=@UserName">
        <WhereParameters>
            <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>

