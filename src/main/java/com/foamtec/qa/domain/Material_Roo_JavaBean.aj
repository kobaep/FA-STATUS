// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.FaRequest;
import com.foamtec.qa.domain.Material;

privileged aspect Material_Roo_JavaBean {
    
    public String Material.getName() {
        return this.name;
    }
    
    public void Material.setName(String name) {
        this.name = name;
    }
    
    public String Material.getBatchNumber() {
        return this.batchNumber;
    }
    
    public void Material.setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }
    
    public FaRequest Material.getFaRequest() {
        return this.faRequest;
    }
    
    public void Material.setFaRequest(FaRequest faRequest) {
        this.faRequest = faRequest;
    }
    
}
