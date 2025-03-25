using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WF0307
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
  

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*  AlertMessage sysmsg = new AlertMessage();
              SysDb append_data = new SysDb("MIS_3");
              append_data.Inserted += new SqlDataSourceStatusEventHandler(this.upload_img);
              append_data.Inserted += new SqlDataSourceStatusEventHandler(this.Clear_Textbox);
              append_data.Inserted += new SqlDataSourceStatusEventHandler(this.testmsg);*/
            AlertMessage sysmsg = new AlertMessage();
            SysDb append_data = new SysDb("MYDBConnectionString");
            append_data.InsertCommand = "INSERT INTO [Employee] ([emp002], [emp003], [emp004], [emp005], [emp006], [emp008], [emp009]) " +
                " VALUES  (@emp002, @emp003, @emp004, @emp005 ,@emp006, @emp008, @emp009)";

            append_data.InsertParameters.Add(new Parameter("emp002", TypeCode.String, Request.Form["TextBox1"]));
            append_data.InsertParameters.Add(new Parameter("emp003", TypeCode.String, Request.Form["TextBox2"]));
            append_data.InsertParameters.Add(new Parameter("emp005", TypeCode.String, Request.Form["TextBox3"]));
            append_data.InsertParameters.Add(new Parameter("emp008", TypeCode.String, Request.Form["TextBox4"]));
            append_data.InsertParameters.Add(new Parameter("emp004", TypeCode.String, DropDownList1.SelectedValue.ToString()));
            append_data.InsertParameters.Add(new Parameter("emp006", TypeCode.String, DropDownList4.SelectedValue.ToString()));
            append_data.InsertParameters.Add(new Parameter("emp009", TypeCode.String, DropDownList5.SelectedValue.ToString()));

            //append_data.Insert();
            try
            {
                append_data.Insert();
                //sysmsg.ShowMsg(this.Page,"新增完成!");
            }
            catch (Exception)
            {
                sysmsg.ShowMsg(this.Page, "新增失敗" + e.ToString() + append_data.InsertCommand.ToString());
            }
        }
    }
}