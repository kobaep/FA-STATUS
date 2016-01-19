// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.DocumentHistory;
import com.foamtec.qa.domain.DocumentHistoryDataOnDemand;
import com.foamtec.qa.domain.FaRequestDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DocumentHistoryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DocumentHistoryDataOnDemand: @Component;
    
    private Random DocumentHistoryDataOnDemand.rnd = new SecureRandom();
    
    private List<DocumentHistory> DocumentHistoryDataOnDemand.data;
    
    @Autowired
    FaRequestDataOnDemand DocumentHistoryDataOnDemand.faRequestDataOnDemand;
    
    public DocumentHistory DocumentHistoryDataOnDemand.getNewTransientDocumentHistory(int index) {
        DocumentHistory obj = new DocumentHistory();
        setActionType(obj, index);
        setCreateBy(obj, index);
        setCreateDate(obj, index);
        setReason(obj, index);
        setStatus(obj, index);
        return obj;
    }
    
    public void DocumentHistoryDataOnDemand.setActionType(DocumentHistory obj, int index) {
        String actionType = "actionType_" + index;
        obj.setActionType(actionType);
    }
    
    public void DocumentHistoryDataOnDemand.setCreateBy(DocumentHistory obj, int index) {
        String createBy = "createBy_" + index;
        obj.setCreateBy(createBy);
    }
    
    public void DocumentHistoryDataOnDemand.setCreateDate(DocumentHistory obj, int index) {
        Date createDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreateDate(createDate);
    }
    
    public void DocumentHistoryDataOnDemand.setReason(DocumentHistory obj, int index) {
        String reason = "reason_" + index;
        obj.setReason(reason);
    }
    
    public void DocumentHistoryDataOnDemand.setStatus(DocumentHistory obj, int index) {
        String status = "status_" + index;
        obj.setStatus(status);
    }
    
    public DocumentHistory DocumentHistoryDataOnDemand.getSpecificDocumentHistory(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        DocumentHistory obj = data.get(index);
        Long id = obj.getId();
        return DocumentHistory.findDocumentHistory(id);
    }
    
    public DocumentHistory DocumentHistoryDataOnDemand.getRandomDocumentHistory() {
        init();
        DocumentHistory obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return DocumentHistory.findDocumentHistory(id);
    }
    
    public boolean DocumentHistoryDataOnDemand.modifyDocumentHistory(DocumentHistory obj) {
        return false;
    }
    
    public void DocumentHistoryDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = DocumentHistory.findDocumentHistoryEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'DocumentHistory' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<DocumentHistory>();
        for (int i = 0; i < 10; i++) {
            DocumentHistory obj = getNewTransientDocumentHistory(i);
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
            data.add(obj);
        }
    }
    
}