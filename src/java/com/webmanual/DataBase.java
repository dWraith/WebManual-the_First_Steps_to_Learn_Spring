package com.webmanual;

import com.webmanual.entity.Page;
import com.webmanual.entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;



public class DataBase {
    public static void inputUserDateBase(String name, String lastName, String group, 
            String email, String password) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/WebManual", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO `webmanual`.`users` (`first_name`,`last_name`,`group`,`email`,`password`)"
                    + " VALUES ('" + name + "','" + lastName + "','" + group + "','" + email + "','" + password + "');");
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException exc) {
            System.out.println(exc.getMessage());
        }
        finally {
            try {
                if(conn!=null) conn.close();
                if(statement!=null) statement.close();
                if(result!=null) result.close();
            } catch (SQLException exc) {}
        }
    
    }
    
    public static boolean isExist(String email, String password) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        
        boolean flag = false;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/WebManual", "root", "root");
            statement = conn.createStatement();
            result = statement.executeQuery("select * from webmanual.users where `email` ='" + email + "' and `password` = '" + password + "';");
            if(result.next()) flag = true;
            System.out.println(flag);
        } catch (SQLException | ClassNotFoundException exc) {
                System.out.println(exc.getMessage());
        }
        finally {
            try {
                if(conn!=null) conn.close();
                if(statement!=null) statement.close();
                if(result!=null) result.close();
            } catch (SQLException exc) {}
        }
        return flag;
    }
    
    public static Page getPage
        (String name) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
                
        Page page = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/WebManual", "root", "root");
            statement = conn.createStatement();
            result = statement.executeQuery("select * from webmanual.page where `name` ='" + name + "';");
//            while(result.next()) page = new Page(name, result.getString("htmlcode"));
        } catch (SQLException | ClassNotFoundException exc) {
                System.out.println(exc.getMessage());
        }
        finally {
            try {
                if(conn!=null) conn.close();
                if(statement!=null) statement.close();
                if(result!=null) result.close();
            } catch (SQLException exc) {}
        }
        
        return page;
    }
    
    public static User getUser(String email) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
                
        User user = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/WebManual", "root", "root");
            statement = conn.createStatement();
            result = statement.executeQuery("select * from webmanual.users where `email` ='" + email + "';");
//            while(result.next()) user = new User(result.getString("first_name"), result.getString("last_name"), result.getString("group"), email);
        } catch (SQLException | ClassNotFoundException exc) {
                System.out.println(exc.getMessage());
        }
        finally {
            try {
                if(conn!=null) conn.close();
                if(statement!=null) statement.close();
                if(result!=null) result.close();
            } catch (SQLException exc) {}
        }
        
        return user;
    }
}
