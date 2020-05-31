/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.question;

import java.io.Serializable;

/**
 *
 * @author Yun
 */
public class QuestionCreateError implements Serializable {
    private String questionIdEmpty;
    private String questionIdIsExits;
    private String questionExceededLength;
    private String questionContentEmpty;
    private String answer1Empty;
    private String answer2Empty;
    private String answer3Empty;
    private String answer4Empty;
    private String answerCorrectEmpty;

    public QuestionCreateError() {
    }

    public QuestionCreateError(String questionIdEmpty, String questionIdIsExits, String questionExceededLength, String questionContentEmpty, String answer1Empty, String answer2Empty, String answer3Empty, String answer4Empty, String answerCorrectEmpty) {
        this.questionIdEmpty = questionIdEmpty;
        this.questionIdIsExits = questionIdIsExits;
        this.questionExceededLength = questionExceededLength;
        this.questionContentEmpty = questionContentEmpty;
        this.answer1Empty = answer1Empty;
        this.answer2Empty = answer2Empty;
        this.answer3Empty = answer3Empty;
        this.answer4Empty = answer4Empty;
        this.answerCorrectEmpty = answerCorrectEmpty;
    }

    /**
     * @return the questionIdEmpty
     */
    public String getQuestionIdEmpty() {
        return questionIdEmpty;
    }

    /**
     * @param questionIdEmpty the questionIdEmpty to set
     */
    public void setQuestionIdEmpty(String questionIdEmpty) {
        this.questionIdEmpty = questionIdEmpty;
    }

    /**
     * @return the questionIdIsExits
     */
    public String getQuestionIdIsExits() {
        return questionIdIsExits;
    }

    /**
     * @param questionIdIsExits the questionIdIsExits to set
     */
    public void setQuestionIdIsExits(String questionIdIsExits) {
        this.questionIdIsExits = questionIdIsExits;
    }

    /**
     * @return the questionExceededLength
     */
    public String getQuestionExceededLength() {
        return questionExceededLength;
    }

    /**
     * @param questionExceededLength the questionExceededLength to set
     */
    public void setQuestionExceededLength(String questionExceededLength) {
        this.questionExceededLength = questionExceededLength;
    }

    /**
     * @return the questionContentEmpty
     */
    public String getQuestionContentEmpty() {
        return questionContentEmpty;
    }

    /**
     * @param questionContentEmpty the questionContentEmpty to set
     */
    public void setQuestionContentEmpty(String questionContentEmpty) {
        this.questionContentEmpty = questionContentEmpty;
    }

    /**
     * @return the answer1Empty
     */
    public String getAnswer1Empty() {
        return answer1Empty;
    }

    /**
     * @param answer1Empty the answer1Empty to set
     */
    public void setAnswer1Empty(String answer1Empty) {
        this.answer1Empty = answer1Empty;
    }

    /**
     * @return the answer2Empty
     */
    public String getAnswer2Empty() {
        return answer2Empty;
    }

    /**
     * @param answer2Empty the answer2Empty to set
     */
    public void setAnswer2Empty(String answer2Empty) {
        this.answer2Empty = answer2Empty;
    }

    /**
     * @return the answer3Empty
     */
    public String getAnswer3Empty() {
        return answer3Empty;
    }

    /**
     * @param answer3Empty the answer3Empty to set
     */
    public void setAnswer3Empty(String answer3Empty) {
        this.answer3Empty = answer3Empty;
    }

    /**
     * @return the answer4Empty
     */
    public String getAnswer4Empty() {
        return answer4Empty;
    }

    /**
     * @param answer4Empty the answer4Empty to set
     */
    public void setAnswer4Empty(String answer4Empty) {
        this.answer4Empty = answer4Empty;
    }

    /**
     * @return the answerCorrectEmpty
     */
    public String getAnswerCorrectEmpty() {
        return answerCorrectEmpty;
    }

    /**
     * @param answerCorrectEmpty the answerCorrectEmpty to set
     */
    public void setAnswerCorrectEmpty(String answerCorrectEmpty) {
        this.answerCorrectEmpty = answerCorrectEmpty;
    }

    
    
    
    
}
