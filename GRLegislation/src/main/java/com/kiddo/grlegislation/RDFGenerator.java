/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddo.grlegislation;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.avalon.framework.parameters.ParameterException;
import org.apache.avalon.framework.parameters.Parameters;
import org.apache.cocoon.ProcessingException;
import org.apache.cocoon.environment.ObjectModelHelper;
import org.apache.cocoon.environment.Request;
import org.apache.cocoon.environment.SourceResolver;
import org.apache.cocoon.generation.AbstractGenerator;

// OPENRDF
import org.openrdf.repository.Repository;
import org.openrdf.repository.http.HTTPRepository;
import org.openrdf.OpenRDFException;
import org.openrdf.repository.RepositoryConnection;
import org.openrdf.query.QueryLanguage;
import org.openrdf.repository.RepositoryException;
import org.openrdf.rio.rdfxml.RDFXMLWriter;
import org.openrdf.rio.RDFFormat;
import org.openrdf.rio.RDFWriter;
import org.openrdf.rio.Rio;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;


public class RDFGenerator extends AbstractGenerator{
    
    String type, year, id,yy,mm,dd,baseuri;

    @Override
    public void setup(SourceResolver resolver, Map objectModel, String src, Parameters params) throws ProcessingException, SAXException, IOException {
        try {
            super.setup(resolver, objectModel, src, params);
            // get parameters
            this.type = params.getParameter("type");
            this.year= params.getParameter("year");
            this.id= params.getParameter("id");
//            this.yy= params.getParameter("yy");
//            this.mm= params.getParameter("mm");
//            this.dd= params.getParameter("dd");
        } catch (ParameterException ex) {
            Logger.getLogger(RDFGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void generate() throws IOException, SAXException, ProcessingException {
        
        // get request object
        Request request = ObjectModelHelper.getRequest(objectModel);
        
        
        String legFile = this.type + "/" + this.year + "/" + this.id; 
        
        String date = this.yy+"-"+this.mm+"-"+this.dd;

        Properties prop = new Properties();
	FileInputStream input = null;
       
        // connect Sesame triplestore
        String sesameServer = null ;
        String repositoryID = null ;
 
	try {
                String tomcatPath = System.getProperty("catalina.base");
      String propertiesFilePath = tomcatPath + "/webapps/nomothesia-1.0.0/WEB-INF/";

      String filePath = propertiesFilePath+"properties.properties";
 
		input = new FileInputStream(filePath);
 
		// load properties file
		prop.load(input);
 
		// get the properties values
		sesameServer = prop.getProperty("SesameServer");
		repositoryID = prop.getProperty("SesameRepositoryID"); 
                this.baseuri = prop.getProperty("BaseURI"); 
	} catch (IOException io) {
		io.printStackTrace();
	} finally {
		if (input != null) {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
 
	}

        Repository repo = new HTTPRepository(sesameServer, repositoryID);
        try {
            repo.initialize();
        } catch (RepositoryException ex) {
            Logger.getLogger(RDFGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(date);
        
        String result;
        
        // SPARQL  query
        if(this.yy == null){
           result = query(repo, this.type+"/"+this.year+"/"+this.id,null);
        }
        else{
           result = query(repo, this.type+"/"+this.year+"/"+this.id,date);
        }
        // Let's build the XML document
        StringBuilder xml = new StringBuilder();
        xml.append(result);
        //System.out.println("RDF DATA FILE");
        //System.out.println("=============================");
        //System.out.println(xml);
        
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
    
    private String  query(Repository repo,String file,String date){
        ArrayList mods = new ArrayList();
        ModificationBean modification;
        String result = new String();
        ByteArrayOutputStream out2 = new ByteArrayOutputStream();
         try {
          // connect
          RepositoryConnection con = repo.getConnection();
           
          // create SPARQL query
          String queryString = "DESCRIBE <"+ this.baseuri +file +">";
          if(date!=null){
              queryString += " ?work2 dct:created ?date . FILTER ( ?date < \""+ date +  "\"^^xsd:date).";
          }                     
                //System.out.println(queryString);

          try {
              // use SPARQL query
               RDFWriter writer = Rio.createWriter(RDFFormat.RDFXML,out2);
                con.prepareGraphQuery(QueryLanguage.SPARQL,queryString).evaluate(writer); 
                out2.writeTo(System.out);
                result = out2.toString();
          }
          finally {
              return result;
          }
           
        }
        catch (OpenRDFException e) {
           // handle exception
        }
        return null;
    }
}