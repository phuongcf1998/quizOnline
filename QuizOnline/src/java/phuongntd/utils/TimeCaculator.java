/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.utils;

import java.sql.Date;

/**
 *
 * @author Yun
 */
public class TimeCaculator {


    public static Date getCurrentDate() {

        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        return date;
    }

}
