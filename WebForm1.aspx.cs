using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WF0307
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.TextBox1.Text = this.SqlDataSource1.SelectCommand.ToString();
            if(!IsPostBack)
            {
                UpdateTime();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // 更新時間 (來自伺服器端)
            UpdateTime();
        }

        private void UpdateTime()
        {
            lblTime.Text = DateTime.Now.ToString("HH:mm:ss");
        }
    }
}