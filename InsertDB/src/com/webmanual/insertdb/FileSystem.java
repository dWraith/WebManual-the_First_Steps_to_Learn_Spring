/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webmanual.insertdb;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class FileSystem {

    public static void insertAll() throws IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<File> listFile = getAllFiles();
        HtmlFile htmlFile;
        Page page;
        for(File file : listFile) {
            try {
                session.beginTransaction();
                htmlFile = new HtmlFile(file, "UTF-8");
                System.out.println(file.getName());
                page = htmlFile.getPage();
                session.save(page);
                session.getTransaction().commit();
            }
            catch(Exception exc) {
                exc.printStackTrace();
                session.getTransaction().rollback(); 
                break;
            }
        }
        session.close();
    }
    
    public static void createFile() {
        File layout = new File("files/create/layout/css.html");
        try {
            Document doc = Jsoup.parse(layout, "UTF-8");
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Page> listPages;
            session.beginTransaction();
            listPages = session.createQuery("from Page where idLanguage=2").list();
            session.getTransaction().commit();
            session.close();
            PrintWriter writer;
            for(Page page : listPages) {
                File file = new File("files/create/css/" + page.getName() + ".html");
                doc.select("div#content").html(page.getContent());
                writer = new PrintWriter(file,"UTF-8");
                writer.print(doc.html());
                writer.close();
            }
        } catch (IOException ex) {
            Logger.getLogger(FileSystem.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static List<String> getAllItem() {
        File listF[] = new File("files/").listFiles();
        List<String> listItems = new ArrayList();
        for(File file : listF) {
            listItems.add(file.getName().replaceFirst("[.][^.]+$", ""));
        }
        return listItems;
    }
    
    public static List<File> getAllFiles() {
        return Arrays.asList(new File("files/php/insert").listFiles());
    }
}
