using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class p_Manage_Cutters_CuttersInfoDetail : System.Web.UI.Page
{
    //传到前端的数据
    public string json_key;
    public string json_value;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            initDatas();
        }
    }


    //控件数据加载
    private void initDatas()
    {
        string userName = Profile.UserName;
        string qs = Request.QueryString.Get("number");
        //c_ListView加载
        c_ListViewLoadDatas(userName, qs);
        //cd_ListView加载
        cd_ListViewLoadDatas(userName, qs);
        //status_ListView加载
        status_ListViewLoadDatas(userName, qs);
        //ElectricTestRecord_Chart加载
        E_ChartLoadDatas(userName, qs);
        //NotesEventsListView加载
        NotesEvents_ListViewLoadDatas(userName, qs);
    }

    #region 数据加载
    private void c_ListViewLoadDatas(string userName, string qs)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                var query = from c in CMS_EF.Cutters
                            join c3i in CMS_EF.Cutter3DImages on c.CuttersDetail.Cutter3DImageID equals c3i.ID
                            join cc in CMS_EF.CutterClass on c.ClassID equals cc.ID
                            join cdc in CMS_EF.CutterDetailClass on c.DetailClassID equals cdc.ID
                            join cm in CMS_EF.CutterMaterial on c.MaterialID equals cm.ID
                            where c.number == qs &&
                            cdc.UserName == userName
                            select new
                            {
                                三维图 = c3i.ImagePath,
                                编号 = c.number,
                                类 = cc.Name,
                                详细类 = cdc.Name,
                                材料 = cm.Name,
                            };
                //DEBUG_PRINT
                System.Diagnostics.Debug.WriteLine(query.ToList()[0]);

                c_ListView.DataSource = query.ToList();
                c_ListView.DataBind();
            }
        }
        catch { }
    }

    private void cd_ListViewLoadDatas(string userName, string qs)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                var query = from cd in CMS_EF.CuttersDetail
                            join c in CMS_EF.Cutters on cd.ID equals c.ID
                            join ci in CMS_EF.CutterImages on cd.ImageID equals ci.ImageID
                            orderby ci.DateTime descending
                            where c.number == qs
                            select new
                            {
                                添加日期 = cd.CreateDate,
                                活跃日期 = cd.LastUseDate,
                                监控图 = ci.ImagePath
                            };
                //DEBUG_PRINT
                System.Diagnostics.Debug.WriteLine(query.ToList()[0]);

                cd_ListView.DataSource = query.ToList();
                cd_ListView.DataBind();
            }
        }
        catch { }
    }

    private void status_ListViewLoadDatas(string userName, string qs)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                var query = from c in CMS_EF.Cutters
                            where c.number == qs
                            select new
                            {
                                开始时间 = c.CuttersDetail.StartTime,
                                结束时间 = c.CuttersDetail.StopTime,
                                磨损程度 = c.CuttersDetail.WearProcess / c.CuttersDetail.ExpectLife,
                                位置 = c.CuttersDetail.Location
                            };
                //DEBUG_PRINT
                System.Diagnostics.Debug.WriteLine(query.ToList()[0]);

                status_ListView.DataSource = query.ToList();
                status_ListView.DataBind();
            }
        }
        catch { }
    }

    //不使用后端chart
    //private void E_ChartLoadDatas(string userName, string qs)
    //{
    //    try
    //    {
    //        using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
    //        {
    //            var query = from c in CMS_EF.Cutters
    //                        join cetr in CMS_EF.CutterElectricTestRecord on c.CuttersDetail.ElectricTestRecordID equals cetr.ElectricTestRecordID
    //                        orderby cetr.DateTime ascending
    //                        where c.number == qs
    //                        select new
    //                        {
    //                            时间 = cetr.DateTime,
    //                            值 = cetr.Value
    //                        };

    //            DataTable dt = new DataTable();
    //            dt.Columns.Add("时间", System.Type.GetType("System.String"));
    //            dt.Columns.Add("电流值", System.Type.GetType("System.Double"));

    //            foreach (var li in query.ToList())
    //            {
    //                DataRow dr = dt.NewRow();
    //                dr["时间"] = li.时间.Value.ToString("M-dd HH:mm");
    //                dr["电流值"] = li.值.Value;
    //                dt.Rows.Add(dr);
    //                //DEBUG_PRINT
    //                System.Diagnostics.Debug.WriteLine("时间:" + li.时间.Value + " " + "值:" + li.值.Value);
    //            }

    //            #region 折线图
    //            //绑定数据
    //            E_Chart.DataSource = dt;
    //            //设置图表类型
    //            E_Chart.Series["Series1"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
    //            //x轴数据成员列
    //            E_Chart.Series[0].XValueMember = "时间";
    //            //y轴数据成员列
    //            E_Chart.Series[0].YValueMembers = "电流值";
    //            //x轴标题
    //            E_Chart.ChartAreas["ChartArea1"].AxisX.Title = "时间";
    //            //x轴标题的名称所在位置
    //            E_Chart.ChartAreas["ChartArea1"].AxisX.TitleAlignment = System.Drawing.StringAlignment.Far;
    //            //y轴标题
    //            E_Chart.ChartAreas["ChartArea1"].AxisY.Title = "电流值";
    //            //y轴标题的名称所在位置
    //            E_Chart.ChartAreas["ChartArea1"].AxisY.TitleAlignment = System.Drawing.StringAlignment.Far;
    //            //x轴数据的间距
    //            E_Chart.ChartAreas["ChartArea1"].AxisX.Interval = 1;
    //            //不显示竖着的分割线
    //            E_Chart.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;
    //            //显示坐标值
    //            E_Chart.Series[0].IsValueShownAsLabel = true;
    //            #endregion
    //        }
    //    }
    //    catch { }
    //}
    private void E_ChartLoadDatas(string userName, string qs)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                var query = from c in CMS_EF.Cutters
                            join cetr in CMS_EF.CutterElectricTestRecord on c.CuttersDetail.ElectricTestRecordID equals cetr.ElectricTestRecordID
                            orderby cetr.DateTime ascending
                            where c.number == qs
                            select new
                            {
                                时间 = cetr.DateTime,
                                值 = cetr.Value
                            };

                List<string> lineData_key = new List<string>();
                List<double> lineData_value = new List<double>();

                foreach (var li in query.ToList())
                {
                    //li.时间.Value.ToString("M-dd HH:mm");
                    lineData_key.Add(li.时间.Value.ToString("M-dd HH:mm"));
                    lineData_value.Add(li.值.Value);
                    //DEBUG_PRINT
                    for(int i=0;i<lineData_key.Count;i++)
                    {
                        System.Diagnostics.Debug.WriteLine("key:"+lineData_key[i]);
                        System.Diagnostics.Debug.WriteLine("value:" + lineData_value[i]);
                    }
                }

                json_key = new JavaScriptSerializer().Serialize(lineData_key);
                json_value = new JavaScriptSerializer().Serialize(lineData_value);

                //DEBUG_PRINT
                System.Diagnostics.Debug.WriteLine("json_key:" + json_key);
                System.Diagnostics.Debug.WriteLine("json_value:" + json_value);
            }
        }
        catch { }
    }

    private void NotesEvents_ListViewLoadDatas(string userName, string qs)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                var query = from c in CMS_EF.Cutters
                            where c.number == qs
                            select new
                            {
                                备注 = c.CuttersDetail.CutterNotes.Note,
                                事件 = c.CuttersDetail.CutterEvents.Event
                            };
                //DEBUG_PRINT
                System.Diagnostics.Debug.WriteLine(query.ToList()[0]);

                NotesEventsListView.DataSource = query.ToList();
                NotesEventsListView.DataBind();
            }
        }
        catch { }
    }
    #endregion

    #region 数据更新
    //数据更新
    protected void c_ListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        ListViewItem lvi = c_ListView.Items[this.c_ListView.EditIndex];
        DropDownList ddl = (DropDownList)lvi.FindControl("ImagePathDropDownList");
        e.NewValues["ImagePath"] = ddl.SelectedValue;
    }
    #endregion
}
