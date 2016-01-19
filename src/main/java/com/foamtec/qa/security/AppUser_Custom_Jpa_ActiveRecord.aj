package com.foamtec.qa.security;

import com.foamtec.qa.domain.FaRequest;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by kopeeno on 1/13/2016 AD.
 */
public aspect AppUser_Custom_Jpa_ActiveRecord {

    public static AppUser AppUser.findByUserName(String username) {
        EntityManager em = FaRequest.entityManager();
        Criteria c = ((Session)em.getDelegate()).createCriteria(AppUser.class);
        Criterion case1 = Restrictions.eq("username", username);
        c.add(case1);
        return (AppUser) c.uniqueResult();
    }
}
