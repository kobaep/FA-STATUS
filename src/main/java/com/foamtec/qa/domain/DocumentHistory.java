package com.foamtec.qa.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.beans.factory.annotation.Value;
import com.foamtec.qa.security.AppUser;
import javax.persistence.OneToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class DocumentHistory {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    private Date createDate;

    /**
     */
    private String actionType;

    /**
     */
    private String status;

    /**
     */
    private String reason;

    /**
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "faRequest")
    private FaRequest faRequest;

    /**
     */
    private String moldNumber;

    /**
     */
    @Value("0")
    private Integer itemPcs;

    /**
     */
    @OneToOne(fetch = FetchType.EAGER)
    private AppUser createBy;
}
