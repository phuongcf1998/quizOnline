/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.history;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import phuongntd.utils.DBUtils;

/**
 *
 * @author Yun
 */
public class HistoryDAO implements Serializable {

    List<HistoryDTO> listQuizHistory;

    public List<HistoryDTO> getListQuizHistory() {
        return listQuizHistory;
    }

    public boolean saveQuizStudentTake(String userEmail, String subjectID, double point, int num_of_correct_answer, Time time) throws NamingException, SQLException {

        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Insert into tbl_QuizHistory(userEmail,subjectID,point,num_of_correct_answer,time)"
                        + "values(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userEmail);
                stm.setString(2, subjectID);
                stm.setDouble(3, point);
                stm.setInt(4, num_of_correct_answer);
                stm.setTime(5, time);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } finally {
            if (stm != null) {
                stm.close();
            }

            if (conn != null) {
                conn.close();
            }
        }

        return false;

    }

    public void getQuizHistoryByEmail(String email) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select subjectID ,point,num_of_correct_answer,"
                        + "time from tbl_QuizHistory where userEmail = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();
                while (rs.next()) {
                    if (listQuizHistory == null) {
                        listQuizHistory = new ArrayList<>();
                    }
                    String subjectID = rs.getString("subjectID");
                    double point = rs.getDouble("point");
                    int answersCorrect = rs.getInt("num_of_correct_answer");
                    Time time = rs.getTime("time");
                    HistoryDTO dto = new HistoryDTO(email, subjectID, point, answersCorrect, time);
                    listQuizHistory.add(dto);

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void searchHistoryBySubject(String searchValue, String email) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select subjectID,point,num_of_correct_answer,"
                        + "time from tbl_QuizHistory where subjectID = ? and userEmail = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, searchValue);
                stm.setString(2, email);

                rs = stm.executeQuery();
                while (rs.next()) {
                    if (listQuizHistory == null) {
                        listQuizHistory = new ArrayList<>();
                    }
                    String subjectID = rs.getString("subjectID");
                    double point = rs.getDouble("point");
                    int answersCorrect = rs.getInt("num_of_correct_answer");
                    Time time = rs.getTime("time");
                    HistoryDTO dto = new HistoryDTO(email, subjectID, point, answersCorrect, time);
                    listQuizHistory.add(dto);

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
