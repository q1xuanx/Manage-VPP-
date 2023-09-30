/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author Admin
 */
public class DBConnect {

    public Connection getConnect() throws ClassNotFoundException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String URL = "jdbc:sqlserver://localhost:1433;Database=QLVPP;user=leo;password=mrsg2011";
            Connection conn = DriverManager.getConnection(URL);
            return conn;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.toString(), "Fail", JOptionPane.ERROR_MESSAGE);
            return null;
        }
    }
}
