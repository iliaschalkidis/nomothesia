/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddo.grlegislation;

/**
 *
 * @author kiddo
 */
public class ModificationBean {
    
    private String modURI;
    private String sourceURI;
    private String sourceFilename;
    private String type;
    
    
    
    public void createSourceFilename(String uri){
        
        String[] strs = uri.split("GRLegislation/");
        String[] strs2 = strs[1].split("/");
        
        int id = Integer.parseInt(strs2[2]);
        
        
        
        sourceFilename = strs2[0].toUpperCase() + strs2[1] + strs2[2] + ".xml";
        
        
    };
        
    public void setModURI(String uri){
        this.modURI = "http://localhost:8888/" + uri;
    };
    
     public void setSourceURI(String uri){
        this.sourceURI = uri;
    };
    
    public void setType(String type){
        this.type = type;
    };
   
    public String getModURI(){
        return this.modURI;
    };
    
    public String getSourceURI(){
        return this.sourceURI;
    };
    
    public String getType(){
        return this.type;
    };
    
    public String getSourceFilename(){
        return this.sourceFilename;
    };
    
}
