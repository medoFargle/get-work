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
    public partial class customer_data : System.Web.UI.Page
    {
        string connection = @"server=a2plcpnl0252.prod.iad2.secureserver.net;database=test_database;uid=law_root;pwd=AS5261@@#; ";
        int Customer_ID = 0; 
        protected void Page_Load(object sender, EventArgs e)
        {
           
            clear();
            DBGrid_Full();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connection))
            {
                sqlcon.Open();
                MySqlCommand sqlcmd = new MySqlCommand("customer_Update", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("Customer_ID", Convert.ToInt32(TxtCustomer_Name.Text));
                sqlcmd.Parameters.AddWithValue("Customer_Name", TxtCustomer_Name.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Phone", TxtCustomer_Phone.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Address", TxtCustomer_Address.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Email", TxtCustomer_Email.Text);
                sqlcmd.ExecuteNonQuery();
                clear();
                lblMessge.Text = "right Function";
                DBGrid_Full();
            }
        }

        protected void lnkSelect_OnClick(object sender, EventArgs e)
        {
           Customer_ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            using (MySqlConnection sqlcon = new MySqlConnection(connection))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("dbGrid_Full", sqlcon);
                sqlDa.SelectCommand.Parameters.AddWithValue("customer_ID", Customer_ID);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;

                DataTable tab = new DataTable();
                sqlDa.Fill(tab);
                TxtCustomer_Name.Text = tab.Rows[0][1].ToString();
                TxtCustomer_Phone.Text = tab.Rows[0][2].ToString();
                TxtCustomer_Address.Text = tab.Rows[0][3].ToString();
                TxtCustomer_Email.Text = tab.Rows[0][4].ToString();
                Customer_ID = Convert.ToInt16(tab.Rows[0][0]); 
                
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connection))
            {
                sqlcon.Open();
                
                MySqlCommand sqlcmd = new MySqlCommand("customer_Insert", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("Customer_ID", Customer_ID);
                sqlcmd.Parameters.AddWithValue("Customer_Name", TxtCustomer_Name.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Name", TxtCustomer_Name.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Phone", TxtCustomer_Phone.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Address", TxtCustomer_Address.Text);
                sqlcmd.Parameters.AddWithValue("Customer_Email", TxtCustomer_Email.Text);
                sqlcmd.ExecuteNonQuery();
                clear();
                DBGrid_Full();
                lblMessge.Text = "right Function";

            }
        }
        void clear()
        {
            TxtCustomer_Name.Text = TxtCustomer_Phone.Text = TxtCustomer_Email.Text = TxtCustomer_Address.Text = "";
            btnSave.Text = "Save";
        }

        void DBGrid_Full()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connection))
            {
                sqlcon.Open();
            MySqlDataAdapter sqlDa= new MySqlDataAdapter("dbGrid_Full",sqlcon);
                sqlDa.SelectCommand.CommandType=CommandType.StoredProcedure;
                DataTable tab = new DataTable();
                sqlDa.Fill(tab);
                dbGrid.DataSource=tab;
                dbGrid.DataBind();
 
 
        }
        }

        internal void show()
        {
            throw new NotImplementedException();
        }
    }
}

    
