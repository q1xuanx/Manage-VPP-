/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package qlvanphongpham;

/**
 *
 * @author Admin
 */
public class Main {
    public static void main(String args[]) throws InterruptedException{
        Loading l = new Loading();
                l.setVisible(true);
                LoginForm lg = new LoginForm();
                 lg.setVisible(false);

                // Pause execution for 2 seconds (2000 milliseconds)
                Thread.sleep(2000);

                // Show the main form and hide the loading form
                l.setVisible(false);
                 lg.setVisible(true);
       
    }
}
