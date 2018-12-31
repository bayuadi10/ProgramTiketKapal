/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TiketKapal;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class koneksiDB {
    
    private static Connection koneksiDB;
    public static Connection getKoneksiDB(){
        if(koneksiDB==null){
            String servername="localhost";
            String databasename="tiket_kapal";
            String user ="root";
            String password="";
            try{
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                koneksiDB=(Connection)DriverManager.getConnection("jdbc:mysql://"+servername+"/"+databasename,user,password);
            }catch (Exception e){
            JOptionPane.showMessageDialog(null,e );
        
        }
        }
     
        return koneksiDB;
     
    }
    }

