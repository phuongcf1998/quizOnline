/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.subject;

import java.io.Serializable;

/**
 *
 * @author Yun
 */
public class SubjectDTO implements Serializable{
    private String subjectID;
    private String subjectName;
    private int quizTime;
    private int numberQuestion;
    private int status;

    public SubjectDTO() {
    }

    public SubjectDTO(String subjectID, String subjectName, int quizTime, int numberQuestion, int status) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.quizTime = quizTime;
        this.numberQuestion = numberQuestion;
        this.status = status;
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
     * @return the subjectName
     */
    public String getSubjectName() {
        return subjectName;
    }

    /**
     * @param subjectName the subjectName to set
     */
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    /**
     * @return the quizTime
     */
    public int getQuizTime() {
        return quizTime;
    }

    /**
     * @param quizTime the quizTime to set
     */
    public void setQuizTime(int quizTime) {
        this.quizTime = quizTime;
    }

    /**
     * @return the numberQuestion
     */
    public int getNumberQuestion() {
        return numberQuestion;
    }

    /**
     * @param numberQuestion the numberQuestion to set
     */
    public void setNumberQuestion(int numberQuestion) {
        this.numberQuestion = numberQuestion;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
    
}
