package com.foamtec.qa.web;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by kopeeno on 1/12/2016 AD.
 */
public aspect AppUserController_Custom_Controller {

    @RequestMapping(value = "/index", produces = "text/html")
    public String AppUserController.index() {
        return "foamtec-index";
    }
}
