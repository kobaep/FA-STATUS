package com.foamtec.qa.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.springframework.roo.addon.json.RooJson;
import javax.persistence.OrderBy;
import com.foamtec.qa.security.AppUser;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class FaRequest {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    private Date createDate;

    /**
     */
    private String faNumber;

    /**
     */
    private String productGroup;

    /**
     */
    private String apqpNumber;

    /**
     */
    private String quatationWorkSheet;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    private Date needDate;

    /**
     */
    private String customer;

    /**
     */
    private String projectOwner;

    /**
     */
    private String partNumber;

    /**
     */
    private String revision;

    /**
     */
    private String documentRequest;

    /**
     */
    private String status;

    /**
     */
    private String flow;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    private Date engWorkCommitDate;

    /**
     */
    private String process;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    private Date engSendWorkDate;

    /**
     */
    private String actionBy;

    /**
     */
    private String engReson;

    /**
     */
    private String faReson;

    /**
     */
    private String engApprovel;

    /**
     */
    private String faApprovel;

    /**
     */
    private String saleApprovel;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "faRequest")
    private Set<Material> materials = new HashSet<Material>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "faRequest")
    private Set<TypeOfRequest> typeOfRequest = new HashSet<TypeOfRequest>();

    /**
     */
    @OneToOne(fetch = FetchType.EAGER)
    private Tooling tooling;

    /**
     */
    @OrderBy("createDate")
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "faRequest")
    private Set<DocumentHistory> documentHistorys = new HashSet<DocumentHistory>();

    /**
     */
    private String mat1;

    /**
     */
    private String mat2;

    /**
     */
    private String mat3;

    /**
     */
    private String batchMat1;

    /**
     */
    private String batchMat2;

    /**
     */
    private String batchMat3;

    /**
     */
    @OneToOne(fetch = FetchType.EAGER)
    private AppUser createBy;
}
