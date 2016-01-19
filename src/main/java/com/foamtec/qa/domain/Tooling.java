package com.foamtec.qa.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.beans.factory.annotation.Value;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Tooling {

    /**
     */
    private String toolingType;

    /**
     */
    @Value("0")
    private Integer carvity;

    /**
     */
    private String vendorName;
}
