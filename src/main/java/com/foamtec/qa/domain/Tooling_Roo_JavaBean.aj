// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.Tooling;

privileged aspect Tooling_Roo_JavaBean {
    
    public String Tooling.getToolingType() {
        return this.toolingType;
    }
    
    public void Tooling.setToolingType(String toolingType) {
        this.toolingType = toolingType;
    }
    
    public Integer Tooling.getCarvity() {
        return this.carvity;
    }
    
    public void Tooling.setCarvity(Integer carvity) {
        this.carvity = carvity;
    }
    
    public String Tooling.getVendorName() {
        return this.vendorName;
    }
    
    public void Tooling.setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }
    
}