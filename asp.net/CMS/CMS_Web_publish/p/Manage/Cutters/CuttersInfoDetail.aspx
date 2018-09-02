<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/Manage_Cutters.master" AutoEventWireup="true" CodeFile="CuttersInfoDetail.aspx.cs" Inherits="p_Manage_Cutters_CuttersInfoDetail" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="card">
        <div class="card-action">
            <h1 class="page-header">详细</h1>
        </div>
        <div class="card-content">

            <div class="row">
                <div class="col-md-6">
                    <asp:ListView ID="c_ListView" runat="server" OnItemUpdating="c_ListView_ItemUpdating">
                        <EditItemTemplate>
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                            </td>
                            <td>
                                <asp:DropDownList ID="ImagePathDropDownList" runat="server" DataSourceID="Cutter3DImages_EntityDataSource" DataTextField="Name" DataValueField="ImagePath" />
                            </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>未返回数据。</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="col-xs-8">
                                <asp:Image ID="ImagePath3DImage" CssClass="img-responsive img-thumbnail" runat="server" ImageUrl='<%# Eval("三维图") %>' />
                            </div>
                            <div class="col-xs-4">
                                <div class="row">
                                    <p>
                                        <b>编号：</b>
                                        <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("编号") %>' />
                                    </p>
                                </div>
                                <div class="row">
                                    <p>
                                        <b>类：</b>
                                        <asp:Label ID="CutterClassLabel" runat="server" Text='<%# Eval("类") %>' />
                                    </p>
                                </div>
                                <div class="row">
                                    <p>
                                        <b>详细类：</b>
                                        <asp:Label ID="CutterDetailClassLabel" runat="server" Text='<%# Eval("详细类") %>' />
                                    </p>
                                </div>
                                <div class="row">
                                    <p>
                                        <b>材料：</b>
                                        <asp:Label ID="CutterMaterialLabel" runat="server" Text='<%# Eval("材料") %>' />
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-md-6">
                    <asp:ListView ID="cd_ListView" runat="server">
                        <EditItemTemplate>
                            <td>
                                <asp:Button ID="Button1" runat="server" CommandName="Update" Text="更新" />
                                <asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="取消" />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Cutter3DImages_EntityDataSource" DataTextField="Name" DataValueField="ImagePath" />
                            </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>未返回数据。</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>

                            <div class="col-xs-8">
                                <asp:Image ID="ImagePathImage" CssClass="img-responsive img-thumbnail" runat="server" ImageUrl='<%# Eval("监控图") %>' />
                            </div>
                            <div class="col-xs-4">
                                <div class="row">
                                    <p>
                                        <b>添加日期：</b>
                                        <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("添加日期") %>' />
                                    </p>
                                </div>

                                <div class="row">
                                    <p>
                                        <b>活跃日期：</b>
                                        <asp:Label ID="LastUseDateLabel" runat="server" Text='<%# Eval("活跃日期") %>' />
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <asp:ListView ID="status_ListView" runat="server">
                        <EditItemTemplate>
                            <td>
                                <asp:Button ID="Button3" runat="server" CommandName="Update" Text="更新" />
                                <asp:Button ID="Button4" runat="server" CommandName="Cancel" Text="取消" />
                            </td>
                            <td>
                                <asp:DropDownList ID="ImagePath3D_DropDownList" runat="server" DataSourceID="Cutter3DImages_EntityDataSource" DataTextField="Name" DataValueField="ImagePath" />
                            </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>未返回数据。</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="col-xs-4">
                                <div class="row">
                                    <p>
                                        <b>开始加工时间：</b>
                                        <asp:Label ID="StartTimeLabel" runat="server" Text='<%# Eval("开始时间") %>' />
                                    </p>
                                </div>

                                <div class="row">
                                    <p>
                                        <b>结束加工时间：</b>
                                        <asp:Label ID="StopTimeLabel" runat="server" Text='<%# Eval("结束时间") %>' />
                                    </p>
                                </div>

                                <div class="row">
                                    <p>
                                        <b>磨损程度：</b>
                                        <div id="wearProgress">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-striped active" style="width: 0%">
                                                    <asp:Label ID="WearImage" runat="server" Text='<%# Eval("磨损程度") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </p>
                                </div>

                                <div class="row">
                                    <p>
                                        <b>位置：</b>
                                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("位置") %>' />
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <span><b>加工检测</b></span>
                            </div>
                        </div>
                        <div class="panel-body">
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <asp:ListView ID="NotesEventsListView" runat="server">
                    <EditItemTemplate>
                        <td>
                            <asp:Button ID="Button3" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="Button4" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ImagePath3D_DropDownList" runat="server" DataSourceID="Cutter3DImages_EntityDataSource" DataTextField="Name" DataValueField="ImagePath" />
                        </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>未返回数据。</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="panel-title">
                                        <span><b>备注</b></span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("备注") %>' />
                                </div>
                        </div>
                        </div>

                        <div class="col-md-6">
                            <div class="panel panel-danger">
                                <div class="panel-heading">
                                    <div class="panel-title">
                                        <span><b>故障</b></span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <asp:Label ID="EventsLabel" runat="server" Text='<%# Eval("事件") %>' />
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>
    </div>

    <asp:EntityDataSource ID="Cutter3DImages_EntityDataSource" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="Cutter3DImages" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>

    <script src="/App_Themes/Default/bs/js/Chart.min.js"></script>
    <script src="/App_Themes/Default/myJS.js"></script>
    <script>
        /* lineChart start */
        var json_key = '<%=json_key %>';
        var json_value = '<%=json_value %>';

        if (json_key != "" && json_value != "") {
            json_key = json_key.replace("[", "");
            json_key = json_key.replace("]", "");
            json_key = json_key.replace(/\"/g, "");
            var lineKeyArray = json_key.split(',');
            var lineValueArray = json_value.match(/\[(\S*)\]/)[1].split(',');

            var randomScalingFactor = function () { return Math.round(Math.random() * 100) };
            var lineChartData = {
                labels: lineKeyArray,
                datasets: [
                {
                    label: "当前变化量",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: lineValueArray
                },
                {
                    label: "参考变化量",
                    fillColor: "rgba(220,220,220,0.2)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: lineValueArray
                }
                ],
            }
        }

        window.onload = function () {
            if (json_key != "" && json_value != "") {
                var ctx_line = document.getElementById("lineChart").getContext("2d");

                window.myLine = new Chart(ctx_line).Line(lineChartData, {
                    responsive: true
                });
            }
        }
        /* lineChart end */
    </script>
</asp:Content>
