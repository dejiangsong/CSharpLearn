<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagers/Manage_Cutters.master" AutoEventWireup="true" CodeFile="AddCutter.aspx.cs" Inherits="p_Manage_Cutters_AddCutter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(function ($) {
            $('#UsersGroup_Add_Button').click(function () {
                $('#UsersGroup_Result_ListBox option:selected').appendTo('#UsersGroup_Group_ListBox');
            });
            $('#UsersGroup_Remove_Button').click(function () {
                $('#UsersGroup_Group_ListBox option:selected').appendTo('#UsersGroup_Result_ListBox');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">

                <div class="wizard-container">
                    <div class="wcard wizard-card" data-color="azure" id="wizard">
                        <!-- "green","blue","azure","orange","red" -->

                        <div class="wizard-header">
                            <h3 class="wizard-titile">添加刀具</h3>
                            <p class="category">填写刀具相关的数据信息</p>
                        </div>

                        <div class="wizard-navigation">
                            <div class="progress-with-circle">
                                <div class="progress-bar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="4" style="width: 15%;">
                                </div>
                            </div>
                            <ul>
                                <li>
                                    <a href="#info" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="ti-book"></i>
                                        </div>
                                        基本信息
                                    </a>
                                </li>
                                <li>
                                    <a href="#image" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="ti-camera"></i>
                                        </div>
                                        刀具图
                                    </a>
                                </li>
                                <li>
                                    <a href="#possess" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="ti-user"></i>
                                        </div>
                                        拥有者
                                    </a>
                                </li>
                                <li>
                                    <a href="#description" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="ti-marker"></i>
                                        </div>
                                        描述
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="tab-content">
                            <div id="info" class="tab-pane">
                                <h5 class="info-text">在这里填写必要的信息
                                </h5>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="form-group">
                                            <label>编号:</label>
                                            <asp:TextBox ID="number_TextBox" CssClass="form-control" placeholder="编号" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5 col-md-offset-1">
                                        <div class="form-group">
                                            <label>类:</label>
                                            <asp:DropDownList ID="CutterClass_DropDownList" CssClass="form-control" runat="server" DataSourceID="EntityDataSource_CutterClass" DataTextField="Name" DataValueField="ID" AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>详细类:</label>
                                            <div class="row">
                                                <div class="col-xs-10">
                                                    <asp:DropDownList ID="CutterDetailClass_DropDownList" CssClass="form-control" runat="server" DataSourceID="EntityDataSource_CutterDetailClass" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                </div>
                                                <div class="col-xs-2">
                                                    <!-- 根据权限提供添加功能 -->
                                                    <div>
                                                        <asp:LoginView runat="server">
                                                            <RoleGroups>
                                                                <asp:RoleGroup Roles="administer">
                                                                    <ContentTemplate>
                                                                        <a class="btn btn-default" data-toggle="collapse" href="#cutterDetailClassEx" aria-expanded="false">+</a>
                                                                    </ContentTemplate>
                                                                </asp:RoleGroup>
                                                            </RoleGroups>
                                                        </asp:LoginView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 隐藏的添加功能 -->
                                <div class="row">
                                    <div id="cutterDetailClassEx" class="col-xs-10 col-xs-offset-1 collapse">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="panel panel-default">
                                                    <div class="panel-body">
                                                        <div class="col-xs-5">
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="CutterDetailClass_TextBox" CssClass="form-control" placeholder="新添加一个详细的类" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row text-center">
                                                                <asp:Button ID="AddNewDetailClass_Button" CssClass="btn btn-info" runat="server" Text="新增类别" OnClick="AddNewDetailClass_Button_Click" />
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-5 col-xs-offset-2">
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="ChangeDetailClass_TextBox" CssClass="form-control" placeholder="修改前一个输入中指定的类名" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xs-6 text-center">
                                                                    <asp:Button ID="ChangeDetailClass_Button" CssClass="btn btn-info btn-sm" runat="server" Text="更改" OnClick="ChangeDetailClass_Button_Click" />
                                                                </div>
                                                                <div class="col-xs-6 text-center">
                                                                    <asp:Button ID="DeleteDetailClass_Button" runat="server" CssClass="btn btn-warning btn-sm" Text="删除" OnClick="DeleteDetailClass_Button_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5 col-md-offset-1">
                                        <div class="form-group">
                                            <label>材料:</label>
                                            <asp:DropDownList ID="Material_DropDownList" CssClass="form-control" runat="server" DataSourceID="EntityDataSource_CutterMaterial" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div id="image" class="tab-pane">
                                <h5 class="info-text">添加模型图和实物图
                                </h5>
                                <div class="row">
                                    <div class="col-md-5 col-md-offset-1 panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="file-picture">
                                                        <asp:Image ID="Cutter3DImages_Image" CssClass="img-responsive" ImageUrl="~/App_Themes/Default/img/fileUpload_model.png" runat="server" ClientIDMode="Static" />
                                                        <asp:FileUpload ID="Cutter3DImages_FileUpload" CssClass="form-control" runat="server" ClientIDMode="Static" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="caption">
                                                    <div class="row">
                                                        <h3>模型图</h3>
                                                        <asp:DropDownList ID="Cutter3DImages_DropDownList" CssClass="form-control" runat="server" DataSourceID="EntityDataSource_Cutter3DImages" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <label>名称:</label>
                                                            <asp:TextBox ID="Cutter3DImagesName_TextBox" CssClass="form-control" placeholder="上传的模型名称" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-5 panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="file-picture">
                                                        <asp:Image ID="Image_Image" CssClass="img-responsive" ImageUrl="~/App_Themes/Default/img/fileUpload_real.png" runat="server" ClientIDMode="Static" />
                                                        <asp:FileUpload ID="Image_Fileupload" CssClass="form-control" runat="server" ClientIDMode="Static" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="caption">
                                                    <div class="row">
                                                        <h3>实物图</h3>
                                                        <p>可以选择一张实物图</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <div id="possess" class="tab-pane">
                                <h5 class="info-text">给刀具分配可拥有的用户
                                </h5>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="form-group">
                                                    <label>用户名:</label>
                                                    <div class="row">
                                                        <div class="col-xs-10">
                                                            <asp:TextBox ID="UsersGroup_Input_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <asp:Button ID="UsersGroup_Search_Button" CssClass="btn btn-primary" runat="server" Text="查找" OnClick="UsersGroup_Search_Button_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-1">
                                                <asp:ListBox ID="UsersGroup_Result_ListBox" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:ListBox>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="row text-center">
                                                    <asp:Button ID="UsersGroup_Add_Button" CssClass="btn btn-default" runat="server" Text=">>" OnClick="UsersGroup_Add_Button_Click" />
                                                </div>
                                                <div class="row text-center">
                                                    <asp:Button ID="UsersGroup_Delete_Button" CssClass="btn btn-default" runat="server" Text="<<" OnClick="UsersGroup_Delete_Button_Click" />
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:ListBox ID="UsersGroup_Group_ListBox" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:ListBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>




                            <div id="description" class="tab-pane">
                                <h5 class="info-text">可以填写一些相关描述
                                </h5>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="form-group">
                                            <label>备注:</label>
                                            <div class="row">
                                                <asp:TextBox ID="Note_TextBox" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="wizard-footer">
                            <div class="pull-right">
                                <input type="button" value="下一页" class="btn btn-next btn-success" name="next" />
                                <asp:Button ID="OK_Button" CssClass="btn btn-finish btn-success" runat="server" Text="完成" OnClick="OK_Button_Click" />
                            </div>
                            <div class="pull-left">
                                <input type="button" value="前一页" class="btn btn-previous btn-default" name="previous" />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <asp:EntityDataSource ID="EntityDataSource_CutterClass" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="CutterClass" EntityTypeFilter="CutterClass">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="EntityDataSource_CutterDetailClass" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="CutterDetailClass" EntityTypeFilter="CutterDetailClass" Where="it.ClassID == @ClassID &amp;&amp; it.UserName == @UserName" Select="">
        <WhereParameters>
            <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
            <asp:ControlParameter ControlID="CutterClass_DropDownList" DbType="Int32" Name="ClassID" PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="EntityDataSource_CutterMaterial" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="CutterMaterial" EntityTypeFilter="CutterMaterial">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="EntityDataSource_Cutter3DImages" runat="server" ConnectionString="name=CMSDB_Entities" DefaultContainerName="CMSDB_Entities" EnableFlattening="False" EntitySetName="Cutter3DImages" Select="it.[ID], it.[Name]" Where="it.ClassID == @ClassID &amp;&amp; (it.UserName == @UserName || it.UserName == &quot;&quot;)">
        <WhereParameters>
            <asp:ControlParameter ControlID="CutterClass_DropDownList" Name="ClassID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <script>
        $("body").css("background-image", "url(/App_Themes/Default/img/bg.jpg)");
    </script>
    <script src="/App_Themes/Default/myJS.js"></script>

</asp:Content>

