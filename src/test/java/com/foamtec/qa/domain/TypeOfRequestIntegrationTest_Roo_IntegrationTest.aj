// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.TypeOfRequest;
import com.foamtec.qa.domain.TypeOfRequestDataOnDemand;
import com.foamtec.qa.domain.TypeOfRequestIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TypeOfRequestIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TypeOfRequestIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TypeOfRequestIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TypeOfRequestIntegrationTest: @Transactional;
    
    @Autowired
    TypeOfRequestDataOnDemand TypeOfRequestIntegrationTest.dod;
    
    @Test
    public void TypeOfRequestIntegrationTest.testCountTypeOfRequests() {
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", dod.getRandomTypeOfRequest());
        long count = TypeOfRequest.countTypeOfRequests();
        Assert.assertTrue("Counter for 'TypeOfRequest' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testFindTypeOfRequest() {
        TypeOfRequest obj = dod.getRandomTypeOfRequest();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to provide an identifier", id);
        obj = TypeOfRequest.findTypeOfRequest(id);
        Assert.assertNotNull("Find method for 'TypeOfRequest' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TypeOfRequest' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testFindAllTypeOfRequests() {
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", dod.getRandomTypeOfRequest());
        long count = TypeOfRequest.countTypeOfRequests();
        Assert.assertTrue("Too expensive to perform a find all test for 'TypeOfRequest', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TypeOfRequest> result = TypeOfRequest.findAllTypeOfRequests();
        Assert.assertNotNull("Find all method for 'TypeOfRequest' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TypeOfRequest' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testFindTypeOfRequestEntries() {
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", dod.getRandomTypeOfRequest());
        long count = TypeOfRequest.countTypeOfRequests();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TypeOfRequest> result = TypeOfRequest.findTypeOfRequestEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TypeOfRequest' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TypeOfRequest' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testFlush() {
        TypeOfRequest obj = dod.getRandomTypeOfRequest();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to provide an identifier", id);
        obj = TypeOfRequest.findTypeOfRequest(id);
        Assert.assertNotNull("Find method for 'TypeOfRequest' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTypeOfRequest(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'TypeOfRequest' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testMergeUpdate() {
        TypeOfRequest obj = dod.getRandomTypeOfRequest();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to provide an identifier", id);
        obj = TypeOfRequest.findTypeOfRequest(id);
        boolean modified =  dod.modifyTypeOfRequest(obj);
        Integer currentVersion = obj.getVersion();
        TypeOfRequest merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'TypeOfRequest' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", dod.getRandomTypeOfRequest());
        TypeOfRequest obj = dod.getNewTransientTypeOfRequest(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TypeOfRequest' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'TypeOfRequest' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TypeOfRequestIntegrationTest.testRemove() {
        TypeOfRequest obj = dod.getRandomTypeOfRequest();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TypeOfRequest' failed to provide an identifier", id);
        obj = TypeOfRequest.findTypeOfRequest(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TypeOfRequest' with identifier '" + id + "'", TypeOfRequest.findTypeOfRequest(id));
    }
    
}
