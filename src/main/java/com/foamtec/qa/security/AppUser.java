package com.foamtec.qa.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class AppUser {

    /**
     */
    @Column(unique = true)
    private String username;

    /**
     */
    private String password;

    /**
     */
    private String name;

    /**
     */
    private String department;

    /**
     */
    private String departmentCode;

    /**
     */
    private String emailAddress;

    /**
     */
    private String phoneNumber;

    /**
     */
    @NotNull
    @Value("1")
    private Integer enabled;

    /**
     */
    private String roleName;
}
