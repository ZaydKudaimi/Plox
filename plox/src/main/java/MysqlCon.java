import java.sql.*;

class MysqlCon{
	public static void main(String args[]){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Plox?autoReconnect=true&useSSL=false","root","0906clcl");
			Connection con = DriverManager.getConnection("jdbc:mysql://ploxfinaldb-do-user-13036958-0.b.db.ondigitalocean.com:25060/defaultdb?autoReconnect=true&useSSL=false", "doadmin", "AVNS_W5T6PFxSzJBltRHm6b4");

					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("select * from plox.renting");
					while(rs.next())
						System.out.println(rs.getInt(1));
					con.close();
		}catch(Exception e){ System.out.println(e);}
	}
}