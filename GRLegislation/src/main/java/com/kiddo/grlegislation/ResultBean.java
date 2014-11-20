/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kiddo.grlegislation;

/**
 *
 * @author kiddo
 */
public class ResultBean {
    
    private String id;
    private String title;
    private String sourceFilename;
    private String type;
    private String legType;
    private String date;
    private String number;
    private String year;
        
    public void setId(String i){
        this.id = i;
    };
    
     public void setTitle(String t){
        this.title = t;
    };
     
    public void setDate(String d){
        this.date = d;
    };
    
    public void setType(String t){
        this.type = t;
    };
   
    public void setNumber(String t){
        this.number = t;
    };
    
    public void setYear(String t){
        this.year = t;
    };
    
    public void setLegtype(String t){
        this.legType = t;
    };
    
    public String getId(){
        return this.id;
    };
    
    public String getTitle(){
        return this.title;
    };
    
    public String getDate(){
        return this.date;
    };
    
    public String getType(){
        return this.type;
    };
    
    public String getLegtype(){
        return this.legType;
    };
    
    public String getYear(){
        return this.year;
    };
    
    public String getNumber(){
        return this.number;
    };

    
}
