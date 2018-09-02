using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class p_Manage_Cutters_AddCutter : System.Web.UI.Page
{
    public int g_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        g_id = getID();

        if (!Page.IsPostBack)
        {
            initUsersGroupList();
        }
    }

    protected void OK_Button_Click(object sender, EventArgs e)
    {
        //初始化数据库
        initSqlDatas();

        //Cutter.ID
        Guid ID = Guid.NewGuid();
        //Cutter.number
        string number = getNumber();
        //Cutter.CutterClass
        int CutterClass = getCutterClass();
        //Cutter.CutterDetailClass
        int CutterDetailClass = getCutterDetailClass();
        //Cutter.CutterMaterial
        int CutterMaterial = getCutterMaterial();

        //CutterDetail.CreateDate
        DateTime CreateDate = getCreateDate();
        //CutterDetail.WorkStatusID
        int WorkStatusID = getWorkStatusID();
        //CutterDetail.Cutter3DImageID
        int Cutter3DImageID = getCutter3DImageID();

        //Cutter3DImages.Name
        string ImageName_3D = getImageName_3D();
        //Cutter3DImages.ImagePath
        string FilePath_3D = getFilePath_3D(); ;
        //Cutter3DImages.UserName
        string Cutter3DImagesUserName = getCutter3DImagesUserName();

        //CutterImages.DateTime
        DateTime DateTime_CutterImages = getDateTime_CutterImages();
        //CutterImages.ImagePath
        string FilePath_Image = getFilePath_Image();

        //UsersGroup.UserName
        List<string> UsersList = getUsersList();

        //CutterNotes.Note
        string Note = getNote();


        add(ID, number, CutterClass, CutterDetailClass, CutterMaterial,
            CreateDate, WorkStatusID, Cutter3DImageID,
            ImageName_3D, FilePath_3D, Cutter3DImagesUserName,
            DateTime_CutterImages, FilePath_Image,
            UsersList,
            Note);
    }

    #region 获取数据
    int getID()
    {
        return Math.Abs(Guid.NewGuid().GetHashCode());
    }
    int getRandID(int id)
    {
        id %= 10000000;
        var seed = Guid.NewGuid().GetHashCode();
        Random r = new Random(seed);
        int rand = r.Next(0, 100);
        id = id * 100 + rand;
        return id;
    }

    #region Cutter
    private string getNumber()
    {
        if (number_TextBox.Text == "")
            return "undefine-" + g_id.ToString();
        else
            return number_TextBox.Text;
    }
    private int getCutterClass()
    {
        if (CutterClass_DropDownList.SelectedValue == "")
            return 0;
        else
            return Int32.Parse(CutterClass_DropDownList.SelectedValue);
    }
    private int getCutterDetailClass()
    {
        if (CutterDetailClass_DropDownList.SelectedValue == "")
            return 0;
        else
            return Int32.Parse(CutterDetailClass_DropDownList.SelectedValue);
    }
    private int getCutterMaterial()
    {
        if (Material_DropDownList.SelectedValue == "")
            return 0;
        else
            return Int32.Parse(Material_DropDownList.SelectedValue);
    }
    #endregion Cutter

    #region CutterDetail
    private DateTime getCreateDate()
    {
        return System.DateTime.Now;
    }
    private int getWorkStatusID()
    {
        return 0;
    }
    private int getCutter3DImageID()
    {
        if (!Cutter3DImages_FileUpload.HasFile)
        {
            if (Cutter3DImages_DropDownList.SelectedValue == "")
                return 0;
            else
                return Int32.Parse(Cutter3DImages_DropDownList.SelectedValue);
        }
        else
            return g_id;
    }
    #endregion CutterDetail

    #region Cutter3DImages
    private string getImageName_3D()
    {
        if (Cutter3DImagesName_TextBox.Text == "")
            if (CutterClass_DropDownList.SelectedValue == "")
                return "undefine" + "/" + g_id;
            else
                return CutterClass_DropDownList.SelectedValue + "/" + g_id;
        else
            return Cutter3DImagesName_TextBox.Text;
    }
    private string getFilePath_3D()
    {
        if (Cutter3DImages_FileUpload.HasFile)
        {
            string virtualFolder = "~/Images/Datas/Cutters/3DImages/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(Cutter3DImages_FileUpload.FileName);

            Cutter3DImages_FileUpload.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));       //文件储存

            return virtualFolder + fileName + extension;
        }
        else
            return "";
    }
    private string getCutter3DImagesUserName()
    {
        return Profile.UserName == null ? "" : Profile.UserName;
    }
    #endregion Cutter3DImages

    #region CutterImages
    private DateTime getDateTime_CutterImages()
    {
        return System.DateTime.Now;
    }
    private string getFilePath_Image()
    {
        if (Image_Fileupload.HasFile)
        {
            string virtualFolder = "~/Images/Datas/Cutters/ActualImages/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(Image_Fileupload.FileName);

            Image_Fileupload.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));       //文件储存
            return virtualFolder + fileName + extension;
        }
        else return "";
    }
    #endregion CutterImages

    #region UsersGroup
    private List<string> getUsersList()
    {
        List<string> ug_list = new List<string>();
        List<string> u_list = new List<string>();

        foreach (ListItem li in UsersGroup_Group_ListBox.Items)
        {
            if (li.Value != "")
                ug_list.Add(li.Value);
        }
        foreach (string s in ug_list)
        {
            if (Membership.FindUsersByName(s).Count > 0)
                u_list.Add(s);
        }

        return u_list;
    }
    #endregion UsersGroup

    #region CutterNotes
    private string getNote()
    {
        DateTime t = System.DateTime.Now;

        if (Note_TextBox.Text == "")
            return t + "：" + "于" + t + "创建刀具信息";
        else
            return t + "：" + Note_TextBox.Text;
    }
    #endregion CutterNotes
    #endregion 获取数据

    private void add(Guid ID, string number, int CutterClass, int CutterDetailClass, int CutterMaterial,
        DateTime CreateDate, int WorkStatusID, int Cutter3DImageID,
        string ImageName_3D, string FilePath_3D, string Cutter3DImagesUserName,
        DateTime DateTime_CutterImages, string FilePath_Image,
        List<string> UsersList,
        string Note)
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                #region Cutters
                Cutters c = new Cutters();
                c.ID = ID;
                c.number = number;
                c.ClassID = CutterClass;
                c.DetailClassID = CutterDetailClass;
                c.MaterialID = CutterMaterial;

                CMS_EF.Cutters.Add(c);
                #endregion Cutters



                #region CutterDetail
                #region 基本数据
                CuttersDetail cd = new CuttersDetail();
                cd.ID = c.ID;
                cd.CreateDate = CreateDate;
                cd.LastUseDate = (DateTime)cd.CreateDate;
                cd.WorkStatusID = WorkStatusID;
                #endregion 基本数据
                #region 详细数据
                cd.Cutter3DImageID = Cutter3DImageID;
                cd.UsersGroupID = g_id;
                cd.ImageID = g_id;
                cd.NoteID = g_id;   //外键
                cd.EventID = g_id;  //外键
                cd.ElectricTestRecordID = g_id;
                #endregion 详细数据

                CMS_EF.CuttersDetail.Add(cd);
                #endregion CutterDetail



                #region 其它表
                #region Cutter3DImages
                if (Cutter3DImages_FileUpload.HasFile)
                {
                    Cutter3DImages c3di = new Cutter3DImages();
                    c3di.ID = (int)cd.Cutter3DImageID;
                    c3di.ClassID = c.ClassID;
                    c3di.UserName = Cutter3DImagesUserName;
                    c3di.Name = ImageName_3D;
                    c3di.ImagePath = FilePath_3D;

                    CMS_EF.Cutter3DImages.Add(c3di);
                }
                #endregion Cutter3DImages

                #region CutterImages
                if (Image_Fileupload.HasFile)
                {
                    CutterImages ci = new CutterImages();
                    ci.ID = getRandID(g_id);
                    ci.ImageID = (int)cd.ImageID;
                    ci.DateTime = DateTime_CutterImages;
                    ci.ImagePath = FilePath_Image;

                    CMS_EF.CutterImages.Add(ci);
                }
                #endregion CutterImages

                #region CutterNotes
                CutterNotes cn = new CutterNotes();
                cn.ID = (int)cd.NoteID;
                cn.Note = Note;

                CMS_EF.CutterNotes.Add(cn);
                #endregion CutterNotes

                #region CutterEvents
                CutterEvents ce = new CutterEvents();
                ce.ID = (int)cd.EventID;

                CMS_EF.CutterEvents.Add(ce);
                #endregion CutterEvents

                #region CutterElectricTestRecord
                CutterElectricTestRecord cetr = new CutterElectricTestRecord();
                cetr.ID = getRandID(g_id);
                cetr.ElectricTestRecordID = (int)cd.ElectricTestRecordID;

                CMS_EF.CutterElectricTestRecord.Add(cetr);
                #endregion CutterElectricTestRecord
                #endregion 其它表

                CMS_EF.SaveChanges();

                /* 单独的一块，会导致多次读写sql */
                #region CutterUsersGroup
                foreach (string u in UsersList)
                {
                    CutterUsersGroup cug = new CutterUsersGroup();
                    cug.GroupID = (int)cd.UsersGroupID;

                    cug.ID = getRandID(g_id);
                    cug.UserName = u;
                    System.Diagnostics.Debug.WriteLine(cug.ID);
                    CMS_EF.CutterUsersGroup.Add(cug);
                    //BUG: note event 表未建立
                    CMS_EF.SaveChanges();   //多用户储存
                }
                #endregion CutterUsersGroup
            }
        }
        catch
        { }
    }

    #region 详细类扩展
    //TODO 可以插入相同的内容
    protected void AddNewDetailClass_Button_Click(object sender, EventArgs e)
    {
        if (CutterDetailClass_TextBox.Text != "" && CutterClass_DropDownList.SelectedValue != "")
        {
            try
            {
                using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
                {
                    CutterDetailClass cdc = new CutterDetailClass();
                    cdc.ID = g_id;
                    cdc.Name = CutterDetailClass_TextBox.Text;
                    cdc.ClassID = Int32.Parse(CutterClass_DropDownList.SelectedValue);
                    cdc.UserName = Profile.UserName;

                    CMS_EF.CutterDetailClass.Add(cdc);
                    CMS_EF.SaveChanges();

                    //刷新页面
                    Response.Redirect(Request.Url.ToString());
                }
            }
            catch { }
        }
    }

    protected void ChangeDetailClass_Button_Click(object sender, EventArgs e)
    {
        if (ChangeDetailClass_TextBox.Text != "" && CutterDetailClass_DropDownList.SelectedValue != "")
        {
            int cdcv = Int32.Parse(CutterDetailClass_DropDownList.SelectedValue);

            try
            {
                using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
                {
                    var cdc = CMS_EF.CutterDetailClass.Single(c => c.ID == cdcv);
                    cdc.Name = ChangeDetailClass_TextBox.Text;

                    CMS_EF.SaveChanges();

                    //刷新页面
                    Response.Redirect(Request.Url.ToString());
                }
            }
            catch { }
        }
    }

    protected void DeleteDetailClass_Button_Click(object sender, EventArgs e)
    {
        if (CutterDetailClass_DropDownList.SelectedValue != "")
        {
            int cdcv = Int32.Parse(CutterDetailClass_DropDownList.SelectedValue);

            try
            {
                using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
                {
                    var cdc = CMS_EF.CutterDetailClass.Single(c => c.ID == cdcv);

                    CMS_EF.CutterDetailClass.Remove(cdc);
                    CMS_EF.SaveChanges();

                    //刷新页面
                    Response.Redirect(Request.Url.ToString());
                }
            }
            catch { }
        }
    }

    #endregion

    #region 方法
    /// <summary>
    /// 将列表值缓存起来
    /// </summary>
    private List<string> getUgg_list(bool op)
    {
        List<string> ugg_list = new List<string>();

        if (op)
        {
            string ug_result = UsersGroup_Result_ListBox.SelectedValue;

            if (Request.Cookies["myUsersGroupCookie"] == null)
            {
                HttpCookie cookie_new = new HttpCookie("myUsersGroupCookie");
                DateTime dt = DateTime.Now;
                TimeSpan ts = new TimeSpan(0, 0, 1, 0, 0);
                cookie_new.Expires = dt.Add(ts);
                if (Profile.UserName != null)
                    cookie_new.Values.Set(Profile.UserName, Profile.UserName);
                Response.AppendCookie(cookie_new);
            }

            var cookie = Request.Cookies["myUsersGroupCookie"];

            if (ug_result != "" && ug_result != null)
                cookie.Values[ug_result] = ug_result;
            Response.AppendCookie(cookie);

            foreach (string s in cookie.Values.AllKeys)
            {
                if (cookie.Values[s] != "")
                    ugg_list.Add(cookie.Values[s]);
            }
        }
        else
        {
            string ug_g = UsersGroup_Group_ListBox.SelectedValue;

            if (Request.Cookies["myUsersGroupCookie"] != null)
            {
                var cookie = Request.Cookies["myUsersGroupCookie"];

                if (ug_g != "" && ug_g != null)
                    cookie.Values.Remove(ug_g);
                Response.AppendCookie(cookie);

                foreach (string s in cookie.Values.AllKeys)
                {
                    if (cookie.Values[s] != "")
                        ugg_list.Add(cookie.Values[s]);
                }
            }
        }

        return ugg_list;
    }

    /// <summary>
    /// 初始化UsersGroupList
    /// </summary>
    private void initUsersGroupList()
    {
        ListItem li = new ListItem();
        li.Value = Profile.UserName;
        li.Text = li.Text;
        UsersGroup_Group_ListBox.Items.Add(li);
    }

    #region initSqlDatas
    /// <summary>
    /// 首次加载初始化数据库
    /// staus并没有外部输入，只能提前设定
    /// </summary>
    private void initSqlDatas()
    {
        if (CutterClass_DropDownList.SelectedValue == "")
        {
            initSqlDatas_CutterClass();
        }
        if (CutterDetailClass_DropDownList.SelectedValue == "")
        {
            initSqlDatas_CutterDetailClass();
        }
        if (Material_DropDownList.SelectedValue == "")
        {
            initSqlDatas_CutterMaterial();
        }
    }
    private void initSqlDatas_CutterClass()
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                CutterClass cc = new CutterClass();
                cc.ID = 0;

                CMS_EF.CutterClass.Add(cc);
                CMS_EF.SaveChanges();
            }
        }
        catch (System.Data.Entity.Infrastructure.DbUpdateException ex)
        {
            System.Diagnostics.Debug.WriteLine("i not deal:" + ex.ToString());
        }
    }
    private void initSqlDatas_CutterDetailClass()
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                CutterDetailClass cdc = new CutterDetailClass();
                cdc.ID = 0;

                CMS_EF.CutterDetailClass.Add(cdc);
                CMS_EF.SaveChanges();
            }
        }
        catch (System.Data.Entity.Infrastructure.DbUpdateException ex)
        {
            System.Diagnostics.Debug.WriteLine("i not deal:" + ex.ToString());
        }
    }
    private void initSqlDatas_CutterMaterial()
    {
        try
        {
            using (CMSDB_Entities CMS_EF = new CMSDB_Entities())
            {
                CutterMaterial cm = new CutterMaterial();
                cm.ID = 0;

                CMS_EF.CutterMaterial.Add(cm);
                CMS_EF.SaveChanges();
            }
        }
        catch (System.Data.Entity.Infrastructure.DbUpdateException ex)
        {
            System.Diagnostics.Debug.WriteLine("i not deal:" + ex.ToString());
        }
    }
    #endregion initSqlDatas
    #endregion 方法

    #region 事件
    #region 查找用户
    //TODO 只能完全匹配后才能查询到
    protected void UsersGroup_Search_Button_Click(object sender, EventArgs e)
    {
        if (UsersGroup_Input_TextBox.Text != "")
        {
            var users = Membership.FindUsersByName(UsersGroup_Input_TextBox.Text);

            UsersGroup_Result_ListBox.DataSource = users;
            UsersGroup_Result_ListBox.DataBind();
        }
    }
    #endregion

    #region 添加用户到组
    protected void UsersGroup_Add_Button_Click(object sender, EventArgs e)
    {
        List<string> ugg_list = getUgg_list(true);

        UsersGroup_Group_ListBox.DataSource = ugg_list;
        UsersGroup_Group_ListBox.DataBind();
    }
    #endregion 添加用户到组

    #region 将用户从组移除
    protected void UsersGroup_Delete_Button_Click(object sender, EventArgs e)
    {
        List<string> ugg_list = getUgg_list(false);

        UsersGroup_Group_ListBox.DataSource = ugg_list;
        UsersGroup_Group_ListBox.DataBind();
    }
    #endregion 将用户从组移除
    #endregion 事件
}