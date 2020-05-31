/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.question;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import phuongntd.utils.DBUtils;
import phuongntd.utils.TimeCaculator;
import java.util.Calendar;

/**
 *
 * @author Yun
 */
public class QuestionDAO implements Serializable {

    Calendar calendar = Calendar.getInstance();

    List<QuestionDTO> listQuestion;

    public List<QuestionDTO> getListQuestion() {
        return listQuestion;
    }

    public boolean createQuestion(String subjectID, String questionID,
            String questionContent, String an1, String an2, String an3, String an4, String ansCorrect)
            throws SQLException, NamingException {

        Connection conn = null;
        PreparedStatement stm = null;
        Date date = (Date) TimeCaculator.getCurrentDate();

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Insert into tbl_Question(id,question_content,answer_1,answer_2,answer_3,answer_4,answer_correct,createDate,subjectID,status)"
                        + "values(?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, questionID);
                stm.setString(2, questionContent);
                stm.setString(3, an1);
                stm.setString(4, an2);
                stm.setString(5, an3);
                stm.setString(6, an4);
                stm.setString(7, ansCorrect);
                stm.setDate(8, date);
                stm.setString(9, subjectID);
                stm.setInt(10, 2);

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

    public void searchQuestionBySubject(String subjectID, int status, int pageIndex, int pageSize) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT id,question_content,answer_1,answer_2,"
                        + "answer_3,answer_4,answer_correct,createDate "
                        + "FROM tbl_Question WHERE "
                        + "subjectID = ? AND status = ? "
                        + "ORDER BY question_content "
                        + "OFFSET ? ROWS "
                        + "FETCH NEXT ? "
                        + "ROW ONLY";
                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                stm.setInt(2, status);
                stm.setInt(3, (pageIndex - 1) * pageSize);
                stm.setInt(4, pageSize);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (listQuestion == null) {
                        listQuestion = new ArrayList<>();
                    }
                    String id = rs.getString("id");
                    String questionContent = rs.getString("question_content");
                    String a1 = rs.getString("answer_1");
                    String a2 = rs.getString("answer_2");
                    String a3 = rs.getString("answer_3");
                    String a4 = rs.getString("answer_4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date createDate = rs.getDate("createDate");
                    QuestionDTO dto = new QuestionDTO(id, questionContent, a1, a2, a3, a4, answerCorrect, createDate, subjectID, status);
                    listQuestion.add(dto);

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

    public void searchQuestionByName(String searchValue, int status, int pageIndex, int pageSize) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT id,question_content,answer_1,answer_2,"
                        + "answer_3,answer_4,answer_correct,"
                        + "createDate,subjectID "
                        + "FROM tbl_Question WHERE "
                        + "question_content like ? AND status = ? "
                        + "ORDER BY question_content "
                        + "OFFSET ? ROWS "
                        + "FETCH NEXT ? "
                        + "ROW ONLY";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setInt(2, status);
                stm.setInt(3, (pageIndex - 1) * pageSize);
                stm.setInt(4, pageSize);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (listQuestion == null) {
                        listQuestion = new ArrayList<>();
                    }
                    String id = rs.getString("id");
                    String questionContent = rs.getString("question_content");
                    String a1 = rs.getString("answer_1");
                    String a2 = rs.getString("answer_2");
                    String a3 = rs.getString("answer_3");
                    String a4 = rs.getString("answer_4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date createDate = rs.getDate("createDate");
                    String subjectID = rs.getString("subjectID");

                    QuestionDTO dto = new QuestionDTO(id, questionContent, a1, a2, a3, a4, answerCorrect, createDate, subjectID, status);
                    listQuestion.add(dto);

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

    public boolean deleteQuestion(String pk) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Update tbl_Question set status = ? where id = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 3);
                stm.setString(2, pk);
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

    public void getRandomQuestions(int numberQuestion, String subjectID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP " + numberQuestion + " id,question_content,answer_1,answer_2,answer_3,answer_4,answer_correct,"
                        + "createDate "
                        + "FROM tbl_Question WHERE subjectID = ? and status = ? ORDER BY NEWID()";
                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                stm.setInt(2, 2);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (listQuestion == null) {
                        listQuestion = new ArrayList<>();
                    }
                    String id = rs.getString("id");
                    String questionContent = rs.getString("question_content");
                    String a1 = rs.getString("answer_1");

                    String a2 = rs.getString("answer_2");
                    String a3 = rs.getString("answer_3");
                    String a4 = rs.getString("answer_4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date createDate = rs.getDate("createDate");

                    QuestionDTO dto = new QuestionDTO(id, questionContent, a1, a2, a3, a4, answerCorrect, createDate, subjectID, 2);
                    listQuestion.add(dto);

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

    public boolean updateQuestion(String pk, String subjectID, String questionContent, String ans1, String ans2, String ans3, String ans4, String ansCorrect) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Update tbl_Question set subjectID = ? , "
                        + "question_content = ? , answer_1 = ? , "
                        + "answer_2 = ? , "
                        + "answer_3 = ? , "
                        + "answer_4 = ? , "
                        + "answer_correct = ? where id = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                stm.setString(2, questionContent);
                stm.setString(3, ans1);
                stm.setString(4, ans2);
                stm.setString(5, ans3);
                stm.setString(6, ans4);
                stm.setString(7, ansCorrect);
                stm.setString(8, pk);
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

    public String getQuestionCorrectByQuestionID(String questionID) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String result = "";
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select answer_correct from tbl_Question where id = ?";

                stm = conn.prepareStatement(sql);
                stm.setString(1, questionID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getString("answer_correct");

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
        return result;
    }

    public int countQuestionByQuestionName(String questionName, int status) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(id) FROM tbl_Question WHERE "
                        + "question_content like ? and status = ?";

                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + questionName + "%");
                stm.setInt(2, status);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);

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
        return 0;
    }

    public int countQuestionBySubjectID(String subjectID, int status) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(id) FROM tbl_Question WHERE "
                        + "subjectID = ? and status = ?";

                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                stm.setInt(2, status);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);

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
        return 0;
    }
}
