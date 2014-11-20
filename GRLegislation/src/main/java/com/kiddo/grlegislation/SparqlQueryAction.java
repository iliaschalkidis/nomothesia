/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddo.grlegislation;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Properties;
import org.apache.avalon.framework.parameters.Parameters;
import org.apache.avalon.framework.thread.ThreadSafe;
import org.apache.cocoon.environment.Redirector;
import org.apache.cocoon.acting.Action;
import org.apache.cocoon.environment.SourceResolver;

// OPENRDF
import org.openrdf.repository.Repository;
import org.openrdf.repository.http.HTTPRepository;
import org.openrdf.OpenRDFException;
import org.openrdf.repository.RepositoryConnection;
import org.openrdf.query.TupleQuery;
import org.openrdf.query.TupleQueryResult;
import org.openrdf.query.QueryLanguage;


public class SparqlQueryAction implements Action, ThreadSafe{
    


    public Map act( Redirector redirector, SourceResolver resolver, Map objectModel, String source, Parameters params )
        throws Exception
    {  
        
        // connect triplestore
                
        Properties prop = new Properties();
	FileInputStream input = null;

        String sesameServer = null ;
        String repositoryID = null ;
 
	try {
 
		input = new FileInputStream("src/main/resources/COB-INF/properties.properties");
 
		// load properties file
		prop.load(input);
 
		// get the properties values
		sesameServer = prop.getProperty("SesameServer");
		prop.getProperty("SesameRepositoryID"); 
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
        repo.initialize();
        String querytext = params.getParameter("text");
        
        //System.out.println("QUERY");
        //System.out.println("==========================");
        //System.out.println(querytext);
        // sparql query
       // query(repo,querytext);
        
       
        //request.setAttribute("mods2", mods);
        Map sitemapParams = new HashMap();
                
        return sitemapParams;
            
    }
    
    private ArrayList  query(Repository repo, String query){
        ArrayList mods = new ArrayList();
        ModificationBean modification;
        TupleQueryResult result;
         try {
           RepositoryConnection con = repo.getConnection();
           try {
                  String queryString = query;
                  TupleQuery tupleQuery = con.prepareTupleQuery(QueryLanguage.SPARQL, queryString);
                  result = tupleQuery.evaluate();

                  //System.out.println(result.toString());
                 
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