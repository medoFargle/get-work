using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test_project
{
    public partial class Main_Data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Open_Invioce_Click(object sender, EventArgs e)
        {
            Invioce_Data Inv = new Invioce_Data();
            Inv.show();
         }

        protected void Open_customer_Click(object sender, EventArgs e)
        {
            customer_data Cus = new customer_data();
            Cus.show();

            
        }
    }
}