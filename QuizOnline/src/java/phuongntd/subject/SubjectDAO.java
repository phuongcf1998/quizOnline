/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.subject;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import phuongntd.utils.DBUtils;

/**
 *
 * @author Yun
 */
public class SubjectDAO implements Serializable {

    public int getQuizTimeOfSubject(String subjectID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select quizTime from tbl_Subject where subjectID = ?";

                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("quizTime");

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

     public int getNumberQuestionOfSubject(String subjectID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select numberQuestion from tbl_Subject where subjectID = ?";

                stm = conn.prepareStatement(sql);
                stm.setString(1, subjectID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("numberQuestion");

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
     public List getAllSubject() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<String> result = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Select subjectID from tbl_Subject";

                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    result.add(rs.getString("subjectID"));

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
}
