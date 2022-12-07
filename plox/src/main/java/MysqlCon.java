import java.sql.*;

class MysqlCon{
	public static void main(String args[]){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Plox?autoReconnect=true&useSSL=false","root","0906clcl");
					
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("select * from plox.renting");
					while(rs.next())
						System.out.println(rs.getInt(1));
					con.close();
		}catch(Exception e){ System.out.println(e);}
	}
}