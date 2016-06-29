package com.webmanual.insertdb;

import java.io.File;
import java.io.IOException;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class HtmlFile {
    
    File htmlFile;
    Document doc;
    List<String> listNames; 
    
    public HtmlFile(File file, String encode) throws IOException {
        this.htmlFile = file;
        doc = Jsoup.parse(htmlFile, encode);
        listNames = FileSystem.getAllItem();
    }
    
    public Elements getByDiv(String cssQuery) {
        return doc.select(cssQuery);
    }
    
    public void changeIntoDiv() {     
        String title = doc.select("div.title").get(0).html();
        doc.select("div.title").remove();
        String content = doc.html();
        doc.html("");
        doc.html("<div class = \"title\">" + title + "</div> <div class = \"page_content\">" + content + "</div>" );
        doc.html(doc.html()+"<h1>Попробовать:</h1> \n" +
" <div id=\"tryitform\"> \n" +
"  <div class=\"tryform_content\"> \n" +
"   <div class=\"lngpane\"> \n" +
"    <textarea></textarea> \n" +
"    <div class=\"labelforpane\">\n" +
"      HTML \n" +
"    </div> \n" +
"   </div> \n" +
"   <div class=\"lngpane\" style=\"margin-left:10px\"> \n" +
"    <textarea></textarea> \n" +
"    <div class=\"labelforpane\">\n" +
"      CSS \n" +
"    </div> \n" +
"   </div> \n" +
"   <button onclick=\"check()\">Проверить</button> \n" +
"   <div class=\"resultpane\"> \n" +
"    <div id=\"resultpane_content\"></div> \n" +
"    <div class=\"labelforpane\">\n" +
"      РЕЗУЛЬТАТ \n" +
"    </div> \n" +
"   </div> \n" +
"  </div> \n" +
" </div>  ");
    }   
    
    public void addLinks() {
        String textWithLinks;
        Elements elements = getByDiv("div.text");
        for(Element element : elements) {
            textWithLinks = element.text();
            for(String name : listNames) {
                textWithLinks = textWithLinks.replaceAll("(?<!-)"+name+"(?!-)", "<a href=\""+name+".html\">"+name+"</a>");
            }
            element.html(textWithLinks.replaceAll("Поддерживается", "<br>Поддерживается"));
        }
    }
    
    public String getTitle() {
        return doc.select("div.title").get(0).text();
    }
    
    public String getDescription() {
        return doc.select("div.text").get(0).text().replaceFirst(" [А-ЯЁ].*", "");
    }
    
    public Page getPage() {
        Page page = new Page();
        changeIntoDiv();
        page.setIdLanguage(1);
        addLinks();
        page.setName(getTitle());
        page.setIdTocText(2);
        page.setContent(doc.html().replaceAll("<body>", "").replaceAll("</body>", "").replaceAll("<head>", "").replaceAll("</head>", "").replaceAll("<html>", "").replaceAll("</html>", ""));
        return page;
    }
}
