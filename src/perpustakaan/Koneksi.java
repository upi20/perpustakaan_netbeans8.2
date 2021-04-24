package perpustakaan;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class Koneksi {
    
    private static Connection koneksi;
    public static Connection getKoneksi(){
        if(koneksi == null){
            try{
                Driver driver = new Driver();
                DriverManager.registerDriver(driver);
                
                String url = "jdbc:mysql://localhost:3306/perpustakaan";
                String user = "root";
                String pass = "";
                
                koneksi = (Connection) DriverManager.getConnection(url,user,pass);
                System.out.println("Koneksi Berhasil");
            }catch(SQLException ex){
                JOptionPane.showMessageDialog(null,"Koneksi Gagal");
                System.out.println("Koneksi Gagal");
            }
        }
        return koneksi;
    }    
}
