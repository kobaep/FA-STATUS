package com.foamtec.qa.web;

import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.foamtec.qa.security.AppUser;

import java.security.Principal;

/**
 * Created by kopeeno on 1/12/2016 AD.
 */
public aspect AppUserController_Custom_Controller_Json {

    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AppUserController.getData(Principal principal) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONObject jsonObject = new JSONObject();
            AppUser appUser = AppUser.findByUserName(principal.getName());
            jsonObject.put("name",appUser.getName());
            jsonObject.put("roleName",appUser.getRoleName());
            return new ResponseEntity<String>(jsonObject.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
