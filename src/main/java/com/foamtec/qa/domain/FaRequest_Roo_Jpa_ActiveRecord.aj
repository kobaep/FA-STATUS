// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.FaRequest;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FaRequest_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager FaRequest.entityManager;
    
    public static final List<String> FaRequest.fieldNames4OrderClauseFilter = java.util.Arrays.asList("createDate", "faNumber", "productGroup", "apqpNumber", "quatationWorkSheet", "needDate", "customer", "projectOwner", "partNumber", "revision", "documentRequest", "status", "flow", "engWorkCommitDate", "process", "engSendWorkDate", "actionBy", "engReson", "faReson", "engApprovel", "faApprovel", "saleApprovel", "materials", "typeOfRequest", "tooling", "documentHistorys", "mat1", "mat2", "mat3", "batchMat1", "batchMat2", "batchMat3", "createBy", "saleRemark", "saleCoSendWorkTo");
    
    public static final EntityManager FaRequest.entityManager() {
        EntityManager em = new FaRequest().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long FaRequest.countFaRequests() {
        return entityManager().createQuery("SELECT COUNT(o) FROM FaRequest o", Long.class).getSingleResult();
    }
    
    public static List<FaRequest> FaRequest.findAllFaRequests() {
        return entityManager().createQuery("SELECT o FROM FaRequest o", FaRequest.class).getResultList();
    }
    
    public static List<FaRequest> FaRequest.findAllFaRequests(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM FaRequest o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, FaRequest.class).getResultList();
    }
    
    public static FaRequest FaRequest.findFaRequest(Long id) {
        if (id == null) return null;
        return entityManager().find(FaRequest.class, id);
    }
    
    public static List<FaRequest> FaRequest.findFaRequestEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM FaRequest o", FaRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<FaRequest> FaRequest.findFaRequestEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM FaRequest o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, FaRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void FaRequest.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void FaRequest.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            FaRequest attached = FaRequest.findFaRequest(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void FaRequest.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void FaRequest.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public FaRequest FaRequest.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        FaRequest merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
