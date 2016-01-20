package com.foamtec.qa.domain;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by kopeeno on 1/7/2016 AD.
 */
public aspect FaRequest_Custom_Jpa_ActiveRecord {

    public static List<FaRequest> FaRequest.findByWorkFlowAndStatus(String workFlow, String status) {
        EntityManager em = FaRequest.entityManager();
        Criteria c = ((Session)em.getDelegate()).createCriteria(FaRequest.class);
        Criterion case1 = Restrictions.eq("flow", workFlow);
        Criterion case2 = Restrictions.eq("status", status);
        c.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        c.add(Restrictions.and(case1,case2));
        return c.list();
    }

    public static List<FaRequest> FaRequest.findByWorkFlowAndStatusAndPart(String workFlow, String status, String partNUmber) {
        EntityManager em = FaRequest.entityManager();
        Criteria c = ((Session)em.getDelegate()).createCriteria(FaRequest.class);
        Criterion case1 = Restrictions.eq("flow", workFlow);
        Criterion case2 = Restrictions.eq("status", status);
        Criterion case3 = Restrictions.like("partNumber", partNUmber);
        c.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        c.add(Restrictions.and(case1,case2,case3));
        return c.list();
    }
}
