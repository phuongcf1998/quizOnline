/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.user;

import java.io.Serializable;

/**
 *
 * @author Yun
 */
public class UserCreateError  implements Serializable{
    private String emailEmpty;
    private String emailNotValid;
    private String emailIsExits;
    private String nameEmpty;
    private String passwordEmpty;
    private String confirmPasswordEmpty;
    private String confirmPasswordNotMatch;
     

    public UserCreateError() {
    }

    public UserCreateError(String emailEmpty, String emailNotValid, String nameEmpty, String passwordEmpty, String confirmPasswordEmpty, String confirmPasswordNotMatch, String emailIsExits) {
        this.emailEmpty = emailEmpty;
        this.emailNotValid = emailNotValid;
        this.nameEmpty = nameEmpty;
        this.passwordEmpty = passwordEmpty;
        this.confirmPasswordEmpty = confirmPasswordEmpty;
        this.confirmPasswordNotMatch = confirmPasswordNotMatch;
        this.emailIsExits = emailIsExits;
    }

    /**
     * @return the emailEmpty
     */
    public String getEmailEmpty() {
        return emailEmpty;
    }

    /**
     * @param emailEmpty the emailEmpty to set
     */
    public void setEmailEmpty(String emailEmpty) {
        this.emailEmpty = emailEmpty;
    }

    /**
     * @return the emailNotValid
     */
    public String getEmailNotValid() {
        return emailNotValid;
    }

    /**
     * @param emailNotValid the emailNotValid to set
     */
    public void setEmailNotValid(String emailNotValid) {
        this.emailNotValid = emailNotValid;
    }

    /**
     * @return the nameEmpty
     */
    public String getNameEmpty() {
        return nameEmpty;
    }

    /**
     * @param nameEmpty the nameEmpty to set
     */
    public void setNameEmpty(String nameEmpty) {
        this.nameEmpty = nameEmpty;
    }

    /**
     * @return the passwordEmpty
     */
    public String getPasswordEmpty() {
        return passwordEmpty;
    }

    /**
     * @param passwordEmpty the passwordEmpty to set
     */
    public void setPasswordEmpty(String passwordEmpty) {
        this.passwordEmpty = passwordEmpty;
    }

    /**
     * @return the confirmPasswordEmpty
     */
    public String getConfirmPasswordEmpty() {
        return confirmPasswordEmpty;
    }

    /**
     * @param confirmPasswordEmpty the confirmPasswordEmpty to set
     */
    public void setConfirmPasswordEmpty(String confirmPasswordEmpty) {
        this.confirmPasswordEmpty = confirmPasswordEmpty;
    }

    /**
     * @return the confirmPasswordNotMatch
     */
    public String getConfirmPasswordNotMatch() {
        return confirmPasswordNotMatch;
    }

    /**
     * @param confirmPasswordNotMatch the confirmPasswordNotMatch to set
     */
    public void setConfirmPasswordNotMatch(String confirmPasswordNotMatch) {
        this.confirmPasswordNotMatch = confirmPasswordNotMatch;
    }

    /**
     * @return the emailIsExits
     */
    public String getEmailIsExits() {
        return emailIsExits;
    }

    /**
     * @param emailIsExits the emailIsExits to set
     */
    public void setEmailIsExits(String emailIsExits) {
        this.emailIsExits = emailIsExits;
    }

    
    
}
