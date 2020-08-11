package shop;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
public class bag 
{
private String Branch;
private String BagName;
    private String BagID;
    private String Quantity;
      private String price;
	private String ImgRef;
	private String ShortDescription;

 
    private Connection connection=null;
    private ResultSet rs = null;
    private Statement st = null;
    String connectionURL = "jdbc:mysql://localhost:3306/shopdatabase";


    public bag() 
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
	public void setBranch(String Branch)
    {
        this.Branch = Branch;
    }

    public String getBranch()
    {
        return (this.Branch);
    }
	  public void setBagName(String BagName)
    {
        this.BagName = BagName;
    }

    public String getBagName()
    {
        return (this.BagName);
    }
  
    public void setBagID(String BagID)
    {
        this.BagID = BagID;
    }

    public String getBagID()
    {
        return (this.BagID);
    }
public void setQuantity(String Quantity)
    {
        this.Quantity = Quantity;
    }

    public String getQuantity()
    {
        return (this.Quantity);
    } 
  public void setprice(String price)
    {
        this.price = price;
    }

    public String getprice()
    {
        return (this.price);
    }
	 public void setImgRef(String ImgRef)
    {
        this.ImgRef = ImgRef;
    }
 
    public String getImgRef()
    {
        return (this.ImgRef);
    }
	public void setShortDescription(String ShortDescription)
    {
        this.ShortDescription = ShortDescription;
    }

    public String getShortDescription()
    {
        return (this.ShortDescription);
    }

    
     public void insert()
    {
       try
       {
            String sql = "insert into bags(Branch,BagName,BagID,Quantity,price,ImgRef,ShortDescription) values('"+Branch+"','"+BagName+"','"+BagID+"','"+Quantity+"','"+price+"','"+ImgRef+"',"+ShortDescription+")";
            Statement s = connection.createStatement();
            s.executeUpdate (sql);
            s.close ();
        }catch(Exception e){
            System.out.println("Exception is ;"+e);
        }
    }

}