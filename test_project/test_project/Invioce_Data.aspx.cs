using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace test_project
{
    public partial class Invioce_Data : System.Web.UI.Page
    {
        string connection = @"server=a2plcpnl0252.prod.iad2.secureserver.net;database=test_database;uid=law_root;pwd=AS5261@@#; ";
        int Customer_ID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            dropdrowlistFull();
        }
         
        

        
            protected void btnSave_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connection))
            {
                sqlcon.Open();
                
                MySqlCommand sqlcmd = new MySqlCommand("Invoice_Insert", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("Customer_ID", Customer_ID);
                sqlcmd.Parameters.AddWithValue("InvoiceId_DateTime", DateInvioce.SelectedDate);
                sqlcmd.Parameters.AddWithValue("Value", Convert.ToDecimal (txtvalue.Text));

                sqlcmd.ExecuteNonQuery();
                clear();
            }
        }

            protected void btnClear_Click(object sender, EventArgs e)
            {
                clear();

            }
            void clear()
            {
                txtvalue.Text = custimer_Name.Text = "";
                btnSave.Text = "Save";
            }
            void DBGrid_Full()
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connection))
                {
                    sqlcon.Open();
                    MySqlDataAdapter sqlDa = new MySqlDataAdapter("Invoice_dbGrid", sqlcon);
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                    DataTable tab = new DataTable();
                    sqlDa.SelectCommand.Parameters.AddWithValue("Customer_ID", Customer_ID);
                    sqlDa.Fill(tab);
                    dbGrid.DataSource = tab;
                    dbGrid.DataBind();

                }
            }
            void dropdrowlistFull()
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connection))
                {
                    sqlcon.Open();

                    MySqlCommand sqlcmd = new MySqlCommand("Invoice_Customer_Full", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    custimer_Name.DataSource = sqlcmd.ExecuteReader();
                    custimer_Name.DataTextField = "Customer_Name";
                    custimer_Name.DataValueField = "Customer_ID";
                    custimer_Name.DataBind();
                    sqlcon.Close();


                }
            }


            internal void show()
            {
                throw new NotImplementedException();
            }
    }
}