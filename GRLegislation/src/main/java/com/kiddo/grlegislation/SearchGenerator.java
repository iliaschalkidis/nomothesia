/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddo.grlegislation;

import org.apache.cocoon.generation.AbstractGenerator;
import java.io.IOException;
import java.io.StringReader;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.apache.avalon.framework.parameters.Parameters;
import org.apache.cocoon.ProcessingException;
import static org.apache.cocoon.callstack.environment.CallFrameHelper.getContext;
import org.apache.cocoon.environment.ObjectModelHelper;
import org.apache.cocoon.environment.Request;
import org.apache.cocoon.environment.SourceResolver;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;
import org.apache.xerces.parsers.DOMParser;
import org.basex.core.BaseXException;
import org.basex.core.Context;
import org.basex.core.cmd.CreateDB;
import org.basex.core.cmd.DropDB;
import org.basex.core.cmd.Set;
import org.basex.core.cmd.XQuery;
import org.basex.data.Result;
import org.basex.io.serial.Serializer;
import org.basex.query.QueryException;
import org.basex.query.QueryProcessor;
import org.basex.query.iter.Iter;
import org.basex.query.value.item.Item;
import org.xml.sax.SAXException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class SearchGenerator extends AbstractGenerator{

    static Context context = new Context();
    Request request;

  @Override
  public void setup(SourceResolver resolver, Map objectModel, String src, Parameters params) 
  throws ProcessingException, SAXException, IOException {
        super.setup(resolver, objectModel, src, params);
        // get Request object
        this.request = ObjectModelHelper.getRequest(objectModel);

    }

  public void generate() throws IOException, SAXException, ProcessingException {
               
        // Get parameters
        String keywords = request.getParameter("keywords");
        String type= request.getParameter("type");
        String id= request.getParameter("id");
        String year= request.getParameter("year");
        String date = request.getParameter("date");
        int flag = 0;
        
        // Print parameters
        
        //System.out.println("Keywords:"+ keywords);
        //System.out.println("Type:"+ type);
        //System.out.println("Id:"+ id);
        //System.out.println("Year:"+ year);
        ArrayList<ResultBean> results = null;


        // Set BaseX Connection & DB
        
      try{
          
      String tomcatPath = System.getProperty("catalina.base");
      String propertiesFilePath = tomcatPath + "/webapps/nomothesia-1.0.0/WEB-INF/";

      String filePath = propertiesFilePath+"legislation/";
      //System.out.println("=======================================");
      //System.out.println("=======================================");
      //System.out.println("Current relative path is: " + propertiesFilePath);
      //System.out.println("=======================================");
      //System.out.println("=======================================");
      
      new Set("CREATEFILTER", "*.xml").execute(context);
      new CreateDB("Legislation", filePath).execute(context);
      

        // Set Xquery
       String query ="declare namespace dc =\"http://purl.org/dc/elements/1.1/\";"
       + "for $doc in collection('Legislation') "
               + "for $x in $doc ";
       
       
       
       if((!"".equals(keywords)) || (!"-".equals(type)) || (!"-".equals(year)) ||(!"".equals(id)) ||(!"".equals(date))){
            query += "where ";
       }
       // Add  criterias (parameters) in 'where' clause
       if (!"".equals(keywords)){
           flag = 1;
           String[] words = keywords.split(",");
            query += "$x//dc:title[text() contains text {";
            for(int i=0; i< words.length; i++){
                if (i>0){
                    query += ",";
                }
                query += "'"+words[i]+"'";
            }
                    
            query +=  "} all using stemming using language 'Greek']  ";
       }
       if (!"-".equals(type)){
           if(flag == 1){
               query += " and ";
           }
           else{
               flag = 1;
           }
           if(type.equals("pd")){
            query += "$x//decisionType = 'ΠΔ (ΠΡΟΕΔΡΙΚΟ ΔΙΑΤΑΓΜΑ)'  \n";
           }
           else if (type.equals("md")){
               query += "$x//decisionType = 'ΚΥΑ (ΚΟΙΝΗ ΥΠΟΥΡΓΙΚΗ ΑΠΟΦΑΣΗ)'  \n";
           }
           else if (type.equals("law")){
               query += "$x//decisionType = 'ΝΟΜΟΣ'  \n";
           }
           else{
               query += "$x//decisionType = 'ΑΚΥΡΟ'  \n";
           }
       }
       if (!"-".equals(year)){
           if(flag == 1){
               query += " and ";
           }
           else{
               flag = 1;
           }
           query += "$x//Year = '"+ year +"'  \n";
       }
       if (!"".equals(id)){
           if(flag == 1){
               query += " and ";
           }
           else{
               flag = 1;
           }
           query += "$x//Number = '" + id +"'  \n";
       }
       
       if (!"".equals(date)){
           if(flag == 1){
               query += " and ";
           }
           else{
               flag = 1;
           }
           query += "$x//dc:created = '" + date +"'  \n";
       }
       
       query += "return <Result>{ $x/Legislation/Metadata/(decisionType,Number,Year,Type,dc:title,dc:identifier,dc:created) }</Result>";
        
       // Print Xquery
       
        //System.out.println("QUERY:" + query);
        // ------------------------------------------------------------------------
        // Process the query by using the database command
        //System.out.println("\n* Use the database command:");

        xquery(query);

        // ------------------------------------------------------------------------
        // Directly use the query processor:
        //System.out.println("\n* Use the query processor:");

        String res = process(query);
        
        res = "<Results>"+ res + "</Results>";
        
        //System.out.println(res);
        
        results = new ArrayList<ResultBean>();
        
        // Parse Xquery's resulted XML & Gather the elements into a List
        
        DOMParser parser = new DOMParser();
        try {
            parser.parse(new InputSource(new java.io.StringReader(res)));
            Document doc = parser.getDocument();
            NodeList nl = doc.getElementsByTagName("Result");
                    if(nl != null && nl.getLength() > 0) {
                            for(int i = 0 ; i < nl.getLength();i++) {

                                    //get the element
                                    Element el = (Element)nl.item(i);

                                    //get the object
                                    ResultBean s = getResult(el);

                                    //add it to list
                                    results.add(s);
                            }
                    }

                    for(int i=0; i< results.size(); i++){
                        //System.out.println("================================");
                        //System.out.println("Result "+ i);
                        //System.out.println("Id: "+ results.get(i).getId());
                        //System.out.println("Title: "+ results.get(i).getTitle());
                        //System.out.println("================================");
                    }

        } catch (SAXException e) {
            // handle SAXException 
        } catch (IOException e) {
            // handle IOException 
        }  
           
      }
      catch (QueryException ex) {
            Logger.getLogger(SearchGenerator.class.getName()).log(Level.SEVERE, null, ex);
      }      
      finally{
          new DropDB("Legislation").execute(context);
      }
   
      // Let's build the XML document
      
        StringBuilder xml = new StringBuilder();
        xml.append("<results>");

        // Iterate through the array list...
        for (int i=0; i< results.size(); i++) {
            xml.append("<result>");
            xml.append("<id>").append(results.get(i).getId()).append("</id>");
            xml.append("<title>").append(results.get(i).getTitle()).append("</title>");
            xml.append("<date>").append(results.get(i).getDate()).append("</date>");
            xml.append("<type>").append(results.get(i).getType()).append("</type>");
            xml.append("<year>").append(results.get(i).getYear()).append("</year>");
            xml.append("<number>").append(results.get(i).getNumber()).append("</number>");
            xml.append("<legtype>").append(results.get(i).getLegtype()).append("</legtype>");

            xml.append("</result>");
        }

        // ... and we end the XML string
        xml.append("</results>");

        // Return the XML to Cocoon's pipeline
        XMLReader xmlreader = XMLReaderFactory.createXMLReader();
        xmlreader.setContentHandler(super.xmlConsumer);
        InputSource source2 = new InputSource(new StringReader(xml.toString()));
        xmlreader.parse(source2);
        try {
            this.finalize();
        } catch (Throwable e) {
        }
        
            
    }
    
  static void xquery(final String query) throws BaseXException, IOException {
     new XQuery(query).execute(context);
  }

  
  
  /**
   * This method uses the {@link QueryProcessor} to evaluate a query.
   * The resulting items are passed on to an {@link XMLSerializer} instance.
   * @param query query to be evaluated
   * @throws QueryException if an error occurs while evaluating the query
   */
  static String process(final String query) throws QueryException {
    // ------------------------------------------------------------------------
    // Create a query processor
    QueryProcessor proc = new QueryProcessor(query, context);

    // ------------------------------------------------------------------------
    // Execute the query
    Result result = proc.execute();
    
 
    // ------------------------------------------------------------------------
    // Print result as string.
    //System.out.println(result.toString());

    // ------------------------------------------------------------------------
    // Close the query processor
    proc.close();
    
    return result.toString();
  }

  /**
   * This method uses the {@link QueryProcessor} to evaluate a query.
   * The results are iterated one by one and converted to their Java
   * representation, using {{@link Item#toJava()}. This variant is especially
   * efficient if large result sets are expected.
   * @param query query to be evaluated
   * @throws QueryException if an error occurs while evaluating the query
   */
  static void iterate(final String query) throws QueryException {
    // ------------------------------------------------------------------------
    // Create a query processor
    QueryProcessor proc = new QueryProcessor(query, context);

    // ------------------------------------------------------------------------
    // Store the pointer to the result in an iterator:
    Iter iter = proc.iter();

    // ------------------------------------------------------------------------
    // Iterate through all items and serialize
    for(Item item; (item = iter.next()) != null;) {
      Object o = item.toJava();
      //System.out.println(o.toString());
    }

    // ------------------------------------------------------------------------
    // Close the query processor
    proc.close();
  }

  /**
   * This method uses the {@link QueryProcessor} to evaluate a query.
   * The results are iterated one by one and passed on to an
   * {@link XMLSerializer} instance. This variant is especially
   * efficient if large result sets are expected.
   * @param query query to be evaluated
   * @throws QueryException if an error occurs while evaluating the query
   * @throws IOException if an error occurs while serializing the results
   */
  static void serialize(final String query) throws QueryException, IOException {
    // ------------------------------------------------------------------------
    // Create a query processor
    QueryProcessor proc = new QueryProcessor(query, context);

    // ------------------------------------------------------------------------
    // Store the pointer to the result in an iterator:
    Iter iter = proc.iter();

    // ------------------------------------------------------------------------
    // Create a serializer instance
    Serializer ser = proc.getSerializer(System.out);

    // ------------------------------------------------------------------------
    // Iterate through all items and serialize contents
    for(Item item; (item = iter.next()) != null;) {
      ser.serialize(item);
    }

    // ------------------------------------------------------------------------
    // Close the serializer
    ser.close();
    //System.out.println();

    // ------------------------------------------------------------------------
    // Close the query processor
    proc.close();
  }

  
  private ResultBean getResult(Element El) {

		//for each <ResultBean> element get text or int values
		String id = getTextValue(El,"dc:identifier");
		String title = getTextValue(El,"dc:title");
                String date = getTextValue(El,"dc:created");
                String legtype = getTextValue(El,"Type");
                String type = getTextValue(El,"decisionType");
                String number = getTextValue(El,"Number");
                String year = getTextValue(El,"Year");
		
                //Create a new Result with the value read from the xml nodes
		ResultBean s= new ResultBean();
                
                s.setId(id);
                s.setTitle(title);
                s.setDate(date);
                s.setType(type);
                s.setNumber(number);
                s.setYear(year);
                s.setLegtype(legtype);

		return s;
	}

	private String getTextValue(Element ele, String tagName) {
		String textVal = null;
		NodeList nl = ele.getElementsByTagName(tagName);
		if(nl != null && nl.getLength() > 0) {
			Element el = (Element)nl.item(0);
			textVal = el.getFirstChild().getNodeValue();
		}

		return textVal;
	}

	private int getIntValue(Element ele, String tagName) {
		//in production application you would catch the exception
		return Integer.parseInt(getTextValue(ele,tagName));
	}
    
}
