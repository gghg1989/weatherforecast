using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prediction : Page
{
    private string selectedDate = "";


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void dateCalendar_SelectionChanged(object sender, EventArgs e)
    {
        //DateTime minDate = new DateTime(2015,1,1,0,0,0);
        //if (dateCalendar.SelectedDate < minDate)
        //{
        //    dateCalendar.SelectedDate = minDate;
        //    return; 
        //}
        Label1.Text = dateCalendar.SelectedDate.ToShortDateString();

        SqlConnection cn = new SqlConnection("Data Source=*;Initial Catalog=*;Persist Security Info=True;User ID=*;Password=*");
        cn.Open();
        SqlCommand cmd=new SqlCommand("SELECT max, min, ave FROM weather_data WHERE id="+dateCalendar.SelectedDate.ToString("yyyyMMdd"),cn);
        SqlDataReader reader= cmd.ExecuteReader();
        while (reader.Read())
        {
            max.Text = reader["max"].ToString();
            min.Text = reader["min"].ToString();
            ave.Text = reader["ave"].ToString();
        }
        cn.Close();
    }

}