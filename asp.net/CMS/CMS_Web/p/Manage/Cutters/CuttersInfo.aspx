<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/Manage_Cutters.master" AutoEventWireup="true" CodeFile="CuttersInfo.aspx.cs" Inherits="p_Manage_Cutters_CuttersInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="card">
        <div class="card-action">
            <h1 class="page-header">刀具库</h1>
        </div>
        <div class="card-content table-responsive">
            <div class=" panel-info">
                <asp:GridView ID="GridView1" CssClass="table table-striped table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:HyperLinkField DataTextField="编号" HeaderText="编号" DataNavigateUrlFields="编号" DataNavigateUrlFormatString="~/p/Manage/Cutters/CuttersInfoDetail.aspx?number={0}" SortExpression="编号" />
                        <asp:BoundField DataField="类别" HeaderText="类别" SortExpression="类别" ReadOnly="True" />
                        <asp:BoundField DataField="详细类别" HeaderText="详细类别" SortExpression="详细类别" ReadOnly="True" />
                        <asp:BoundField DataField="材料" HeaderText="材料" SortExpression="材料" ReadOnly="True" />
                        <asp:BoundField DataField="添加日期" HeaderText="添加日期" SortExpression="添加日期" ReadOnly="True" />
                        <asp:BoundField DataField="活跃日期" HeaderText="活跃日期" SortExpression="活跃日期" ReadOnly="True" />
                        <asp:BoundField DataField="预期寿命" HeaderText="预期寿命" SortExpression="预期寿命" ReadOnly="True" />
                        <asp:BoundField DataField="磨损进度" HeaderText="磨损进度" SortExpression="磨损进度" ReadOnly="True" />
                    </Columns>
                    <HeaderStyle CssClass="info table-header" />
                </asp:GridView>

            </div>
        </div>
    </div>


    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="CuttersInfo" EntityTypeFilter="CuttersInfo" Select="it.[编号], it.[类别], it.[详细类别], it.[材料], it.[添加日期], it.[活跃日期], it.[预期寿命], it.[磨损进度]" OrderBy="it.[添加日期]"></asp:EntityDataSource>
</asp:Content>
