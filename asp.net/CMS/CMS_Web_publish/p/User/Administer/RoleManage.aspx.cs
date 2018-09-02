using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class p_User_Administer_RoleManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            refreshData();
        }
    }

    protected void AddRole_Button_Click(object sender, EventArgs e)
    {
        Roles.CreateRole(RoleName_TextBox.Text);

        refreshData();
    }

    protected void DeleteRole_Button_Click(object sender, EventArgs e)
    {
        Roles.DeleteRole(Roles_ListBox.SelectedValue);

        refreshData();
    }



    private void refreshData()
    {
        Roles_ListBox.DataSource = Roles.GetAllRoles();
        Roles_ListBox.DataBind();
    }
}