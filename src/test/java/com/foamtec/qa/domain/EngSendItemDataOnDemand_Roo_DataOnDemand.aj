// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.domain;

import com.foamtec.qa.domain.EngSendItem;
import com.foamtec.qa.domain.EngSendItemDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect EngSendItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EngSendItemDataOnDemand: @Component;
    
    private Random EngSendItemDataOnDemand.rnd = new SecureRandom();
    
    private List<EngSendItem> EngSendItemDataOnDemand.data;
    
    public EngSendItem EngSendItemDataOnDemand.getNewTransientEngSendItem(int index) {
        EngSendItem obj = new EngSendItem();
        setItemPcs(obj, index);
        setMoldNumber(obj, index);
        return obj;
    }
    
    public void EngSendItemDataOnDemand.setItemPcs(EngSendItem obj, int index) {
        Integer itemPcs = new Integer(index);
        obj.setItemPcs(itemPcs);
    }
    
    public void EngSendItemDataOnDemand.setMoldNumber(EngSendItem obj, int index) {
        String moldNumber = "moldNumber_" + index;
        obj.setMoldNumber(moldNumber);
    }
    
    public EngSendItem EngSendItemDataOnDemand.getSpecificEngSendItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        EngSendItem obj = data.get(index);
        Long id = obj.getId();
        return EngSendItem.findEngSendItem(id);
    }
    
    public EngSendItem EngSendItemDataOnDemand.getRandomEngSendItem() {
        init();
        EngSendItem obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return EngSendItem.findEngSendItem(id);
    }
    
    public boolean EngSendItemDataOnDemand.modifyEngSendItem(EngSendItem obj) {
        return false;
    }
    
    public void EngSendItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = EngSendItem.findEngSendItemEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'EngSendItem' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<EngSendItem>();
        for (int i = 0; i < 10; i++) {
            EngSendItem obj = getNewTransientEngSendItem(i);
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
