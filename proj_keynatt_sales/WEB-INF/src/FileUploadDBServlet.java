package upload;
 
import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    // database connection settings
   String dbURL = "jdbc:mysql://localhost:3306/shopdatabase";
    String dbUser = "root";
     String dbPass = "";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String branch1 = request.getParameter("branch");
        String bagname1 = request.getParameter("bagname");
         String bagid1 = request.getParameter("bagid");
         String qty1 = request.getParameter("qty");
         String prc1 = request.getParameter("prc");
//         String image1 = request.getParameter("image");
         String desc1 = request.getParameter("desc");
      //   String lastName = request.getParameter("bagname");
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            
            
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO bags (Branch, BagName,BagID,Quantity,price, ImgRef,ShortDescription) values (?, ?, ?,?, ?, ?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, branch1);
            statement.setString(2, bagname1);
            statement.setString(3, bagid1);
            statement.setString(4, qty1);
            statement.setString(5, prc1);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(6, inputStream);
            }
 
            statement.setString(7, desc1);
             
           
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    }
}
