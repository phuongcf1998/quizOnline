/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.question;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Yun
 */
public class QuestionDTO implements Serializable{
    
    private String id;
    private String question_content;
    private String answer_1;
    private String answer_2;
    private String answer_3;
    private String answer_4;
    private String answer_correct;
    private Date createDate;
    private String subjectID;
    private int status;

    public QuestionDTO() {
    }

    public QuestionDTO(String id, String question_content, String answer_1, String answer_2, String answer_3, String answer_4, String answer_correct, Date createDate, String subjectID, int status) {
        this.id = id;
        this.question_content = question_content;
        this.answer_1 = answer_1;
        this.answer_2 = answer_2;
        this.answer_3 = answer_3;
        this.answer_4 = answer_4;
        this.answer_correct = answer_correct;
        this.createDate = createDate;
        this.subjectID = subjectID;
        this.status = status;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the question_content
     */
    public String getQuestion_content() {
        return question_content;
    }

    /**
     * @param question_content the question_content to set
     */
    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    /**
     * @return the answer_1
     */
    public String getAnswer_1() {
        return answer_1;
    }

    /**
     * @param answer_1 the answer_1 to set
     */
    public void setAnswer_1(String answer_1) {
        this.answer_1 = answer_1;
    }

    /**
     * @return the answer_2
     */
    public String getAnswer_2() {
        return answer_2;
    }

    /**
     * @param answer_2 the answer_2 to set
     */
    public void setAnswer_2(String answer_2) {
        this.answer_2 = answer_2;
    }

    /**
     * @return the answer_3
     */
    public String getAnswer_3() {
        return answer_3;
    }

    /**
     * @param answer_3 the answer_3 to set
     */
    public void setAnswer_3(String answer_3) {
        this.answer_3 = answer_3;
    }

    /**
     * @return the answer_4
     */
    public String getAnswer_4() {
        return answer_4;
    }

    /**
     * @param answer_4 the answer_4 to set
     */
    public void setAnswer_4(String answer_4) {
        this.answer_4 = answer_4;
    }

    /**
     * @return the answer_correct
     */
    public String getAnswer_correct() {
        return answer_correct;
    }

    /**
     * @param answer_correct the answer_correct to set
     */
    public void setAnswer_correct(String answer_correct) {
        this.answer_correct = answer_correct;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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
