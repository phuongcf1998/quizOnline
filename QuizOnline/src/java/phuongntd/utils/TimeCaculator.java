/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.utils;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Yun
 */
public class TimeCaculator {

    public static Time convertTotalSecondToTime(String timeRemaining, String timeQuiz) throws ParseException {

        Time result;
        SimpleDateFormat format = new SimpleDateFormat("mm:ss");
        Date date1 = format.parse(timeRemaining);
        Date date2 = format.parse(timeQuiz);
        long difference = date2.getTime() - date1.getTime();
        int totalSeconds = (int) (difference / 1000);
        int p1 = totalSeconds % 60;
        int p2 = totalSeconds / 60;
        int p3 = p2 % 60;
        p2 = p2 / 60;
        System.out.print(p2 + ":" + p3 + ":" + p1);
        result = new Time(p2, p3, p1);
        return result;
    }

    public static Date getCurrentDate() {

        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        return date;
    }

}
