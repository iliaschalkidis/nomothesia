/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kiddo.grlegislation;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.avalon.framework.parameters.Parameters;
import org.apache.avalon.framework.thread.ThreadSafe;
import org.apache.cocoon.acting.Action;
import org.apache.cocoon.environment.ObjectModelHelper;
import org.apache.cocoon.environment.Redirector;
import org.apache.cocoon.environment.Request;
import org.apache.cocoon.environment.SourceResolver;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author kiddo
 */
public class UploadAction implements Action, ThreadSafe{
    
    String type, year, id;

    public Map act( Redirector redirector, SourceResolver resolver, Map objectModel, String source, Parameters params )
        throws Exception
    {  
        Request request = ObjectModelHelper.getRequest(objectModel);

        // get parameters
        this.type = request.getParameter("type");
        this.year= request.getParameter("year");
        this.id= request.getParameter("id");
        String title = request.getParameter("title");
        String feknumber = request.getParameter("feknumber");
        String fek = request.getParameter("fek");
        String date = request.getParameter("date");
        int max = Integer.parseInt(request.getParameter("max"));
        
        System.out.println("TEST1");
        
        ArrayList<String> articles = new ArrayList<String>();
        ArrayList<String> titles = new ArrayList<String>();
        
        for(int i= 1; i<=max; i++){
            articles.add(request.getParameter("article"+i));
            titles.add(request.getParameter("title"+i));

        }
        // Let's build the XML document
        StringBuilder xml = new StringBuilder();
        
        xml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        xml.append("<Legislation DocumentURI=\"http://localhost:8888/GRLegislation/").append(type).append("/").append(year).append("/").append(id).append("/\">\n");
        xml.append("<Metadata xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:dct=\"http://purl.org/dc/terms/\" xmlns:diavgeia=\"http://diavgeia.gov.gr/schema/model/diavgeia-decision-0.1\">\n");

        xml.append("<dc:identifier>").append("http://localhost:8888/GRLegislation/").append(type).append("/").append(year).append("/").append(id).append("</dc:identifier>\n");
        xml.append("<dc:title>").append(title).append("</dc:title>\n");
        xml.append("<dc:type>text</dc:type>\n");
        xml.append("<dc:format>text/xml</dc:format>\n");
        xml.append("<dc:language>gr</dc:language>\n");
        xml.append("<dc:created>").append(date).append("</dc:created>\n");
	xml.append("<diavgeia:fek>\n");
        xml.append("<issue>");
        if(fek.equals("a")){
            xml.append("ΤΕΥΧΟΣ Α'");
        }
        else if(fek.equals("b")){
            xml.append("ΤΕΥΧΟΣ Β'");
        }
        xml.append("</issue>");
        xml.append("<fekNumber>").append(feknumber).append("</fekNumber>");
        xml.append("<year>").append(year).append("</year>\n");
        xml.append("</diavgeia:fek>\n");

        xml.append("<decisionType>");
        if(this.type.equals("pd")){
            xml.append("ΠΡΟΕΔΡΙΚΟ ΔΙΑΤΑΓΜΑ (ΠΔ)");
        }
        else if(this.type.equals("law")){
            xml.append("ΝΟΜΟΣ");
        }
        xml.append("</decisionType>\n");
        xml.append("<Number>").append(id).append("</Number>\n");
        xml.append("<Year>").append(year).append("</Year>\n");
        
        xml.append("</Metadata>\n");
        xml.append("<Introduction>\n");
        xml.append("</Introduction>\n");
        xml.append("<Body DocumentURI=\"http://localhost:8888/GRLegislation/").append(type).append("/").append(year).append("/").append(id).append("/body\">\n");
        System.out.println("TEST2");
        
        for(int i=0; i< max; i++){
            xml.append("<Article DocumentURI=\"http://localhost:8888/GRLegislation/").append(type).append("/").append(year).append("/").append(id).append("/article/").append(i+1).append("\">\n");
            xml.append("<Number>").append(i+1).append("</Number>\n");
            xml.append("<Title>").append(titles.get(i)).append("</Title>\n");
            xml.append("<P DocumentURI=\"http://localhost:8888/GRLegislation/").append(type).append("/").append(year).append("/").append(id).append("/article/").append(i+1).append("/paragraph/").append(i+1).append("\">\n");
            xml.append("<Number>").append(i+1).append("</Number>\n");
            xml.append("<P2 DocumentURI=\"http://localhost:8888/GRLegislation/").append(type).append("/").append(year).append("/").append(id).append("/article/").append(i+1).append("/paragraph/").append(i).append("/passage/").append(i+1).append("\">\n");
            xml.append("<Number>").append(i+1).append("</Number>\n");
            xml.append("<Text>").append(articles.get(i)).append("</Text>\n");
            xml.append("</P2>\n");
            xml.append("</P>\n");
            xml.append("</Article>\n");
        }
        // ... and we end the XML string
        xml.append("</Body>\n");
        xml.append("</Legislation>\n");
        
        System.out.println("XML FILE");
        System.out.println("===============================");
        System.out.println(xml);
        
        // save XML file to filesystem
        File file = new File("src/main/resources/COB-INF/"+type.toUpperCase()+year+id+".xml");
        FileUtils.writeStringToFile(file,xml.toString());
        Map sitemapParams = new HashMap();
                
        return sitemapParams;
            
    }
}
