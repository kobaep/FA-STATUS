// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.FaRequest;
import com.foamtec.qa.domain.TypeOfRequest;

privileged aspect TypeOfRequest_Roo_JavaBean {
    
    public String TypeOfRequest.getName() {
        return this.name;
    }
    
    public void TypeOfRequest.setName(String name) {
        this.name = name;
    }
    
    public Integer TypeOfRequest.getQty() {
        return this.qty;
    }
    
    public void TypeOfRequest.setQty(Integer qty) {
        this.qty = qty;
    }
    
    public String TypeOfRequest.getTool() {
        return this.tool;
    }
    
    public void TypeOfRequest.setTool(String tool) {
        this.tool = tool;
    }
    
    public FaRequest TypeOfRequest.getFaRequest() {
        return this.faRequest;
    }
    
    public void TypeOfRequest.setFaRequest(FaRequest faRequest) {
        this.faRequest = faRequest;
    }
    
}