using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for conn
/// </summary>
public class conn
{
    SqlConnection con = new SqlConnection("database=dbRestaurant;server=.;uid=;pwd=");
    public conn()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    

    public void queryProcedure(string proName, SqlParameter[] pr)
    {
        con.Open();
        SqlCommand com = new SqlCommand(proName, con);
        for (int i = 0; i < pr.Length; i++)
        {
            com.Parameters.Add(pr[i]);
        }
        com.CommandType = CommandType.StoredProcedure;
        com.ExecuteNonQuery();
        con.Close();
    }
    public int matchProcedure(string proName, SqlParameter[] pr)
    {
        con.Open();
        SqlCommand com = new SqlCommand(proName, con);
        for (int i = 0; i < pr.Length; i++)
        {
            com.Parameters.Add(pr[i]);
        }


        com.CommandType = CommandType.StoredProcedure;
        int x = Convert.ToInt32(com.ExecuteScalar());
        con.Close();
        return x;
    }
    public DataTable showProcedure(string proName, SqlParameter[] pr)
    {
        con.Open();
        SqlCommand com = new SqlCommand(proName, con);
        for (int i = 0; i < pr.Length; i++)
        {
            com.Parameters.Add(pr[i]);
        }
        com.CommandType = CommandType.StoredProcedure;

        SqlDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        con.Close();
        return dt;
    }

    public SqlDataAdapter databindInAdapter(string cmd)
    {
        con.Open();
        SqlDataAdapter dt = new SqlDataAdapter(cmd, con);
        con.Close();
        return dt;
    }

    public int query(string cmd)
    {
        con.Open();
        SqlCommand com = new SqlCommand(cmd, con);
        int k = com.ExecuteNonQuery();
        con.Close();
        return k;
    }
    public int match(string cmd)
    {
        con.Open();
        SqlCommand com = new SqlCommand(cmd, con);
        int k = Convert.ToInt32(com.ExecuteScalar());
        con.Close();
        return k;
    }
    public DataTable show(string cmd)
    {
        con.Open();
        SqlCommand com = new SqlCommand(cmd, con);
        SqlDataReader dr = com.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        con.Close();
        return dt;
    }
}
