/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddo.grlegislation;

import static com.kiddo.grlegislation.SearchGenerator.process;
import static com.kiddo.grlegislation.SearchGenerator.xquery;
import java.io.FileInputStream;
import java.io.IOException;
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
import org.basex.query.QueryException;

// OPENRDF
import org.openrdf.repository.Repository;
import org.openrdf.repository.http.HTTPRepository;
import org.openrdf.OpenRDFException;
import org.openrdf.model.Value;
import org.openrdf.repository.RepositoryConnection;
import org.openrdf.query.TupleQuery;
import org.openrdf.query.TupleQueryResult;
import org.openrdf.query.BindingSet;
import org.openrdf.query.QueryLanguage;
import org.openrdf.repository.RepositoryException;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;


public class VersionGenerator extends AbstractGenerator{
    
    String type, year, id,yy,mm,dd,baseuri;

    @Override
    public void setup(SourceResolver resolver, Map objectModel, String src, Parameters params) throws ProcessingException, SAXException, IOException {
        try {
            super.setup(resolver, objectModel, src, params);
            // you can read input parameters in here:
            this.type = params.getParameter("type");
            this.year= params.getParameter("year");
            this.id= params.getParameter("id");
            this.yy= params.getParameter("yy");
            this.mm= params.getParameter("mm");
            this.dd= params.getParameter("dd");
        } catch (ParameterException ex) {
            Logger.getLogger(VersionGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void generate() throws IOException, SAXException, ProcessingException {
        
        // get parameters
        Request request = ObjectModelHelper.getRequest(objectModel);
        
        
        String legFile = this.type + "/" + this.year + "/" + this.id; 
        
        String date = this.yy+"-"+this.mm+"-"+this.dd;

        Properties prop = new Properties();
	FileInputStream input = null;
       
        // connect triplestore
        String sesameServer = null ;
        String repositoryID = null ;
                String tomcatPath = System.getProperty("catalina.base");
                String propertiesFilePath = tomcatPath + "/webapps/nomothesia-1.0.0/WEB-INF/";
	try {
                

                 String filePath = propertiesFilePath+"properties.properties";
		input = new FileInputStream(filePath);
 
		// load properties file
		prop.load(input);
 
		// get the properties value
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
        // connect to Sesame
        Repository repo = new HTTPRepository(sesameServer, repositoryID);
        try {
            repo.initialize();
        } catch (RepositoryException ex) {
            Logger.getLogger(VersionGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(date);
        
        ArrayList<ModificationBean> mods;
        // sparql query
        if(this.yy == null){
           mods = query(repo, this.type+"/"+this.year+"/"+this.id,null);
        }
        else{
           mods = query(repo, this.type+"/"+this.year+"/"+this.id,date);
        }
       
        // Let's build the XML document
        StringBuilder xml = new StringBuilder();
        xml.append("<modifications>");
        String res = "";
        // Iterate through the array list...
        for (int i=0; i< mods.size(); i++) {
                String query = "for $x in doc('"
                        + propertiesFilePath 
                        + mods.get(i).getSourceFilename()+"')//Modification "
                        +"where $x/@DocumentURI = '"+ mods.get(i).getModURI()+"' "
                        +" return $x/*";
                xquery(query);
            try {
                xml.append(process(query));
            } catch (QueryException ex) {
                Logger.getLogger(VersionGenerator.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        // ... and we end the XML string
        xml.append("</modifications>");

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
    
    private ArrayList  query(Repository repo,String file,String date){
        ArrayList mods = new ArrayList();
        ModificationBean modification;
        TupleQueryResult result;
         try {
           RepositoryConnection con = repo.getConnection();
           try {
                  // build the query
                  String queryString = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n" +
                                       "PREFIX owl: <http://www.w3.org/2002/07/owl#>\n" +
                                       "PREFIX dct:<http://purl.org/dc/terms/>" +
                                       "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\n" +
                                       "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
                                       "PREFIX metalex: <http://www.metalex.eu/metalex/2008-05-02#>\n" +
                                       "SELECT ?modification ?work2 ?version ?date\n" +
                                       "	WHERE { ?version metalex:matterOf ?modification . ?work2  metalex:legislativeCompetenceGroundOf ?modification . ?work2 metalex:result ?version . ?version metalex:realizes  <"+ this.baseuri +file +">.";
                  if(date!=null){
                      //System.out.println("DATE");
                      queryString += " ?work2 dct:created ?date . FILTER ( ?date < \""+ date +  "\"^^xsd:date).";
                  }                     
                  queryString += " }\n	ORDER BY ?modification";
                  TupleQuery tupleQuery = con.prepareTupleQuery(QueryLanguage.SPARQL, queryString);

                  // query and return tuples of results
                  result = tupleQuery.evaluate();
                  try {
                                //System.out.println("MODIFICATIONS RESULTS");
                                //System.out.println("=============================");
                                BindingSet bindingSet = result.next();
                                while(bindingSet != null){
                                    Value valueOfX = bindingSet.getValue("modification");
                                    String mod = valueOfX.toString();
                                    mod = mod.substring(mod.lastIndexOf("#")+1);
                                    modification = new ModificationBean();
                                    modification.setModURI(mod);
                                    //System.out.println("Modification: " + modification.getModURI());
                                    Value valueOfY = bindingSet.getValue("version");
                                    String ver = valueOfY.toString();
                                    ver = ver.substring(ver.lastIndexOf("#")+1);
                                    Value valueOfZ = bindingSet.getValue("work2");
                                    String src = valueOfZ.toString();
                                    src = src.substring(src.lastIndexOf("#")+1);
                                    modification.setSourceURI(src);
                                    modification.createSourceFilename(src);
                                    //System.out.println("Version: " + ver);
                                    //System.out.println("SourceFilename:" + modification.getSourceFilename());
                                    mods.add(modification);
                                    bindingSet = result.next();
                                }
                                // do something interesting with the values here...
                  }
                  finally {
                      result.close();
                  }
           }
           finally {
              con.close();
              return mods;
           }
        }
        catch (OpenRDFException e) {
           // handle exception
        }
        return null;
    }
}