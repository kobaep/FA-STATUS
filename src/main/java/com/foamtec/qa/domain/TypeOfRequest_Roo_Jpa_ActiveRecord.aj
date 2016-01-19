// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.TypeOfRequest;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TypeOfRequest_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TypeOfRequest.entityManager;
    
    public static final List<String> TypeOfRequest.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "qty", "tool", "faRequest");
    
    public static final EntityManager TypeOfRequest.entityManager() {
        EntityManager em = new TypeOfRequest().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TypeOfRequest.countTypeOfRequests() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TypeOfRequest o", Long.class).getSingleResult();
    }
    
    public static List<TypeOfRequest> TypeOfRequest.findAllTypeOfRequests() {
        return entityManager().createQuery("SELECT o FROM TypeOfRequest o", TypeOfRequest.class).getResultList();
    }
    
    public static List<TypeOfRequest> TypeOfRequest.findAllTypeOfRequests(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM TypeOfRequest o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, TypeOfRequest.class).getResultList();
    }
    
    public static TypeOfRequest TypeOfRequest.findTypeOfRequest(Long id) {
        if (id == null) return null;
        return entityManager().find(TypeOfRequest.class, id);
    }
    
    public static List<TypeOfRequest> TypeOfRequest.findTypeOfRequestEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TypeOfRequest o", TypeOfRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<TypeOfRequest> TypeOfRequest.findTypeOfRequestEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM TypeOfRequest o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, TypeOfRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TypeOfRequest.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TypeOfRequest.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TypeOfRequest attached = TypeOfRequest.findTypeOfRequest(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TypeOfRequest.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TypeOfRequest.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TypeOfRequest TypeOfRequest.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TypeOfRequest merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
