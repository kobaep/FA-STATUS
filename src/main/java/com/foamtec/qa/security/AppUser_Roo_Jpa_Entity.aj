// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.security;

import com.foamtec.qa.security.AppUser;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect AppUser_Roo_Jpa_Entity {
    
    declare @type: AppUser: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long AppUser.id;
    
    @Version
    @Column(name = "version")
    private Integer AppUser.version;
    
    public Long AppUser.getId() {
        return this.id;
    }
    
    public void AppUser.setId(Long id) {
        this.id = id;
    }
    
    public Integer AppUser.getVersion() {
        return this.version;
    }
    
    public void AppUser.setVersion(Integer version) {
        this.version = version;
    }
    
}
