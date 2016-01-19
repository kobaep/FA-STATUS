package com.foamtec.qa.web;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

/**
 * Created by kopeeno on 1/5/2016 AD.
 */
@Controller
public class MainController {
    @RequestMapping(value = "/", produces = "text/html")
    public String saleRequest(Model uiModel) {
        return "foamtec-index";
    }
}
