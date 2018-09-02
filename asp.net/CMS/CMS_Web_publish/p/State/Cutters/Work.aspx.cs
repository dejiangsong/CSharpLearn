using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class p_State_Cutters_Work : System.Web.UI.Page
{
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
        //Cutters_ListView加载
        Cutters_ListViewLoadDatas(userName);
    }

    private void Cutters_ListViewLoadDatas(string userName)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                var query = from c in CMS_EF.Cutters
                            join ci in CMS_EF.CutterImages on c.CuttersDetail.ImageID equals ci.ImageID
                            join cc in CMS_EF.CutterClass on c.ClassID equals cc.ID
                            join cdc in CMS_EF.CutterDetailClass on c.DetailClassID equals cdc.ID
                            join cm in CMS_EF.CutterMaterial on c.MaterialID equals cm.ID
                            where cdc.UserName == userName &&
                            c.CuttersDetail.WorkStatusID == 1
                            select new
                            {
                                实图 = ci.ImagePath,

                                编号 = c.number,
                                类别 = cc.Name,
                                详细 = cdc.Name,
                                材料 = cm.Name,
                                位置 = c.CuttersDetail.Location,

                                状态 = c.CuttersDetail.CutterWorkStatus.Name,
                                开始 = c.CuttersDetail.StartTime,
                                结束 = c.CuttersDetail.StopTime,
                                剩余 = c.CuttersDetail.StopTime,
                                磨损 = c.CuttersDetail.WearProcess / c.CuttersDetail.ExpectLife,

                                图表ID = c.CuttersDetail.ElectricTestRecordID,
                            };
                //DEBUG_PRINT
                System.Diagnostics.Debug.WriteLine(query.ToList()[0]);

                Cutters_ListView.DataSource = query.ToList();
                Cutters_ListView.DataBind();
            }
        }
        catch { }
    }
}