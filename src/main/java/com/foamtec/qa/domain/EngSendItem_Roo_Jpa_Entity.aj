// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.EngSendItem;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect EngSendItem_Roo_Jpa_Entity {
    
    declare @type: EngSendItem: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long EngSendItem.id;
    
    @Version
    @Column(name = "version")
    private Integer EngSendItem.version;
    
    public Long EngSendItem.getId() {
        return this.id;
    }
    
    public void EngSendItem.setId(Long id) {
        this.id = id;
    }
    
    public Integer EngSendItem.getVersion() {
        return this.version;
    }
    
    public void EngSendItem.setVersion(Integer version) {
        this.version = version;
    }
    
}
