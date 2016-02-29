package com.foamtec.qa.domain;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Date;

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

    public static List<FaRequest> FaRequest.findByStartDateEndDateAndStatus(Date start, Date end, String statusSearch) {
        EntityManager em = FaRequest.entityManager();
        Criteria c = ((Session)em.getDelegate()).createCriteria(FaRequest.class);
        Criterion case1 = Restrictions.between("createDate", start, end);
        Criterion case2 = Restrictions.like("projectOwner", statusSearch);
        Criterion case3 = Restrictions.like("customer", statusSearch);
        Criterion case4 = Restrictions.like("partNumber", statusSearch);
        Criterion case5 = Restrictions.like("faNumber", statusSearch);
        c.createCriteria("createBy", "a");
        Criterion case6 = Restrictions.or(case2, case3, case4, case5, Restrictions.like("a.name", statusSearch));

        c.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        c.add(Restrictions.and(case1,case6));
        return c.list();
    }

    public static List<FaRequest> FaRequest.findByStartDateEndDateStatusAndCreateBy(Date start, Date end, String statusSearch, String createBy) {
        EntityManager em = FaRequest.entityManager();
        Criteria c = ((Session)em.getDelegate()).createCriteria(FaRequest.class);
        Criterion case1 = Restrictions.between("createDate", start, end);
        Criterion case2 = Restrictions.like("projectOwner", statusSearch);
        Criterion case3 = Restrictions.like("customer", statusSearch);
        Criterion case4 = Restrictions.like("partNumber", statusSearch);
        Criterion case5 = Restrictions.like("faNumber", statusSearch);
        c.createCriteria("createBy", "a");
        Criterion case6 = Restrictions.or(case2, case3, case4, case5);

        c.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        c.add(Restrictions.and(case1,case6,Restrictions.like("a.username", createBy)));
        return c.list();
    }
}
