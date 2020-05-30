/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.history;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Yun
 */
public class HistoryDTO implements Serializable{
    private String userEmail;
    private String subjectID;
    private double point;
    private int correctAnswers;
    private Time time;
    private Date date;
    
    public HistoryDTO() {
    }

    public HistoryDTO(String userEmail, String subjectID, double point, int correctAnswers, Time time, Date date) {
        this.userEmail = userEmail;
        this.subjectID = subjectID;
        this.point = point;
        this.correctAnswers = correctAnswers;
        this.time = time;
        this.date = date;
    }

    /**
     * @return the userEmail
     */
    public String getUserEmail() {
        return userEmail;
    }

    /**
     * @param userEmail the userEmail to set
     */
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    /**
     * @return the subjectID
     */
    public String getSubjectID() {
        return subjectID;
    }

    /**
     * @param subjectID the subjectID to set
     */
    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    /**
     * @return the point
     */
    public double getPoint() {
        return point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(double point) {
        this.point = point;
    }

    /**
     * @return the correctAnswers
     */
    public int getCorrectAnswers() {
        return correctAnswers;
    }

    /**
     * @param correctAnswers the correctAnswers to set
     */
    public void setCorrectAnswers(int correctAnswers) {
        this.correctAnswers = correctAnswers;
    }

    /**
     * @return the time
     */
    public Time getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(Time time) {
        this.time = time;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

   
  
    
    
    
    
}
