using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class p_User_Administer_AddRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Roles_DropDownList.DataSource = Roles.GetAllRoles();
            Roles_DropDownList.DataBind();
        }
    }

    //TODO 只能完全匹配后才能查询到
    protected void Search_Button_Click(object sender, EventArgs e)
    {
        if (Search_TextBox.Text != "")
        {
            var user = Membership.FindUsersByName(Search_TextBox.Text);

            SearchResult_ListBox.DataSource = user;
            SearchResult_ListBox.DataBind();
        }
    }

    protected void AddUserToRole_Button_Click(object sender, EventArgs e)
    {
        Roles.AddUserToRole(SearchResult_ListBox.SelectedValue, Roles_DropDownList.SelectedValue);
    }
}