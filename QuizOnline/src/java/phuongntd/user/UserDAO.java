/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuongntd.user;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import phuongntd.utils.DBUtils;
import phuongntd.utils.HashPassword;

/**
 *
 * @author Yun
 */
public class UserDAO implements Serializable {

    public UserDTO checkLogin(String username, String password) throws SQLException, NamingException, NoSuchAlgorithmException {
        UserDTO user = null;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.makeConnection();
            String hashPassword = HashPassword.sha256(password);

            if (conn != null) {
                String sql = "Select email , name , password , role , status from tbl_User where email = ? and password = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, hashPassword);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    int role = rs.getInt("role");
                    int status = rs.getInt("status");
                    user = new UserDTO(email, name, password, role, status);

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

        return user;

    }

    public boolean createNewUser(String email, String name, String password)
            throws SQLException, NamingException, NoSuchAlgorithmException {

        Connection conn = null;
        PreparedStatement stm = null;

        String passwordHash = HashPassword.sha256(password);

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "Insert into tbl_User(email,name,password,role,status)"
                        + "values(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, name);
                stm.setString(3, passwordHash);
                stm.setInt(4, 2);
                stm.setInt(5, 1);

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
}
