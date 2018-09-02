using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class p_User_Administer_ChangeRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Roles_DropDownList.DataSource = Roles.GetAllRoles();
            Roles_DropDownList.DataBind();

            ChangeRole_DropDownList.DataSource = Roles.GetAllRoles();
            ChangeRole_DropDownList.DataBind();

            refreshData();
        }
    }

    protected void OK_Button_Click(object sender, EventArgs e)
    {
        Roles.RemoveUserFromRole(UserInThisRole_ListBox.SelectedValue, Roles_DropDownList.SelectedValue);
        Roles.AddUserToRole(UserInThisRole_ListBox.SelectedValue, ChangeRole_DropDownList.SelectedValue);

        refreshData();
    }

    protected void Roles_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        refreshData();
    }

    private void refreshData()
    {
        UserInThisRole_ListBox.DataSource = Roles.GetUsersInRole(Roles_DropDownList.SelectedValue);
        UserInThisRole_ListBox.DataBind();
    }
}