package shop;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.security.*;
 
public class bean 
{
    //private instance variables
	private String firstname;
	private String lastname;
	private String username;
    private String  ref;
	private String phone;
	private String address;
	private String pass;
	
    private Connection connection=null;
    private ResultSet rs = null;
    private Statement st = null;
	String connectionURL = "jdbc:mysql://localhost:3306/shopdatabase";
	
	    
    public bean() 
    {
         try {
			 // Load the database driver
			Class.forName("com.mysql.jdbc.Driver");
			// Get a Connection to the database
			connection = DriverManager.getConnection(connectionURL, "root", ""); 
			}catch(Exception e){
			System.out.println("Exception is ;"+e);
			}
        
    } 
   //......first name methods............	
    public void setfirstname(String firstname)
	{
		this.firstname = firstname;
	}
 
	public String getfirstname()
	{
		return (this.firstname);
	}
	//..............................
	  public void setlastname(String lastname)
	{
		this.lastname = lastname;
	}
 
	public String getlastname()
	{
		return (this.lastname);
	}
	//.....................................
    public void setusername(String username)
	{
		this.username = username;
	}
 
	public String getusername()
	{
		return (this.username);
	}
   //..................................
     public void setref(String ref)
	{
		this.ref = ref;
	}
 
	public String getref()
	{
		return (this.ref);
	}
   //...............................
    public void setphone(String phone)
	{
		this.phone = phone;
	}
 
	public String getphone()
	{
		return (this.phone);
	}
   //...............................
    public void setaddress(String address)
	{
		this.address = address;
	}
 
	public String getaddress()
	{
		return (this.address);
	}
   //...............................
   //password encryption
   public byte[] getSalt(){  
		byte[] salt = new byte[8];    
       return salt; 
       } 
	  public static String get_SHA_1_SecurePassword(String passwordToHash, byte[] salt)
	{ String generatedPassword = null;
			try {
			    MessageDigest md = MessageDigest.getInstance("SHA-1");
			    md.update(salt);
			    byte[] bytes = md.digest(passwordToHash.getBytes());
			    StringBuilder sb = new StringBuilder();
			    for(int i=0; i< bytes.length ;i++){ sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  }           
			    generatedPassword = sb.toString();
			}catch (NoSuchAlgorithmException e) { e.printStackTrace();}
			return generatedPassword;
	}  
   /////////////////////
     public void setpass(String pass)
	{
	    
		    byte[] salt = getSalt();
        String pass1 = get_SHA_1_SecurePassword(pass, salt);
		this.pass = pass1;
	}
 
	public String getpass()
	{
		return (this.pass);
	}
   //................................
    public void insert()
    {
        
       try{
            String sql = "insert into salespersons(FirstName,LastName,UserName,Phone,Password,Address,RefreeName) values('"+firstname+"','"+lastname+"','"+username+"','"+phone+"','"+pass+"','"+address+"','"+ref+"')";
			Statement s = connection.createStatement();
			s.executeUpdate (sql);
			s.close ();
		}catch(Exception e){
			System.out.println("Exception is ;"+e);
		}
    }
    
}
