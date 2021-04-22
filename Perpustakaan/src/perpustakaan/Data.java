/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perpustakaan;

import javax.swing.JOptionPane;

/**
 *
 * @author Isepl
 */
public class Data {    
    // pustakawan
    public static String userpus = "pustakawan";
    public static String passpus = "1234";
    
    
    // mahasiswa
    private static String[][] mahasiswa = { 
        {"2113191079", "Isep Lutpi Nur"}, 
        {"2113191080", "Adistia Ramadhani"}, 
        {"2113191081", "M. Ilham Solehudin"}, 
        {"2113191082", "Dara Atria Ferliandini"}, 
    };
    
    // buku
    private static String[][] buku = {
        {"1271624", "Dear Nathan", "J.Andika", "Gramedia", "2018" ,"Novel"},
        {"3237157", "Permrograman Web", "J.Andika", "Yudistira", "2016" ,"Pelajaran"},
        {"5985989", "Mandalika", "JJ. Thompson", "Sinarpadiu", "2018" ,"Novel"},
        {"10014320", "apa", "apa", "apa", "2005" ,"Pelajaran"},
    };
    
    // data peminjaman
    private static String[][] peminjaman = {
        {"2113191079","1271624", "2021-01-11"},
        {"2113191082","10014320", "2021-04-11"},
        {"2113191082","10014320", "2021-04-21"},
    };

    // get data
    public static String[][] getPeminjaman(){
        return Data.peminjaman;
    }
}
